class OwnersController < ApplicationController

before_action :find_by, only: [:show, :edit, :update, :destroy]

  def index
    @owners = Owner.all
  end

  def show
    @own_d = @owner.dogs
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.create(owner_params)

    if @owner.valid?
      redirect_to owner_path(@owner)
    else
      flash[:errors] = @owner.errors.full_messages
      redirect_to new_owner_path
    end #end of if stmt

  end #end of method

  def edit

  end

  def update
    @owner.update(owner_params)

    if @owner.valid?
      redirect_to owner_path(@owner)
    else
      flash[:errors] = @owner.errors.full_messages
      redirect_to edit_owner_path
    end #end of if stmt

  end #end of method

  def destroy
    @owner.destroy
    redirect_to owners_path
  end


private

  def owner_params
    params.require(:owner).permit(:name, :age)
  end

  def find_by
    @owner = Owner.find_by(id: params[:id])
  end

end #end of class
