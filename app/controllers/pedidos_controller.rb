class PedidosController < ApplicationController
  #@@items
  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.find(:all, :conditions =>  ["id_usuario = ? ", session[:Usuario_id]])
    #@pedidos = Pedido.count( :conditions =>  ["idUsuario = ? ", session[:Usuario_id]])
    #Pedido.where('idUsuario = ?', session[:Usuario_id]).all
    #@pedidos = Pedido.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pedidos }
    end
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    @pedido = Pedido.find(params[:id])
    @items = Item.find(:all, :conditions =>  ["pedido_id = ? ", params[:id]])
    @sumTot = 0
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pedido }
    end
  end

  # GET /pedidos/new
  # GET /pedidos/new.json
  def new
    @pedido = Pedido.new
    
    
    
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pedido }
    end
  end

  # GET /pedidos/1/edit
  def edit
    @pedido = Pedido.find(params[:id])
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(params[:pedido])
    @sumTot = 0
    respond_to do |format|
      if @pedido.save
        params[:items].each do |item|
          if item[1].to_i > 0
            #item2 = Producto.first(:all, :conditions =>  ["id = ? ", item[:id]])
            #item2 = Item.new(Integer(item[:id]),session[:Usuario_id],Integer(item[:value]))
            item2 = Item.new
            item2.pedido_id = @pedido.id
            item2.producto_id = item[0].to_i
            item2.cantidad = item[1].to_i
            @sumTot += (item2.cantidad * item2.prod.Precio)
            item2.save
          end
        end
        @sumTot = @sumTot - (@sumTot * @pedido.user.Descuento)
        params[:pedido][:Total] = @sumTot
        if !(@pedido.update_attributes(params[:pedido]))
          format.html { render action: "new" }
          format.json { render json: @pedido.errors, status: :unprocessable_entity }
        end
        format.html { redirect_to @pedido, notice: 'El pedido fue creado exitosamente.' }
        format.json { render json: @pedido, status: :created, location: @pedido }
      else
        format.html { render action: "new" }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pedidos/1
  # PUT /pedidos/1.json
  def update
    @pedido = Pedido.find(params[:id])

    respond_to do |format|
      if @pedido.update_attributes(params[:pedido])
        format.html { redirect_to @pedido, notice: 'El pedido fue actualizado existosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to pedidos_url }
      format.json { head :no_content }
    end
  end
end
