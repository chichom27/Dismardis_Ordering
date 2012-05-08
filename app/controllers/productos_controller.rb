class ProductosController < ApplicationController
  before_filter :check_permissions
  
  # GET /productos
  # GET /productos.json
  def index
    #@productos

    if session[:Usuario_idTP] == 1 ||  session[:Usuario_idTP] == 2
      @productos = Producto.all
    else
      @productos = Producto.find(:all, :conditions => ["estado = ?" , true ] )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productos }
    end
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
    @producto = Producto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @producto }
    end
  end

  # GET /productos/new
  # GET /productos/new.json
  def new
    @producto = Producto.new
    @numFami = Familium.count
    @numProv = Proveedor.count
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @producto }
    end
  end

  # GET /productos/1/edit
  def edit
    @producto = Producto.find(params[:id])
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(params[:producto])
    if ( /^[\d]+(\.[\d]+){0,1}$/ === @producto.Precio )
      @producto.Precio = number_with_precision( @producto.Precio , :precision => 2)
    end
    respond_to do |format|
      if @producto.save
        format.html { redirect_to productos_path, notice: 'El producto fue creado exitosamente.' }
        format.json { render json: @producto, status: :created, location: @producto }
      else
        format.html { render action: "new" }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /productos/1
  # PUT /productos/1.json
  def update
    @producto = Producto.find(params[:id])
    if ( /^[\d]+(\.[\d]+){0,1}$/ === @producto.Precio )
      @producto.Precio = number_with_precision( @producto.Precio , :precision => 2)
    end
    respond_to do |format|
      if @producto.update_attributes(params[:producto])
        format.html { redirect_to @producto, notice: 'El producto fue actualizado existosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @producto = Producto.find(params[:id])
    @producto.destroy

    respond_to do |format|
      format.html { redirect_to productos_url }
      format.json { head :no_content }
    end
  end
  
  private
    def check_permissions
      if (session[:Usuario_idTP] == 3 || session[:Usuario_idTP] == 4) && (self.action_name != 'index' && self.action_name != 'show')
        redirect_to  :controller => 'home', :action => 'forbidden'
        return
      end
      if session[:Usuario_idTP] == 2 && self.action_name == 'destroy'
        redirect_to  :controller => 'home', :action => 'forbidden'
        return
      end
    end
end
