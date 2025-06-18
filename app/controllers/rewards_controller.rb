class RewardsController < ApplicationController
  before_action :set_reward, only: [:show, :edit, :update, :destroy]

  def index
    @rewards = Reward.all
  end

  def show; end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      redirect_to @reward, notice: "Reward created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @reward.update(reward_params)
      redirect_to @reward, notice: "Reward updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reward.destroy
    redirect_to rewards_path, notice: "Reward deleted."
  end

  private

  def set_reward
    @reward = Reward.find(params[:id])
  end

  def reward_params
    params.require(:reward).permit(:user_id, :points, :reward_type)
  end
end