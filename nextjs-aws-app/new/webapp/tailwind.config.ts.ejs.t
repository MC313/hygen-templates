---
to: <%= projectName %>/webapp/tailwind.config.ts
---

import type { Config } from "tailwindcss"

const config: Config = {
	content: ["./src/**/*.{js,ts,jsx,tsx,mdx}"],
	theme: {
		extend: {
			colors: {
				primary: {
					DEFAULT: "var(--color-primary)",
					light: "var(--color-primary-light)",
					dark: "var(--color-primary-dark)",
				},
				secondary: {
					DEFAULT: "var(--color-secondary)",
					light: "var(--color-secondary-light)",
					dark: "var(--color-secondary-dark)",
				},
			},
		},
	},
	plugins: [],
}

export default config
