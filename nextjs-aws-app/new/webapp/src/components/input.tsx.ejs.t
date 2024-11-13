---
to: <%= projectName %>/webapp/src/components/input.tsx
---
import { InputHTMLAttributes, forwardRef } from "react"
import { cn } from "@/utils/tailwindcss/combineClassNames"

interface InputProps extends InputHTMLAttributes<HTMLInputElement> {
  label?: string
  error?: string
  id: string
}

export const Input = forwardRef<HTMLInputElement, InputProps>(
  ({ className, label, error, id, "aria-describedby": ariaDescribedby, ...props }, ref) => {
    const errorId = `${id}-error`
    const describedBy = error
      ? `${errorId} ${ariaDescribedby || ""}`
      : ariaDescribedby

    return (
      <div className="w-full">
        {label && (
          <label
            htmlFor={id}
            className="block text-sm font-medium text-gray-700 dark:text-gray-200 mb-1"
          >
            {label}
          </label>
        )}
        <input
          ref={ref}
          id={id}
          aria-invalid={error ? "true" : "false"}
          aria-describedby={describedBy}
          className={cn(
            "w-full px-3 py-2 border rounded-md transition-colors duration-200",
            "focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent",
            "disabled:opacity-50 disabled:cursor-not-allowed",
            error
              ? "border-red-500 focus:ring-red-500"
              : "border-gray-300 dark:border-gray-700",
            className,
          )}
          {...props}
        />
        {error && (
          <p id={errorId} className="mt-1 text-sm text-red-500" role="alert">
            {error}
          </p>
        )}
      </div>
    )
  }
)

Input.displayName = "Input" 