class EstadoPedidosController < ApplicationController
  # GET /estado_pedidos
  # GET /estado_pedidos.json
  def index
    @estado_pedidos = EstadoPedido.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @estado_pedidos }
    end
  end

  # GET /estado_pedidos/1
  # GET /estado_pedidos/1.json
  def show
    @estado_pedido = EstadoPedido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @estado_pedido }
    end
  end

  # GET /estado_pedidos/new
  # GET /estado_pedidos/new.json
  def new
    @estado_pedido = EstadoPedido.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @estado_pedido }
    end
  end

  # GET /estado_pedidos/1/edit
  def edit
    @estado_pedido = EstadoPedido.find(params[:id])
  end

  # POST /estado_pedidos
  # POST /estado_pedidos.json
  def create
    @estado_pedido = EstadoPedido.new(params[:estado_pedido])

    respond_to do |format|
      if @estado_pedido.save
        format.html { redirect_to @estado_pedido, notice: 'Estado pedido was successfully created.' }
        format.json { render json: @estado_pedido, status: :created, location: @estado_pedido }
      else
        format.html { render action: "new" }
        format.json { render json: @estado_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /estado_pedidos/1
  # PUT /estado_pedidos/1.json
  def update
    @estado_pedido = EstadoPedido.find(params[:id])

    respond_to do |format|
      if @estado_pedido.update_attributes(params[:estado_pedido])
        format.html { redirect_to @estado_pedido, notice: 'Estado pedido was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @estado_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_pedidos/1
  # DELETE /estado_pedidos/1.json
  def destroy
    @estado_pedido = EstadoPedido.find(params[:id])
    @estado_pedido.destroy

    respond_to do |format|
      format.html { redirect_to estado_pedidos_url }
      format.json { head :no_content }
    end
  end
end
