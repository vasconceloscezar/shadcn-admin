export interface Task {
  id: string
  title: string
  description?: string
  status: 'todo' | 'in progress' | 'done' | 'canceled' | 'backlog'
  label?: 'bug' | 'feature' | 'documentation'
  priority: 'low' | 'medium' | 'high'
  assigneeId?: string
  dueDate?: Date
  createdAt: Date
  updatedAt: Date
}

export type CreateTaskInput = Omit<Task, 'id' | 'createdAt' | 'updatedAt'>
export type UpdateTaskInput = Partial<CreateTaskInput>
