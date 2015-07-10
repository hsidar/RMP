class RaccoonsController < ApplicationController
  before_action :set_raccoon, only: [:show, :edit, :update, :destroy]
  before_action :set_furniture, only: [:show]
  before_filter :authenticate_user!, except: [:index, :show, :about]

  # GET /raccoons
  # GET /raccoons.json
  def index
    @raccoons = Raccoon.all
  end

  def about
  end


  # GET /raccoons/new
  def new
    if current_user.raccoon_limit >= 3
      flash[:notice] = { class: 'alert-danger', body: 'Raccoon limit reached. Manage your raccoon data from the "Raccoon Data Management Panel".' }
      redirect_to root_path
    end
    @raccoon = Raccoon.new
  end

  # GET /raccoons/1/edit
  def edit
  end

  # POST /raccoons
  # POST /raccoons.json
  def create

    user = User.find(current_user.id)
    user.update_attribute(:raccoon_limit, (user.raccoon_limit + 1))

    @raccoon = Raccoon.new(raccoon_params)

    respond_to do |format|
      if @raccoon.save
        format.html { redirect_to root_path, flash[:notice] = { class: 'alert-success', body: 'Raccoon documented! Thanks for being one of the good guys!' } }
        format.json { render :show, status: :created, location: @raccoon }
      else
        format.html { render :new }
        format.json { render json: @raccoon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raccoons/1
  # PATCH/PUT /raccoons/1.json
  def update
    respond_to do |format|
      if @raccoon.update(raccoon_params)
        format.html { redirect_to @raccoon, flash[:notice] = { class: 'alert-success', body: 'Raccoon updated! ... That was weird.' } }
        format.json { render :show, status: :ok, location: @raccoon }
      else
        format.html { render :edit }
        format.json { render json: @raccoon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raccoons/1
  # DELETE /raccoons/1.json
  def destroy
    @raccoon.destroy
    respond_to do |format|
      format.html { redirect_to raccoons_url, notice: 'Raccoon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raccoon
      @raccoon = Raccoon.find(params[:id])
    end

    def set_furniture
      @furniture = Furniture.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raccoon_params
      params.require(:raccoon).permit(:name, :claw_ferocity, :disposition, :avatar, :user_id)
    end
end
