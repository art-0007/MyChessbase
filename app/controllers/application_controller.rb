# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pagy::Backend
  include Authentication
  include Authorization
  include ErrorHandling
  include CheckingSolution
  include Sorting
end
