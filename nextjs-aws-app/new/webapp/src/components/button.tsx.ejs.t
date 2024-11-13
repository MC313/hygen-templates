---
to: <%= projectName %>/webapp/src/components/button.tsx
---
import { ButtonHTMLAttributes, forwardRef } from "react"
import { cn } from "@/utils/tailwindcss/combineClassNames"

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: "primary" | "secondary"
  isLoading?: boolean
}

export const Button = forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant = "primary", isLoading, children, disabled, ...props }, ref) => {
    return (
      <button
        ref={ref}
        disabled={isLoading || disabled}
        aria-busy={isLoading ? "true" : "false"}
        className={cn(
          "px-4 py-2 rounded-md font-medium transition-colors relative",
        "w-full rounded-lg transition-all duration-200 transform hover:scale-[1.02] hover:shadow-lg",
          "focus:outline-none focus:ring-2 focus:ring-offset-2",
          "disabled:opacity-50 disabled:cursor-not-allowed",
          variant === "primary" && [
            "bg-primary text-white",
            "hover:bg-primary-dark",
            "focus:ring-primary-dark",
          ],
          variant === "secondary" && [
            "bg-secondary text-gray-900",
            "hover:bg-secondary-dark",
            "focus:ring-secondary-dark",
          ],
          className,
        )}
        {...props}
      >
        {isLoading && (
          <span className="absolute inset-0 flex items-center justify-center" aria-hidden="true">
            <svg className="animate-spin h-5 w-5" viewBox="0 0 24 24" fill="none">
              <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
              <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
            </svg>
          </span>
        )}
        <span className={cn(isLoading && "opacity-0")}>{children}</span>
      </button>
    )
  }
)

Button.displayName = "Button" 