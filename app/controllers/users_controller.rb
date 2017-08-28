class UsersController < ApplicationController
  def index
    user= User.all
    render(json: user, status: 200)
  end

  def show
    user= User.find_by_id(params[:id])
    if user!= nil
      render(json: user, status: 200)   
    else
      render(json: user.errors, status: 404)
    end    
  end

  def create
    user= User.new
    user.nombre=params[:nombre]
    user.apellido=params[:apellido]
    user.username=params[:username]
    user.password=params[:password]
    
    if user.save
      render(json: user, status: 201 , location: user)
    else 
      render(json: user.errors, status: 422)
    end
  end

  def update
    user=User.find_by_id params[:id]
    if user!= nil
      user.nombre=params[:nombre] ? params[:nombre]: user.nombre
      user.apellido=params[:apellido] ? params[:apellido]: user.apellido
     user.username=params[:username] ? params[:username]: user.username
     user.password=params[:password] ? params[:password]: user.password
      if user.save
        render(json: user, status: 201)
      end   
    else
      render(json: user.errors, status: 404)
    end    
  end

  def destroy
    user=User.find_by_id(params[:id])
    if user != nil
      if user.destroy
        head 204
      end
    else
       head 404
    end
  end

end
