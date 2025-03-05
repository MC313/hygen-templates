'use client'

import { useState, useEffect } from 'react'

const USER_ID_KEY = 'todo_user_id'

export function useUserId() {
  const [userId, setUserId] = useState<string | null>(null)
  const [isLoading, setIsLoading] = useState(true)

  useEffect(() => {
    async function getUserId() {
      try {
        // Check localStorage first
        const storedUserId = localStorage.getItem(USER_ID_KEY)
        
        if (storedUserId) {
          setUserId(storedUserId)
          setIsLoading(false)
          return
        }
        
        // If no user ID in localStorage, create a new one
        const response = await fetch('/api/user', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
        })
        
        if (!response.ok) {
          throw new Error('Failed to create user ID')
        }
        
        const data = await response.json()
        const newUserId = data.userId
        
        // Store in localStorage
        localStorage.setItem(USER_ID_KEY, newUserId)
        setUserId(newUserId)
      } catch (error) {
        console.error('Error getting user ID:', error)
      } finally {
        setIsLoading(false)
      }
    }
    
    getUserId()
  }, [])
  
  return { userId, isLoading }
} 