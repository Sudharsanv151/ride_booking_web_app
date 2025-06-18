class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  def index
    @ratings = Rating.all
  end

  def show; end

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to @rating, notice: "Rating created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @rating.update(rating_params)
      redirect_to @rating, notice: "Rating updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @rating.destroy
    redirect_to ratings_path, notice: "Rating deleted."
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:user_id, :rateable_type, :rateable_id, :stars, :comments)
  end
end