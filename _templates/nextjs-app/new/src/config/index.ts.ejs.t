export const config = {
  apiUrl: process.env.NEXT_PUBLIC_API_URL,
  environment: process.env.NODE_ENV,
  isProduction: process.env.NODE_ENV === 'production',
} 