defmodule RestApi.InventoryTest do
  use RestApi.DataCase

  alias RestApi.Inventory

  describe "items" do
    alias RestApi.Inventory.Item

    import RestApi.InventoryFixtures

    @invalid_attrs %{name: nil, status: nil, description: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Inventory.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Inventory.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{name: "some name", status: "some status", description: "some description"}

      assert {:ok, %Item{} = item} = Inventory.create_item(valid_attrs)
      assert item.name == "some name"
      assert item.status == "some status"
      assert item.description == "some description"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{name: "some updated name", status: "some updated status", description: "some updated description"}

      assert {:ok, %Item{} = item} = Inventory.update_item(item, update_attrs)
      assert item.name == "some updated name"
      assert item.status == "some updated status"
      assert item.description == "some updated description"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_item(item, @invalid_attrs)
      assert item == Inventory.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Inventory.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Inventory.change_item(item)
    end
  end
end
