defmodule RestApiWeb.ItemJSON do
  alias RestApi.Inventory.Item

  @doc """
  Renders a list of items.
  """
  def index(%{items: items}) do
    %{data: for(item <- items, do: data(item))}
  end

  @doc """
  Renders a single item.
  """
  def show(%{item: item}) do
    %{data: data(item)}
  end

  defp data(%Item{} = item) do
    %{
      id: item.id,
      name: item.name,
      description: item.description,
      status: item.status
    }
  end
end
