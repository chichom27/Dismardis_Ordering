class ProveedorsController < ApplicationController
  before_filter :check_permissions
  
  # GET /proveedors
  # GET /proveedors.json
  def index
    
      @proveedors = Proveedor.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proveedors }
    end
  end

  # GET /proveedors/1
  # GET /proveedors/1.json
  def show
    @proveedor = Proveedor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proveedor }
    end
  end

  # GET /proveedors/new
  # GET /proveedors/new.json
  def new
    @proveedor = Proveedor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proveedor }
    end
  end

  # GET /proveedors/1/edit
  def edit
    @proveedor = Proveedor.find(params[:id])
  end

  # POST /proveedors
  # POST /proveedors.json
  def create
    @proveedor = Proveedor.new(params[:proveedor])
    
    @proveedor.codigo = (@proveedor.Nombre[0,3]).upcase
    @codigos = Proveedor.count(:all, :conditions => ["codigo LIKE ?" ,@proveedor.codigo] )
    
    
    
    if @codigos > 0
      @proveedor.codigo = @proveedor.codigo + Proveedor.codigoHelper(@codigos)
    end
    
    
    if @codigos > 26
      flash[:notice] = "Demasiados proveedores con este codigo, por favor contactese con el administrador del sistema." 
      redirect_to  :action => "index", :controller => "proveedors" 
      return  
    end
    
    respond_to do |format|
      if @proveedor.save
        format.html { redirect_to proveedors_path, notice: 'Proveedor fue creado exitosamente.' }
        format.json { render json: @proveedor, status: :created, location: @proveedor }
      else
        format.html { render action: "new" }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proveedors/1
  # PUT /proveedors/1.json
  def update
    @proveedor = Proveedor.find(params[:id])

    respond_to do |format|
      if @proveedor.update_attributes(params[:proveedor])
        format.html { redirect_to @proveedor, notice: 'Proveedor fue actualizado existosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proveedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proveedors/1
  # DELETE /proveedors/1.json
  def destroy
    @proveedor = Proveedor.find(params[:id])
    @proveedor.destroy

    respond_to do |format|
      format.html { redirect_to proveedors_url }
      format.json { head :no_content }
    end
  end
  
  private
    def check_permissions
      if session[:Usuario_idTP] == 3 || session[:Usuario_idTP] == 4
        redirect_to  :controller => 'home', :action => 'forbidden'
        return
      end
      if session[:Usuario_idTP] == 2 && self.action_name == 'destroy'
        redirect_to  :controller => 'home', :action => 'forbidden'
        return
      end
    end
end
