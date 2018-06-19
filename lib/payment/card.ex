defmodule Payment.Card do
  alias Stripe.Card

  def retrieve_card(card_id, stripe_id) do
    Card.retrieve(card_id, %{customer: stripe_id})
  end

  def create_card(customer_id, token) do
    case Card.create(%{customer: customer_id, source: token}) do
      {:ok, _card} ->
        {:ok, "New card has been added successfully!"}
      {:error, _error} ->
        {:error, "Can't add a new card. Please try again."}
    end
  end

  def delete_card(card_id, customer_id) do
    case Card.delete(card_id, %{customer: customer_id}) do
      {:ok, _} ->
        {:ok, "Card is deleted."}
      {:error, _} ->
        {:error, "Can't delete a card."}
    end
  end
end
