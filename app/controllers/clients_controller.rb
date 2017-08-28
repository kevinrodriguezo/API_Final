class ClientsController < ApplicationController
   before_action :set_client, only: [:show, :edit, :update, :destroy]
  def index
    client = Client.all
    render(json: client, status: 200)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    client= Client.find_by_id params[:id]
    if client != nil
      render(json: client, status: 200)   
    else
      head 404
    end 
  end

  # POST /clients
  # POST /clients.json
  def create
    client= Client.new
    client.cedula= params[:cedula]
    client.sector= params[:sector]
    client.nombre= params[:nombre]
    client.telefono= params[:telefono]
    client.pagina= params[:pagina]
    client.direccion= params[:direccion]
    if client.save
      render(json: client, status: 201 , location: client)
    else 
      render(json: client.errors, status: 422)
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    client=Client.find_by_id params[:id]
    if client!= nil
      client.cedula=params[:cedula] ? params[:cedula]: client.cedula
      client.sector=params[:sector] ? params[:sector]: client.sector
      client.nombre=params[:nombre] ? params[:nombre]: client.nombre
      client.telefono=params[:telefono] ? params[:telefono]: client.telefono
      client.pagina=params[:pagina] ? params[:pagina]: client.pagina
      client.direccion=params[:direccion] ? params[:direccion]: client.direccion
      if client.save
        render(json: client, status: 201)
      end   
    else
      render(json: client.errors, status: 404)
    end 
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
   client=Client.find_by_id(params[:id])
    if client != nil
      if client.destroy
        head 204
      end
    else
        head 404
    end
  end
end
