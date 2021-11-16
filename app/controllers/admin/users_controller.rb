# frozen_string_literal: true

module Admin
  class UsersController < BaseController
    before_action :require_current_user
    before_action :set_user!, only: %i[edit update destroy]
    before_action :authorize_user!
    after_action :verify_authorized

    def index
      @pagy, @users = pagy User.order(created_at: :asc)
    end

    def edit; end

    def update
      if @user.update user_params
        flash[:success] = 'User updated!'
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      flash[:success] = 'User deleted!'
      redirect_to admin_users_path
    end

    private

    def set_user!
      @user = User.find params[:id]
    end

    def authorize_user!
      authorize(@user || User)
    end

    def user_params
      params
        .require(:user)
        .permit(:email, :name, :password, :password_confirmation, :role)
    end
  end
end
