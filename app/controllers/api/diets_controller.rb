module Api
    class DietsController < ApplicationController
      before_action :set_user
      before_action :set_diet, only: [:show, :update, :destroy]
  
      def index
        @diets = @user.diets
        render json: @diets
      end
  
      def show
        @diet = @user.diets.find(params[:id])
        render json: @diet
      end
  
      def create
        @diet = @user.diets.new(diet_params)
  
        if @diet.save
          render json: @diet, status: :created
        else
          render json: @diet.errors, status: :unprocessable_entity
        end
      end
  
      def update
        if @diet.update(diet_params)
          render json: @diet
        else
          render json: @diet.errors, status: :unprocessable_entity
        end
      end
  
      def destroy
        @diet.destroy
        head :no_content
      end
  
      private
  
      def set_user
        @user = User.find(params[:user_id])
      end
  
      def set_diet
        @diet = @user.diets.find(params[:id])
      end
  
      def diet_params
        params.require(:diet).permit(:name, :calories, :ingredients, :method)
      end
    end
  end
  