class SupportsController < ApplicationController

  # GET /supports
  # GET /supports.json
  def index
    supports = Support.all
    render(json: supports, status: 200)
  end

  # GET /supports/1
  # GET /supports/1.json
  def show
    support= Support.find_by_id params[:id]
    if support!= nil
      render(json: support, status: 200)   
    else
      head 404
    end 
  end

  # POST /supports
  # POST /supports.json
  def create
    support= Support.new
    support.detalle=params[:detalle]
    support.estado=params[:estado]
    support.titulo=params[:titulo]
    support.clients_id=params[:clients_id]
    support.users_id=params[:users_id]
    if support.valid? && Client.exists?(support.clients_id)  
      if support.users_id != nil
        if User.exists?(support.users_id)
          if support.save
            render(json: support, status: 201 , location: support)
          else
            render(json: support.errors, status: 422)
          end  
        else
            render(json: support.errors, status: 422)
        end  
      elsif support.save
        render(json: support, status: 201 , location: support)
      end
    else 
      render(json: support.errors, status: 422)
    end
  end

  # PATCH/PUT /supports/1
  # PATCH/PUT /supports/1.json
   def update
    support= Support.find_by_id params[:id]
    if support!= nil
      support.titulo=params[:titulo] ? params[:titulo]: support.titulo
      support.detalle=params[:detalle] ? params[:detalle]: support.detalle
      support.estado=params[:estado] ? params[:estado]: support.estado
      support.clients_id=params[:clients_id] ? params[:clients_id] : support.clients_id
      support.users_id=params[:users_id]
      if support.valid? && Client.exists?(support.clients_id)  
        if support.users_id != nil
          if User.exists?(support.users_id)
            if support.save
              render(json: support, status: 201 , location: support)
            else
              render(json: support.errors, status: 422)
            end  
          else
              render(json: support.errors, status: 422)
          end  
        elsif support.save
          render(json: support, status: 201 , location: support)
        end
      else 
        render(json: support.errors, status: 422)
      end
    else 
      render(json: support.errors, status: 422)
    end
  end

  # DELETE /supports/1
  # DELETE /supports/1.json
  def destroy
   support=Support.find_by_id(params[:id])
    if support != nil
      if support.destroy
        head 204
      end
    else
       head 404
    end
  end
end
