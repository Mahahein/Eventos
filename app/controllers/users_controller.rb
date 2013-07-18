class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
	 @users = User.all
  end
  def new
  end
#def edit
 # end
end
