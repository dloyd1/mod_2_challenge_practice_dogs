class DogsController < ApplicationController

before_action :find_by, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all
  end

  def show
    @dog_o = @dog.owner.name
  end

  def new
    @dog = Dog.new
    @owners = Owner.all
  end

  def create
    @dog = Dog.create(dog_params)

    if @dog.valid?
      redirect_to dog_path(@dog)
    else
      flash[:errors] = @dog.errors.full_messages
      redirect_to new_dog_path
    end #end of if stmt

  end #end of method

  def edit
    @owners = Owner.all
  end

  def update
    @dog.update(dog_params)

    if @dog.valid?
      redirect_to dog_path(@dog)
    else
      flash[:errors] = @dog.errors.full_messages
      redirect_to edit_dog_path
    end #end of if stmt

  end #end of method

  def destroy
    @dog.destroy
    redirect_to dogs_path
  end


private

  def dog_params
    params.require(:dog).permit(:breed, :weight, :owner_id)
  end

  def find_by
    @dog = Dog.find_by(id: params[:id])
  end

end #end of class
