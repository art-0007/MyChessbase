# frozen_string_literal: true

module Admin
  class UsersController < ApplicationController
    before_action :require_current_user

    def index
      @pagy, @users = pagy User.order(created_at: :asc)
    end
  end
end
