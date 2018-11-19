class PaymentsController < ApplicationController

  before_action :set_investments

  def new
    @investment.amount_cents = @investment.project.price_cents * @investment.number_of_panels
    @investment.save!
  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
    )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @investment.amount_cents.to_s,
    description:  "Payment for project #{@investment.project.name} for investment #{@investment.id}",
    currency:     @investment.amount.currency
  )

  @investment.update(payment: charge.to_json, state: 'confirmed')
  redirect_to user_investment_path(@investment.user, @investment)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_project_investment_payment_path(@investment.project, @investment)
  end

  private

  def set_investments
    @investment = Investment.find(params[:investment_id])
    authorize @investment
  end
end
