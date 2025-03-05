---
to: <%= projectName %>/src/features/todos/components/__tests__/todo-filter.test.tsx
---
import { render, screen, fireEvent } from "@testing-library/react"
import { TodoFilterTabs } from "../todo-filter"
import { TODO_FILTERS } from "@/features/todos/constants"

// Mock Next.js navigation hooks
jest.mock("next/navigation", () => ({
	useSearchParams: () => new URLSearchParams("filter=all"),
	usePathname: () => "/",
	useRouter: () => ({
		push: jest.fn(),
	}),
}))

describe("TodoFilterTabs", () => {
	it("renders all filter options", () => {
		render(<TodoFilterTabs />)
		
		// Check that all filter options are rendered
		Object.values(TODO_FILTERS).forEach((label) => {
			expect(screen.getByText(label)).toBeInTheDocument()
		})
	})
	
	it("highlights the current filter", () => {
		render(<TodoFilterTabs />)
		
		// The "All" button should have the active class
		const allButton = screen.getByText("All")
		expect(allButton).toHaveClass("bg-white")
		
		// Other buttons should not have the active class
		const activeButton = screen.getByText("Active")
		expect(activeButton).not.toHaveClass("bg-white")
	})
	
	it("calls router.push when a filter is clicked", () => {
		const pushMock = jest.fn()
		jest.spyOn(require("next/navigation"), "useRouter").mockImplementation(() => ({
			push: pushMock,
		}))
		
		render(<TodoFilterTabs />)
		
		// Click the "Active" filter
		fireEvent.click(screen.getByText("Active"))
		
		// Check that router.push was called with the correct URL
		expect(pushMock).toHaveBeenCalledWith("/?filter=active")
	})
}) 