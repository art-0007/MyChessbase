class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include Pagy::Backend
    include Authentication
    include ErrorHandling
    include CheckingSolutions
end