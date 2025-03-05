---
to: <%= projectName %>/src/lib/session.ts
---
import 'server-only'
import { cookies } from 'next/headers'
import { db } from '@/lib/db'
import { createHash, randomBytes } from 'crypto'

export class SessionService {
  private static COOKIE_NAME = 'session_id'
  private static SESSION_DURATION = 24 * 60 * 60 * 1000 // 24 hours

  static async createSession(userId: string) {
    const sessionId = randomBytes(32).toString('hex')
    const expiresAt = new Date(Date.now() + this.SESSION_DURATION)
    
    await db.insert(sessions).values({
      id: sessionId,
      userId,
      expiresAt: expiresAt.toISOString(),
    })

    // Set secure cookie
    cookies().set(this.COOKIE_NAME, sessionId, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      expires: expiresAt,
    })

    return sessionId
  }

  static async getSession() {
    const sessionId = cookies().get(this.COOKIE_NAME)?.value
    if (!sessionId) return null

    const session = await db.query.sessions.findFirst({
      where: eq(sessions.id, sessionId),
    })

    if (!session || new Date(session.expiresAt) < new Date()) {
      await this.deleteSession(sessionId)
      return null
    }

    return session
  }

  static async deleteSession(sessionId: string) {
    await db.delete(sessions).where(eq(sessions.id, sessionId))
    cookies().delete(this.COOKIE_NAME)
  }
} 