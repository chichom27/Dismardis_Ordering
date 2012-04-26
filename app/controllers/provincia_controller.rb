class ProvinciaController < ApplicationController
  before_filter :check_permissions
  
  # GET /provincia
  # GET /provincia.json
  def index
    @provincia = Provincium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @provincia }
    end
  end

  # GET /provincia/1
  # GET /provincia/1.json
  def show
    @provincium = Provincium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @provincium }
    end
  end

  # GET /provincia/new
  # GET /provincia/new.json
  def new
    @provincium = Provincium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @provincium }
    end
  end

  # GET /provincia/1/edit
  def edit
    @provincium = Provincium.find(params[:id])
  end

  # POST /provincia
  # POST /provincia.json
  def create
    @provincium = Provincium.new(params[:provincium])

    respond_to do |format|
      if @provincium.save
        format.html { redirect_to @provincium, notice: 'Provincia fue creada exitosamente.' }
        format.json { render json: @provincium, status: :created, location: @provincium }
      else
        format.html { render action: "new" }
        format.json { render json: @provincium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /provincia/1
  # PUT /provincia/1.json
  def update
    @provincium = Provincium.find(params[:id])

    respond_to do |format|
      if @provincium.update_attributes(params[:provincium])
        format.html { redirect_to @provincium, notice: 'Provincia fue actualizada existosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @provincium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provincia/1
  # DELETE /provincia/1.json
  def destroy
    @provincium = Provincium.find(params[:id])
    @provincium.destroy

    respond_to do |format|
      format.html { redirect_to provincia_url }
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
