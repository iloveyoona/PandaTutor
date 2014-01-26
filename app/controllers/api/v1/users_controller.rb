module Api
  module V1
    
class UsersController < ApplicationController
 
   before_filter :fetch_user, :except => [:index, :create]
  respond_to :json, :xml
  def show
    respond_to do |format|
      format.json { render json: @user }
      format.xml { render xml: @user }
    end
  end

 def fetch_user
    @user = User.find_by_id(params[:id])
  end

  def index
    @users = User.where("name = ? or university = ? or grade = ?", params[:name], params[:email], params[:grade])
    respond_to do |format|
      format.json { render json: @users }
      format.xml { render xml: @users }
    end
  end

  def new
  end
  

end
  end
end
