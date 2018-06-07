defmodule Payment.Invoice do
  alias Stripe.Invoice

  @doc """
  chages = %{customer: customer_id,
             subscription: subscription_id,
             subscription_items: [%{plan: plan_id}],
             subscription_proration_date: current_date}
  returns
  {:ok, %Stripe.Invocies{}}
  """
  def upcoming_invoice(changes, opts \\ []) do
    Invoice.upcoming(changes, opts)
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


# customer_id = cus_CzPZREhqlcassm
# subscription_id = sub_CzPZBcmqAyaB0D
# plan_id  = plan_CxqGQzrlZKzsyX
