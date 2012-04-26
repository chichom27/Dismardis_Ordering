class PedidosController < ApplicationController
  before_filter :check_permissions
  
  #@@items
  # GET /pedidos
  # GET /pedidos.json
  def index
    if session[:Usuario_idTP] == 4
      @pedidos = Pedido.find(:all, :conditions =>  ["id_usuario = ? ", session[:Usuario_id]])
    else
      @pedidos = Pedido.all
    end
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
    @numPedidos = Pedido.count(:all, :conditions =>  ["id_usuario = ? ", session[:Usuario_id]])
    @usuario = Usuario.find(session[:Usuario_id])
    numPed_s = (@numPedidos + 1).to_s
    
    if ((@numPedidos + 1) > 99999)
      #add more stuff here
      return
    end
    
    case numPed_s.length
      when 1
        numPed_s = "0000" + numPed_s 
      when 2
        numPed_s = "000" + numPed_s 
      when 3
        numPed_s = "00" + numPed_s 
      when 4
        numPed_s = "0" + numPed_s
    end 
    
    params[:pedido][:Codigo] = @usuario.codigo + "-" + numPed_s
    
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
        #render :action => "new"
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
  
  private
    def check_permissions
      if session[:Usuario_idTP] != 4 && (self.action_name == 'new' || self.action_name == 'create')
        redirect_to  :controller => 'home', :action => 'forbidden'
        return
      end
      if session[:Usuario_idTP] == 3 && (self.action_name != 'show' && self.action_name != 'index')
        redirect_to  :controller => 'home', :action => 'forbidden'
        return
      end
      if session[:Usuario_idTP] == 4 && self.action_name == 'destroy'
        redirect_to  :controller => 'home', :action => 'forbidden'
        return
      end
      if session[:Usuario_idTP] == 4 && (self.action_name != 'index' && self.action_name != 'new' && self.action_name != 'create')
        @pedido = Pedido.find(params[:id])
        if @pedido.user.id.to_s != session[:Usuario_id].to_s
          redirect_to  :controller => 'home', :action => 'forbidden'
          return
        end
      end
      if session[:Usuario_idTP] == 2 && self.action_name == 'destroy'
        redirect_to  :controller => 'home', :action => 'forbidden'
        return
      end
    end
    
end
