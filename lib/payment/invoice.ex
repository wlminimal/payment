defmodule Payment.Invoice do
  alias Stripe.Invoice

  @doc """
  changes = %{customer: customer_id,
             subscription: subscription_id,
             subscription_items: [%{plan: plan_id}],
             subscription_proration_date: current_date}
  returns
  {:ok, %Stripe.Invocies{}}
  """
  def upcoming_invoice(customer_id, subscription_id, plan_id, current_date, opts \\ []) do
    changes = %{customer: customer_id,
             subscription: subscription_id,
             subscription_items: [%{plan: plan_id}],
             subscription_proration_date: current_date}
    Invoice.upcoming(changes, opts)
  end

  def list_invoices(customer_id) do
    Invoice.list(%{customer: customer_id})
  end

  # def calculate_proration_cost(invoice) do
  #   proration_date = DateTime.to_unix(DateTime.utc_now)
  #   {:ok, %Stripe.Invoice{lines: %Stripe.List{data: data}}} = invoice
  #   data
  #   |> Enum.find(& &1.period.start == proration_date)

  #   current_prorations = for ii <- invoice.lines.data, ii.period.start == proration_date, do: ii
  #   cost = for(p <- current_prorations, do: p.amount) |> Enum.sum()
  # end
end
