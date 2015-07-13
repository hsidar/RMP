class RaccoonsController < ApplicationController
  before_action :set_raccoon, only: [:show, :edit, :update, :destroy]
  before_action :set_furniture, only: [:show, :edit]
  before_filter :authenticate_user!, except: [:index, :show, :about]

  # GET /raccoons
  # GET /raccoons.json
  def index
    @raccoons = Raccoon.all
  end

  def about
  end

  def mine
    if Raccoon.where(user_id: current_user.id).length == 0
      flash[:warning] = 'You have not documented anything.'
      redirect_to new_raccoon_path
    else
      @raccoons = Raccoon.where(user_id: current_user.id)
    end
  end


  # GET /raccoons/new
  def new
    if current_user.raccoon_limit >= 3
      flash[:danger] = 'Raccoon limit reached. Manage your raccoon data from the "Raccoon Data Management Panel".'
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

    if current_user.raccoon_limit >= 3
      flash[:danger] = 'Raccoon limit reached. Manage your raccoon data from the "Raccoon Data Management Panel".'
      redirect_to root_path
    else
      user = User.find(current_user.id)
      user.update_attribute(:raccoon_limit, (user.raccoon_limit + 1))

      @raccoon = Raccoon.new(raccoon_params)

      respond_to do |format|
        if @raccoon.save
          flash[:success] = 'Raccoon documented! Thanks for being one of the good guys!'
          format.html { redirect_to root_path }
          format.json { render :show, status: :created, location: @raccoon }
        else
          format.html { render :new }
          format.json { render json: @raccoon.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /raccoons/1
  # PATCH/PUT /raccoons/1.json
  def update
    respond_to do |format|
      if @raccoon.update(raccoon_params)
        flash["success"] = 'Raccoon updated! ... That was weird.'
        format.html { redirect_to '/mine' }
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

    user = User.find(current_user.id)
    if user.raccoon_limit > 0
      user.update_attribute(:raccoon_limit, (user.raccoon_limit - 1))
    end

    @raccoon.destroy
    respond_to do |format|
      format.html { redirect_to '/mine', flash[:notice] = { class: 'alert-danger', body: 'Raccoon was successfully destroyed.' } }
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
