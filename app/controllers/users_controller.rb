class UsersController < ApplicationController
    before_action :require_no_current_user, only: %i[new create]
    before_action :require_current_user, only: %i[show edit update]

    before_action :set_user!, only: %i[show edit update destroy]

    def new
        @user = User.new   
    end

    def create
        @user = User.new(user_params).decorate 
        if @user.save
            sign_in @user
          flash[:success] = "Welcome to the app, #{@user.name_or_email}!"
          redirect_to root_path
        else
          render :new
        end
      end

      def show
       
      end

      def edit
          
      end

      def update
        if @user.update(user_params)
            flash[:notice] = "User was updated!"
            redirect_to root_path
        else
            render :edit
        end     
      end

      def destroy
          @user.destroy
          flash[:notice] = "User was successfully deleted!"
          redirect_to root_path
      end
    
      private

      def set_user!
        @user = User.find(params[:id])   
      end
    
      def user_params
        params
        .require(:user)
        .permit(:name, :email, :password, :password_confirmation, :avatar)
      end
end