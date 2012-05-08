class CategoriaController < ApplicationController
  before_filter :check_permissions

  
  
  # GET /categoria
  # GET /categoria.json
  def index
    @categoria = Categorium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categoria }
    end
  end

  # GET /categoria/1
  # GET /categoria/1.json
  def show
    
    @categorium = Categorium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categorium }
    end
  end

  # GET /categoria/new
  # GET /categoria/new.json
  def new
    @categorium = Categorium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @categorium }
    end
  end

  # GET /categoria/1/edit
  def edit
    @categorium = Categorium.find(params[:id])
  end

  # POST /categoria
  # POST /categoria.json
  def create
    @categorium = Categorium.new(params[:categorium])

    respond_to do |format|
      if @categorium.save
        format.html { redirect_to @categorium, notice: 'Categoria fue creada exitosamente.' }
        format.json { render json: @categorium, status: :created, location: @categorium }
      else
        format.html { render action: "new" }
        format.json { render json: @categorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categoria/1
  # PUT /categoria/1.json
  def update
    @categorium = Categorium.find(params[:id])

    respond_to do |format|
      if @categorium.update_attributes(params[:categorium])
        format.html { redirect_to categoria_path , notice: 'Categoria fue actualizada existosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @categorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria/1
  # DELETE /categoria/1.json
  def destroy
    @categorium = Categorium.find(params[:id])
    @categorium.destroy

    respond_to do |format|
      format.html { redirect_to categoria_url }
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
