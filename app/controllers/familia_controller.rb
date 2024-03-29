class FamiliaController < ApplicationController
  before_filter :check_permissions
  
  # GET /familia
  # GET /familia.json
  def index
    @familia = Familium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @familia }
    end
  end

  # GET /familia/1
  # GET /familia/1.json
  def show
    @familium = Familium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @familium }
    end
  end

  # GET /familia/new
  # GET /familia/new.json
  def new
    @familium = Familium.new
    @numCategs = Categorium.count

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @familium }
    end
  end

  # GET /familia/1/edit
  def edit
    @familium = Familium.find(params[:id])
  end

  # POST /familia
  # POST /familia.json
  def create
    @familium = Familium.new(params[:familium])

    respond_to do |format|
      if @familium.save
        format.html { redirect_to familia_path, notice: 'Familia fue creada exitosamente.' }
        format.json { render json: @familium, status: :created, location: @familium }
      else
        format.html { render action: "new" }
        format.json { render json: @familium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /familia/1
  # PUT /familia/1.json
  def update
    @familium = Familium.find(params[:id])

    respond_to do |format|
      if @familium.update_attributes(params[:familium])
        format.html { redirect_to @familium, notice: 'Familia fue actualizada existosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @familium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /familia/1
  # DELETE /familia/1.json
  def destroy
    @familium = Familium.find(params[:id])
    @familium.destroy

    respond_to do |format|
      format.html { redirect_to familia_url }
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
