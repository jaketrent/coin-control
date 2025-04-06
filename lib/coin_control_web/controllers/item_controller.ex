defmodule CoinControlWeb.ItemController do
  use CoinControlWeb, :controller

  alias CoinControl.Budgets
  alias CoinControl.Budgets.Item

  def index(conn, _params) do
    item = Budgets.list_item()
    render(conn, :index, item_collection: item)
  end

  def new(conn, _params) do
    changeset = Budgets.change_item(%Item{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"item" => item_params}) do
    case Budgets.create_item(item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: ~p"/admin/item/#{item}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Budgets.get_item!(id)
    render(conn, :show, item: item)
  end

  def edit(conn, %{"id" => id}) do
    item = Budgets.get_item!(id)
    changeset = Budgets.change_item(item)
    render(conn, :edit, item: item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Budgets.get_item!(id)

    case Budgets.update_item(item, item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: ~p"/admin/item/#{item}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, item: item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Budgets.get_item!(id)
    {:ok, _item} = Budgets.delete_item(item)

    conn
    |> put_flash(:info, "Item deleted successfully.")
    |> redirect(to: ~p"/admin/item")
  end
end
