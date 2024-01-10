module Api
    class DietsController < ApplicationController
      before_action :set_user
      before_action :set_diet, only: [:show, :update, :destroy]
  
      # GET /api/users/:user_id/diets
      def index
        @diets = @user.diets
        render json: @diets
      end
  
      # GET /api/users/:user_id/diets/1
      def show
        render json: @diet
      end
  
      # POST /api/users/:user_id/diets
      def create
        @diet = @user.diets.new(diet_params)
  
        if @diet.save
          render json: @diet, status: :created
        else
          render json: @diet.errors, status: :unprocessable_entity
        end
      end
  
      # PATCH/PUT /api/users/:user_id/diets/1
      def update
        if @diet.update(diet_params)
          render json: @diet
        else
          render json: @diet.errors, status: :unprocessable_entity
        end
      end
  
      # DELETE /api/users/:user_id/diets/1
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
        params.require(:diet).permit(:name, :calories)
      end
    end
  end
  