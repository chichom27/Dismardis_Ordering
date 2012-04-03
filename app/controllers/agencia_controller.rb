class AgenciaController < ApplicationController
  # GET /agencia
  # GET /agencia.json
  def index
    @agencia = Agencium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agencia }
    end
  end

  # GET /agencia/1
  # GET /agencia/1.json
  def show
    @agencium = Agencium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agencium }
    end
  end

  # GET /agencia/new
  # GET /agencia/new.json
  def new
    @agencium = Agencium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agencium }
    end
  end

  # GET /agencia/1/edit
  def edit
    @agencium = Agencium.find(params[:id])
  end

  # POST /agencia
  # POST /agencia.json
  def create
    @agencium = Agencium.new(params[:agencium])

    respond_to do |format|
      if @agencium.save
        format.html { redirect_to @agencium, notice: 'Agencium was successfully created.' }
        format.json { render json: @agencium, status: :created, location: @agencium }
      else
        format.html { render action: "new" }
        format.json { render json: @agencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agencia/1
  # PUT /agencia/1.json
  def update
    @agencium = Agencium.find(params[:id])

    respond_to do |format|
      if @agencium.update_attributes(params[:agencium])
        format.html { redirect_to @agencium, notice: 'Agencium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencia/1
  # DELETE /agencia/1.json
  def destroy
    @agencium = Agencium.find(params[:id])
    @agencium.destroy

    respond_to do |format|
      format.html { redirect_to agencia_url }
      format.json { head :no_content }
    end
  end
end
