# Task Management API

A RESTful API for managing tasks and comments built with Ruby on Rails. This application provides endpoints for creating, reading, updating, and deleting tasks, as well as adding comments to tasks.

## Features

- ✅ **Task Management**: Create, read, update, delete, and soft-delete tasks
- 💬 **Comments System**: Add comments to tasks with user attribution
- 🔗 **RESTful API**: Clean and intuitive API endpoints
- 🗃️ **Relational Data**: Proper associations between tasks and comments
- 🚀 **CORS Enabled**: Ready for frontend integration
- 📊 **Rich Task Data**: Support for priorities, status, assignees, due dates, and rich text descriptions

## Tech Stack

- **Backend**: Ruby on Rails 7.2
- **Database**: SQLite (development), configurable for production
- **API**: JSON REST API
- **Testing**: Rails Test Suite
- **CORS**: Rack CORS for cross-origin requests

## Prerequisites

- Ruby 3.0+ 
- Rails 7.2+
- SQLite3
- Bundler

## Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/task_management-rails.git
cd task_management-rails
```

### 2. Install Dependencies
```bash
bundle install
```

### 3. Setup Database
```bash
# Create and migrate database
rails db:create
rails db:migrate

# Optional: Seed with sample data
rails db:seed
```

### 4. Start the Server
```bash
rails server
```

The API will be available at `http://localhost:3000`

## API Endpoints

### Tasks

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/tasks` | Get all tasks (excluding soft-deleted) |
| GET | `/tasks/:id` | Get a specific task |
| POST | `/tasks` | Create a new task |
| PUT/PATCH | `/tasks/:id` | Update a task |
| DELETE | `/tasks/:id` | Soft delete a task |

### Comments

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/tasks/:task_id/comments` | Get all comments for a task |
| POST | `/tasks/:task_id/comments` | Create a comment for a task |

## Database Schema

### Tasks Table
```ruby
create_table "tasks" do |t|
  t.string "number", null: false
  t.string "title", null: false
  t.string "status", null: false
  t.string "priority", null: false
  t.string "assignee"
  t.text "description"
  t.text "description_rich_text"
  t.datetime "due_date"
  t.datetime "deleted_at"
  t.timestamps
end
```

### Comments Table
```ruby
create_table "comments" do |t|
  t.text "content"
  t.string "user_name"
  t.integer "task_id", null: false
  t.timestamps
end
```

## API Usage Examples

### Create a Task
```bash
curl -X POST http://localhost:3000/tasks \
  -H "Content-Type: application/json" \
  -d '{
    "task": {
      "number": "TASK-001",
      "title": "Implement user authentication",
      "status": "in_progress",
      "priority": "high",
      "assignee": "john@example.com",
      "description": "Add JWT-based authentication system",
      "due_date": "2024-02-01T10:00:00Z"
    }
  }'
```

### Get All Tasks
```bash
curl http://localhost:3000/tasks
```

### Add a Comment to Task
```bash
curl -X POST http://localhost:3000/tasks/1/comments \
  -H "Content-Type: application/json" \
  -d '{
    "comment": {
      "user_name": "Jane Doe",
      "content": "I think we should use Devise for this task."
    }
  }'
```

### Get Comments for a Task
```bash
curl http://localhost:3000/tasks/1/comments
```

## Sample Response Formats

### Task Response
```json
{
  "id": 1,
  "number": "TASK-001",
  "title": "Implement user authentication",
  "status": "in_progress",
  "priority": "high",
  "assignee": "john@example.com",
  "description": "Add JWT-based authentication system",
  "description_rich_text": null,
  "due_date": "2024-02-01T10:00:00.000Z",
  "deleted_at": null,
  "created_at": "2024-01-15T10:30:00.000Z",
  "updated_at": "2024-01-15T10:30:00.000Z"
}
```

### Comment Response
```json
{
  "id": 1,
  "content": "I think we should use Devise for this task.",
  "user_name": "Jane Doe",
  "task_id": 1,
  "created_at": "2024-01-15T11:00:00.000Z",
  "updated_at": "2024-01-15T11:00:00.000Z"
}
```

## Model Relationships

```ruby
# Task Model
class Task < ApplicationRecord
  has_many :comments, dependent: :destroy
end

# Comment Model
class Comment < ApplicationRecord
  belongs_to :task
end
```

## Key Features

### Soft Delete
Tasks are soft-deleted using the `deleted_at` field, allowing for data recovery and audit trails.

### Nested Resources
Comments are accessed through their parent tasks using RESTful nested routes:
- `/tasks/:task_id/comments`

### CORS Configuration
The API is configured to handle cross-origin requests, making it ready for frontend integration.

## Development

### Running Tests
```bash
rails test
```

### Database Operations
```bash
# Reset database
rails db:reset

# Check migration status
rails db:migrate:status

# Rollback last migration
rails db:rollback
```

### Useful Rails Commands
```bash
# Generate new migration
rails generate migration AddIndexToTasksStatus

# Check routes
rails routes

# Rails console
rails console
```

## Configuration

### Environment Variables
Create a `.env` file for local development:

```
DATABASE_URL
