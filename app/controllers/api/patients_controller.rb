module Api
    class PatientsController < ApplicationController
      before_action :set_user
      before_action :set_patient, only: [:show, :update, :destroy]
  
      def index
        @patients = @user.patients
        render json: @patients
      end
  
      def show
        render json: @patient
      end
  
      def create
        @patient = @user.patients.new(patient_params)
  
        if @patient.save
          render json: @patient, status: :created
        else
          render json: @patient.errors, status: :unprocessable_entity
        end
      end
  
      def update
        if @patient.update(patient_params)
          render json: @patient
        else
          render json: @patient.errors, status: :unprocessable_entity
        end
      end
  
      def destroy
        @patient.destroy
        head :no_content
      end
  
      private
  
      def set_user
        @user = User.find(params[:user_id])
      end
  
      def set_patient
        @patient = @user.patients.find(params[:id])
      end
  
      def patient_params
        params.require(:patient).permit(:name)
      end
    end
  end