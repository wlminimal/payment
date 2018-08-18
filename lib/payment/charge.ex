defmodule Payment.Charge do
  alias Stripe.Charge, as: StripeCharge

  @doc """
  Create a Charge
  changes = %{"amount" => "4000",
              "customer" => "stripe_id",
              "description" => "description",
              "currency" => "usd"}
  """
  def create_charge(changes, opts \\ []) do
    StripeCharge.create(changes, opts)
  end

  def retrieve_charge(charge_id, opts \\ []) do
    StripeCharge.retrieve(charge_id, opts)
  end
end
