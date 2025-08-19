Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      # This should be the URL of your React development server
      origins "http://localhost:3002"
  
      resource "*",
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end