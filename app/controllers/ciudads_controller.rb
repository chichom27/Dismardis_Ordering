class CiudadsController < ApplicationController
  before_filter :check_permissions
  
  # GET /ciudads
  # GET /ciudads.json
  def index
    @ciudads = Ciudad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ciudads }
    end
  end

  # GET /ciudads/1
  # GET /ciudads/1.json
  def show
    @ciudad = Ciudad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ciudad }
    end
  end

  # GET /ciudads/new
  # GET /ciudads/new.json
  def new
    @ciudad = Ciudad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ciudad }
    end
  end

  # GET /ciudads/1/edit
  def edit
    @ciudad = Ciudad.find(params[:id])
  end

  # POST /ciudads
  # POST /ciudads.json
  def create
    @ciudad = Ciudad.new(params[:ciudad])

    respond_to do |format|
      if @ciudad.save
        format.html { redirect_to ciudads_path, notice: 'Ciudad fue creada exitosamente.' }
        format.json { render json: @ciudad, status: :created, location: @ciudad }
      else
        format.html { render action: "new" }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ciudads/1
  # PUT /ciudads/1.json
  def update
    @ciudad = Ciudad.find(params[:id])

    respond_to do |format|
      if @ciudad.update_attributes(params[:ciudad])
        format.html { redirect_to @ciudad, notice: 'Ciudad fue actualizada existosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ciudads/1
  # DELETE /ciudads/1.json
  def destroy
    @ciudad = Ciudad.find(params[:id])
    @ciudad.destroy

    respond_to do |format|
      format.html { redirect_to ciudads_url }
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
