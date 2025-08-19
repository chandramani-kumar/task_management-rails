# In app/controllers/comments_controller.rb
class CommentsController < ApplicationController
    before_action :set_task
  
    # GET /tasks/:task_id/comments
    def index
      render json: @task.comments.order(created_at: :asc)
    end
  
    # POST /tasks/:task_id/comments
    def create
      @comment = @task.comments.new(comment_params)
  
      if @comment.save
        render json: @comment, status: :created
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_task
      @task = Task.find(params[:task_id])
    end
  
    def comment_params
      params.require(:comment).permit(:user_name, :content)
    end
  end