class UsuariosController < ApplicationController
  require 'digest/sha1'
  
  before_filter :check_permissions
  
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
      usuario = Usuario.find_by_Username_and_Password(@usuario.Username,Digest::SHA1.hexdigest(@usuario.Password))
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
  
  def nuevo_gerente
    @usuario = Usuario.new

    respond_to do |format|
      format.html # nuevo_gerente.html.erb
      format.json { render json: @usuario }
    end
  end
  
  def nuevo_cajero
    @usuario = Usuario.new

    respond_to do |format|
      format.html # nuevo_cajero.html.erb
      format.json { render json: @usuario }
    end
  end
  
  def nuevo_cliente
    @usuario = Usuario.new

    respond_to do |format|
      format.html # nuevo_cliente.html.erb
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
    @usuario.codigo = (@usuario.Nombre[0,1] + @usuario.Apellido[0,3]).upcase
    @codigos = Usuario.count(:all, :conditions => ["codigo LIKE ?" ,@usuario.codigo] )
    
    
    
    if @codigos > 0
      @usuario.codigo = @usuario.codigo + Usuario.codigoHelper(@codigos)
    end
    
    
    if @codigos > 26
      flash[:notice] = "Demasiados usuarios con este codigo, por favor contactese con el administrador del sistema." 
      redirect_to  :action => "index", :controller => "usuarios" 
      return  
    end
    tempPassword = @usuario.Password
    @usuario.Password = Digest::SHA1.hexdigest(@usuario.Password)
    respond_to do |format|
      if @usuario.save
        @usuario.Password = tempPassword
        UsuarioMailer.welcome_email(@usuario).deliver
        #Se quito ya que los usuarios no se registran, admin los crea
        #session[:Usuario_id] = @usuario.id
        format.html { redirect_to usuarios_path, notice: 'Usuario fue creado exitosamente.' }
        format.json { render json: @usuario, status: :created, location: @usuario }
      else
        case @usuario.idTipoUsuario.to_s
          when "2"
            format.html { render action: "nuevo_gerente" }
            format.json { render json: @usuario.errors, status: :unprocessable_entity }
          when "3"
            format.html { render action: "nuevo_cajero" }
            format.json { render json: @usuario.errors, status: :unprocessable_entity }
          when "4"
            format.html { render action: "nuevo_cliente" }
            format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
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
  
  def cambiar_password 
    @usuario = Usuario.find(session[:Usuario_id]) 
    if request.post?  #{@person.attributes.inspect}
      usuario = Usuario.find_by_Username_and_Password(@usuario.Username,Digest::SHA1.hexdigest(params[:Usuario][:current_password]))
      if usuario
        if (params[:Usuario][:password] == params[:Usuario][:password_confirmation])
          usuario.Password = Digest::SHA1.hexdigest(params[:Usuario][:password])
          #return render :text => "The object is #{params[:Usuario][:current_password]}" +
          #"<br>  #{params[:Usuario][:password]}"+
          #"<br>  #{params[:Usuario][:password_confirmation]}"
          respond_to do |format|
            if usuario.update_attributes(:Password => Digest::SHA1.hexdigest(params[:Usuario][:password]))
              @usuario.Password = params[:Usuario][:password]
              UsuarioMailer.cambio_password_email(@usuario).deliver
              format.html { redirect_to usuario, notice: 'Su password fue actualizada existosamente.' }
              format.json { head :no_content }
              #flash[:notice] = "Se ha actualizado su password."
              #redirect_to usuario
            else
              format.html { render action: "cambiar_password" }
              format.json { render json: @usuario.errors, status: :unprocessable_entity }
            end
          end
        else
          flash[:notice] = "Passwords ingresadas no coinciden."
          redirect_to  :action => "cambiar_password", :controller => "usuarios"  
        end
      else
        @usuario.Password = nil
        flash[:notice] = "Password erroneo"
      end
    end 
  end
  #end cambiar_password
  
  
  private
    def check_permissions
      if (self.action_name != 'logout' && self.action_name != 'login')
        if session[:Usuario_idTP] == 3 && (self.action_name != 'show' && self.action_name != 'index')
          redirect_to  :controller => 'home', :action => 'forbidden'
          return
        end
        if session[:Usuario_idTP] == 4 && (self.action_name == 'destroy' || self.action_name == 'nuevo_gerente' || self.action_name == 'nuevo_cajero' || self.action_name == 'nuevo_cliente' || self.action_name == 'new' || self.action_name == 'create' || self.action_name == 'index' || self.action_name == 'edit')
          redirect_to  :controller => 'home', :action => 'forbidden'
          return
        else
          if session[:Usuario_idTP] == 4 && (self.action_name != 'cambiar_password' && (session[:Usuario_id].to_s != params[:id].to_s))
            redirect_to  :controller => 'home', :action => 'forbidden'
            return
          end
        end
        if session[:Usuario_idTP] == 2 && self.action_name == 'destroy'
          redirect_to  :controller => 'home', :action => 'forbidden'
          return
        end
        if session[:Usuario_idTP] == 2 && self.action_name == 'new'
          redirect_to  :controller => 'home', :action => 'forbidden'
          return
        end
      end
    end 
end
