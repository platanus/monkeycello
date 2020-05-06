class UsersController < ApplicationController
  def index
    @users = User.all
    render template: "products/show"
  end
end
