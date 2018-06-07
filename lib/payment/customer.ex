defmodule Payment.Customer do

  alias Stripe.Customer

  @type t :: Stripe.Customer

  @doc """
  Create a customer
  params = %{"email" => "user's email address", "description" => "Some description"}

  Returns
  %Stripe.Customer{id: id, ... default_source: default_source, sources: sources}
  """
  @spec create_customer(map, Keyword.t) :: {:ok, t} | {:error, Stripe.api_error_struct}
  def create_customer(params, opts \\ []) do
    Customer.create(params, opts)
  end

  @spec retrieve_customer(binary, Keyword.t) :: t | {:error, binary}
  def retrieve_customer(id, opts \\ []) do
    case Customer.retrieve(id, opts) do
      {:ok, customer} ->
        customer
      {:error, %{}} ->
        {:error, "Can't retrieve a customer"}
    end
  end

  @doc """
  Update a customer.

  Takes the `id` and a map of changes.
  """
  @spec update_customer(binary, map, list) :: {:ok, t} | {:error, Stripe.api_error_struct}
  def update_customer(id, changes, opts \\ []) do
    Customer.update(id, changes, opts)
  end

  @spec delete_customer(binary, list) :: :ok | {:error, Stripe.api_error_struct}
  def delete_customer(id, opts \\ []) do
    Customer.delete(id, opts)
  end

  def list_customer(params \\ %{}, opts \\ []) do
    Customer.list(params, opts)
  end

  def customer_has_card?(customer) do
    sources = Enum.count(customer.sources.data)
    cond do
     sources > 0 -> true
     sources <= 0 -> false
    end
  end

end
