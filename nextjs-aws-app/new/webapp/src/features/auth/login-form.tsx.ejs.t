---
to: <%= projectName %>/webapp/src/features/auth/login-form.tsx
---
"use client"

import React, { useState } from "react"
import { motion } from "framer-motion"
import { Button } from "@/components/button"
import { Input } from "@/components/input"

export function LoginForm() {
  const [formData, setFormData] = useState({
    username: "",
    password: "",
  })

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    console.log("Login attempt:", formData)
  }

  return (
    <motion.div
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: 0.5 }}
      className="w-full max-w-md px-4"
    >
      <div className="relative bg-white rounded-xl shadow-2xl overflow-hidden my-8">
        <div className="absolute bg-secondary" />
        <div className="relative px-8 py-12">
          <div className="text-center mb-10">
            <h2 className="text-3xl font-bold text-gray-900 dark:text-white mb-3">
              Welcome back
            </h2>
            <p className="text-base text-gray-600 dark:text-gray-400">
              Please sign in to continue
            </p>
          </div>

          <form onSubmit={handleSubmit} className="space-y-8">
            <motion.div
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: 0.2 }}
              className="space-y-2"
            >
              <Input
                id="username"
                type="text"
                placeholder="Username"
                value={formData.username}
                onChange={(e) => setFormData({ ...formData, username: e.target.value })}
                className="w-full bg-gray-50 dark:bg-gray-800 border-gray-200 dark:border-gray-700 focus:ring-primary focus:border-primary dark:focus:ring-primary-light dark:focus:border-primary-light"
              />
            </motion.div>

            <motion.div
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: 0.3 }}
              className="space-y-2"
            >
              <Input
                id="password"
                type="password"
                placeholder="Password"
                value={formData.password}
                onChange={(e) => setFormData({ ...formData, password: e.target.value })}
                className="w-full bg-gray-50 dark:bg-gray-800 border-gray-200 dark:border-gray-700 focus:ring-primary focus:border-primary dark:focus:ring-primary-light dark:focus:border-primary-light"
              />
            </motion.div>

            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.4 }}
              className="space-y-6"
            >
              <Button
                type="submit"
                variant="primary"
              >
                Sign In
              </Button>

              <div className="text-center text-sm">
                <a
                  href="#"
                  className="text-primary hover:text-primary-dark dark:text-primary-light dark:hover:text-primary transition-colors duration-200"
                >
                  Forgot your password?
                </a>
              </div>
            </motion.div>
          </form>
        </div>
      </div>
    </motion.div>
  )
} 