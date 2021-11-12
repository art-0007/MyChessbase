# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :require_current_user, only: :destroy
  before_action :require_no_current_user, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      do_sign user
    else
      flash.now[:warning] = 'Incorrect email and/or password!'
      render 'new'
    end
  end

  def omni_sign_in
    user = User.find_by(email: auth['info']['email'])
    if user
      do_sign user
    else
      create_provider_user
    end
  end

  def create_provider_user
    user = User.new(email: auth['info']['email'])
    user.password = SecureRandom.hex(10)
    user.name = auth['info']['name']
    if user.save
      do_sign user
    else
      render 'new'
    end
  end

  def destroy
    forget current_user
    sign_out
    flash[:success] = 'See you later!'
    redirect_to root_path
  end

  private

  def do_sign(user)
    sign_in user
    remember(user) if params[:remember_me] == '1'
    flash[:success] = "Welcome back, #{current_user.name_or_email}!"
    redirect_to root_path
  end

  def auth
    request.env['omniauth.auth']
  end
end
