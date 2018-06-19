defmodule Payment do

  alias Payment.{Charge, Customer, Subscription, Plan, Invoice, Card}

  defdelegate create_charge(changes, opts \\ []), to: Charge

  # Customer
  defdelegate create_customer(params, opts \\ []), to: Customer
  defdelegate retrieve_customer(id, opts \\ []), to: Customer
  defdelegate update_customer(id, changes, opts \\ []), to: Customer
  defdelegate delete_customer(id, opts \\ []), to: Customer
  defdelegate list_customer(params \\ %{}, opts \\ []), to: Customer
  defdelegate customer_has_card?(cusotomer), to: Customer

  # Subscription
  defdelegate create_subscription(customer_id, opts \\ []), to: Subscription
  defdelegate retrieve_subscription(id, opts \\ []), to: Subscription
  defdelegate update_subscription(id, changes, opts \\ []), to: Subscription
  defdelegate list_subscription(params \\ %{}, opts \\ []), to: Subscription
  defdelegate get_subscription_id(customer), to: Subscription
  defdelegate cancel_subscription(subscription_id, params \\ %{}), to: Subscription

  # Plan
  defdelegate list_plan(params \\ %{}, opts \\ []), to: Plan
  defdelegate get_plan_by_name(plan_name), to: Plan
  defdelegate get_plan_by_id(plan_id), to: Plan

  # Invoice
  defdelegate upcoming_invoice(changes, opts \\ []), to: Invoice

  # Card
  defdelegate retrieve_card(card_id, stripe_id), to: Card
  defdelegate create_card(customer_id, token), to: Card
  defdelegate delete_card(card_id, customer_id), to: Card
end
