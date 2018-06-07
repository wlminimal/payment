defmodule Payment.Charge do
  alias Stripe.Charge

  @doc """
  Create a Charge
  changes = %{"amount" => "4000", "source" => "token", "description" => "description"}
  """
  def create_charge(changes, opts \\ []) do
    Charge.create(changes, opts)
  end
end
