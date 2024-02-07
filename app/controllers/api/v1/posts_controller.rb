class Api::V1::PostsController < ApplicationController
    # GET /api/v1/posts
    swagger_path '/api/v1/posts' do
      operation :get do
        key :summary, 'List all posts'
        key :description, 'Returns all posts'
        key :operationId, 'listPosts'
        key :produces, ['application/json']
        response 200 do
          key :description, 'posts list response'
          schema do
            key :type, :array
            items do
              key :'$ref', :Post
            end
          end
        end
      end
    end
  
    def index
      @posts = Post.all
      render json: @posts
    end
  end