# In app/models/task.rb
class Task < ApplicationRecord
    has_many :comments, dependent: :destroy
  end


# # Generate Active Job classes
# rails generate job SendEmail
# rails g job ProcessPayment
# rails g job CleanupOldRecords

# Creates background job classes for processing tasks asynchronously (emails, file processing, etc.).