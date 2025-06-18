class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def index
    @payments = Payment.includes(:booking).all
  end

  def show; end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      redirect_to @payment, notice: "Payment created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @payment.update(payment_params)
      redirect_to @payment, notice: "Payment updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @payment.destroy
    redirect_to payments_path, notice: "Payment deleted."
  end

  private

  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:booking_id, :payment_type, :payment_status)
  end
end