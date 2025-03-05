---
to: <%= projectName %>/src/features/todos/components/__tests__/todo-sort.test.tsx
---
import { render, screen, fireEvent } from "@testing-library/react"
import { TodoSort } from "../todo-sort"
import { SORT_FIELD_LABELS } from "@/features/todos/constants"

// Mock Next.js navigation hooks
jest.mock("next/navigation", () => ({
	useSearchParams: () => new URLSearchParams("sortField=createdAt&sortDirection=desc"),
	usePathname: () => "/",
	useRouter: () => ({
		push: jest.fn(),
	}),
}))

describe("TodoSort", () => {
	it("renders all sort options", () => {
		render(<TodoSort />)
		
		// Check that all sort options are rendered
		Object.values(SORT_FIELD_LABELS).forEach((label) => {
			expect(screen.getByText(label)).toBeInTheDocument()
		})
	})
	
	it("highlights the current sort field", () => {
		render(<TodoSort />)
		
		// The "Date Created" button should have the active class
		const createdAtButton = screen.getByText("Date Created")
		expect(createdAtButton).toHaveClass("text-blue-600")
		
		// Other buttons should not have the active class
		const titleButton = screen.getByText("Title")
		expect(titleButton).not.toHaveClass("text-blue-600")
	})
	
	it("calls router.push when a sort field is clicked", () => {
		const pushMock = jest.fn()
		jest.spyOn(require("next/navigation"), "useRouter").mockImplementation(() => ({
			push: pushMock,
		}))
		
		render(<TodoSort />)
		
		// Click the "Title" sort option
		fireEvent.click(screen.getByText("Title"))
		
		// Check that router.push was called with the correct URL
		expect(pushMock).toHaveBeenCalledWith("/?sortField=title&sortDirection=desc")
	})
	
	it("toggles sort direction when clicking the current sort field", () => {
		const pushMock = jest.fn()
		jest.spyOn(require("next/navigation"), "useRouter").mockImplementation(() => ({
			push: pushMock,
		}))
		
		render(<TodoSort />)
		
		// Click the current sort field (Date Created)
		fireEvent.click(screen.getByText("Date Created"))
		
		// Check that router.push was called with the toggled direction
		expect(pushMock).toHaveBeenCalledWith("/?sortField=createdAt&sortDirection=asc")
	})
}) 