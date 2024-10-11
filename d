'use client'

import { useState, useEffect } from 'react'

export default function CountdownTimer() {
  const [timeLeft, setTimeLeft] = useState('')

  useEffect(() => {
    const calculateTimeLeft = () => {
      const now = new Date()
      const eleventh = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 11, 0, 0)
      
      if (now > eleventh) {
        return "🎉 Play! 🎉"
      }

      const difference = eleventh.getTime() - now.getTime()
      const hours = Math.floor((difference / (1000 * 60 * 60)) % 24)
      const minutes = Math.floor((difference / 1000 / 60) % 60)
      const seconds = Math.floor((difference / 1000) % 60)

      return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`
    }

    const timer = setInterval(() => {
      setTimeLeft(calculateTimeLeft())
    }, 1000)

    return () => clearInterval(timer)
  }, [])

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-r from-purple-400 via-pink-500 to-red-500">
      <style jsx global>{`
        @import url('https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap');
        body {
          font-family: 'Fredoka One', cursive;
          margin: 0;
          padding: 0;
        }
      `}</style>
      <div className="text-8xl md:text-9xl lg:text-[10rem] text-white text-center">
        {timeLeft}
      </div>
    </div>
  )
}
