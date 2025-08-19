Rails.application.routes.draw do
  resources :tasks do
  # get '/tasks/comments/:task_id', to: 'comments#index'
  # post '/tasks/comments/:task_id', to: 'comments#create'
    resources :comments, only: [:index, :create]
    # resources :comments, only: [:index, :create], controller: 'my_custom_comments'
  end
end

# This is another example of Rails' "Convention over Configuration" - Rails automatically maps resource names to controller names