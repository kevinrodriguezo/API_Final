class ReunionsController < ApplicationController

  def index
    reunion = Reunion.all
    render(json: reunion, status: 200)
  end

  # GET /reunions/1
  # GET /reunions/1.json
  def show
    reunion= Reunion.find_by_id params[:id]
    if reunion!= nil
      render(json: reunion, status: 200)   
    else
      head 404
    end 
  end

  # POST /reunions
  # POST /reunions.json
  def create
    reunion= Reunion.new
    reunion.titulo=params[:titulo]
    reunion.virtual=params[:virtual] ? params[:virtual] : false 
    reunion.users_id=params[:users_id]
    reunion.clients_id=params[:clients_id]
    if reunion.valid? && Client.exists?(reunion.clients_id)  
      if reunion.users_id != nil
        if User.exists?(reunion.users_id)
          if reunion.save
            render(json: reunion, status: 201 , location: reunion)
          else
            render(json: reunion.errors, status: 422)
          end  
        else
            render(json: reunion.errors, status: 422)
        end  
      elsif reunion.save
        render(json: reunion, status: 201 , location: reunion)
      end
    else 
      render(json: reunion.errors, status: 422)
    end
  end

  # PATCH/PUT /reunions/1
  # PATCH/PUT /reunions/1.json
  def update
    reunion=Reunion.find_by_id params[:id]
    if reunion!= nil
      reunion.titulo=params[:titulo] ? params[:titulo]: reunion.titulo
      reunion.virtual=params[:virtual] ? params[:virtual]: reunion.virtual
      reunion.clients_id=params[:clients_id] ? params[:clients_id] : reunion.clients_id
      reunion.users_id=params[:users_id]
      if reunion.valid? && Client.exists?(reunion.clients_id)  
        if reunion.users_id != nil
          if User.exists?(reunion.users_id)
            if reunion.save
              render(json: reunion, status: 201 , location: reunion)
            else
              render(json: reunion.errors, status: 422)
            end  
          else
              render(json: reunion.errors, status: 422)
          end  
        elsif reunion.save
          render(json: reunion, status: 201 , location: reunion)
        end
      else 
        render(json: reunion.errors, status: 422)
      end
    else 
      render(json: reunion.errors, status: 422)
    end
  end

  # DELETE /reunions/1
  # DELETE /reunions/1.json
  def destroy
   reunion=Reunion.find_by_id(params[:id])
    if reunion != nil
      if reunion.destroy
        head 204
      end
    else
       head 404
    end
  end
end
