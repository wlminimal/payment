defmodule Payment.Plan do
  alias Stripe.Plan

  @type t :: Stripe.Plan

  @doc """
  Return
  {:ok,
    %Stripe,List{
      data: [
        %Stripe.Plan{
          amount: 10000
          etc...
        }
      ]
    }}
  """
  @spec list_plan(map, Keyword.t) :: {:ok, Stripe.List.t} | {:error, Stripe.api_error_struct}
  def list_plan(params \\ %{}, opts \\ []) do
    Plan.list(params, opts)
  end

  @doc """
  Find plan id by plan name and return
  %Stripe.Plan{
    amount:
    name:
    id: ...
  }
  """
  def get_plan_by_name(plan_name) do
    {:ok, %Stripe.List{ data: plans }} = list_plan()
    plans = plans
      |> Enum.find(& &1.name == plan_name)
    plans
  end

  def get_plan_by_id(plan_id) do
    {:ok, %Stripe.List{ data: plans }} = list_plan()
    plans = plans
      |> Enum.find(& &1.id == plan_id)
    plans
  end
end
