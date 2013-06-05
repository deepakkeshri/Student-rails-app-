#require 'digest/sha1'
class UsersController < ApplicationController
  
  load_and_authorize_resource :except => :menu
  
  def index
     render(:action => 'menu')
  end
  
  def menu
    
  end

  def home
  end
  
  def add
     @user = User.new
  end
  
  def create
     @user = User.new(params[:user])
    if @user.save
      redirect_to(:action => 'list')
    else
      render('add')
    end
  end
  
  def sign_in
    render('list')
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def delete
    @user=User.find(params[:id ])
  end
  
  def show
     @user=User.find(params[:id ])
  end
  
  def list
    @users=User.order("users.name ASC")
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(:action => 'list' )
    else
      flash[:notice]= "Something Went Wrong"
      render('edit')
    end
    
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to(:action => 'list')
  end
  
  def sign_out
    
    #redirect_to(:action => 'menu')
  end
end

