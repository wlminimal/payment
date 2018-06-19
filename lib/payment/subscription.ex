defmodule Payment.Subscription do

  alias Stripe.Subscription

  @type t :: Stripe.Subscription

  # if customer has no payment info redirect to payment page

  @doc """
  changes = %{customer: "customer_id", plan: "plan_id"}
  """
  @spec create_subscription(map, Keyword.t) :: {:ok, t} | {:error, Stripe.api_error_struct}
  def create_subscription(changes, opts \\ []) do
    Subscription.create(changes, opts)
  end

  def retrieve_subscription(id, opts \\ []) do
    Subscription.retrieve(id, opts)
  end

  @doc """
  id : subscription id
  changes : %{"plan" => "pricing plan id"}
  """
  def update_subscription(id, changes, opts \\ []) do
    Subscription.update(id, changes, opts)
  end

  def list_subscription(params \\ %{}, opts \\ []) do
    Subscription.list(params, opts)
  end

  @doc """
  customer = %Stripe.Custoerm{}
  returns subscription_id
  """
  def get_subscription_id(customer) do
    %{subscriptions: %{data: [ %{id: id}]}} = customer
    id
  end

  @doc """
  cancel subscription immediately with no params
  if you want to cancel at period end time do this
  %{"at_period_end" => true}
  """
  def cancel_subscription(subscription_id, params \\ %{}) do
    Subscription.delete(subscription_id, params)
  end
end
