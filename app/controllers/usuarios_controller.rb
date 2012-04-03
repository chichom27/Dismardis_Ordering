class UsuariosController < ApplicationController
  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usuarios }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usuario }
    end
  end
  
  def login
    if request.post? and params[:Usuario]
      @usuario = Usuario.new(params[:Usuario])
      usuario = Usuario.find_by_Username_and_Password(@usuario.Username,@usuario.Password)
      if usuario
        session[:Usuario_id] = usuario.id
        session[:Usuario_idTP] = usuario.idTipoUsuario
        flash[:notice] = "Usuario #{usuario.Username} ha ingresado exitosamente."
        redirect_to  :action => "index", :controller => "home"  
      else
        @usuario.Password = nil
        flash[:notice] = "Ingreso erroneo"
      end
    end
  end

  def logout
    session[:Usuario_id] = nil
    flash[:notice] = "Ha salido del sistema"
    redirect_to :action => "index", :controller => "home"
  end

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(params[:usuario])

    respond_to do |format|
      if @usuario.save
        #Se quito ya que los usuarios no se registran, admin los crea
        #session[:Usuario_id] = @usuario.id
        format.html { redirect_to @usuario, notice: 'Usuario fue creado exitosamente.' }
        format.json { render json: @usuario, status: :created, location: @usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to @usuario, notice: 'Usuario fue actualizado existosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to usuarios_url }
      format.json { head :no_content }
    end
  end
end
