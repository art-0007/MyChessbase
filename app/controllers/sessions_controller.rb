class SessionsController < ApplicationController
    before_action :require_current_user, only: :destroy
    before_action :require_no_current_user, only: %i[new create]
  
    
    def new
        
    end

    def create
        user = User.find_by(email: params[:email].downcase)
        if user&.authenticate(params[:password])
          sign_in user
          flash[:success] = "Welcome back, #{current_user.name_or_email}!"
          redirect_to root_path
        else
          flash.now[:warning] = "Incorrect email and/or password!"
          render 'new'
        end
    end

    def omni_sign_in
      binding.pry
      @user = User.find_by(email: auth["info"]["email"])
      if @user
        sign_in @user
        flash[:success] = "Welcome back, #{current_user.name_or_email}!"
        redirect_to root_path
      else
        @user = User.new(email: auth["info"]["email"])
        @user.password = SecureRandom.hex(10)
        @user.name = auth['info']['name']
          if @user.save
              sign_in @user
              flash[:success] = "Welcome to the app, #{current_user.name_or_email}!"
              redirect_to root_path
          else
            render 'new'
          end
      end
    end
    
    def destroy
      sign_out
      flash[:success] = "See you later!"
      redirect_to root_path
    end

    private

    def auth
      request.env['omniauth.auth']  
    end

end
