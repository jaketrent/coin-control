defmodule CoinControlWeb.GroupController do
  use CoinControlWeb, :controller

  alias CoinControl.Budgets
  alias CoinControl.Budgets.Group

  def index(conn, _params) do
    group = Budgets.list_group()
    render(conn, :index, group_collection: group)
  end

  def new(conn, _params) do
    changeset = Budgets.change_group(%Group{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"group" => group_params}) do
    case Budgets.create_group(group_params) do
      {:ok, group} ->
        conn
        |> put_flash(:info, "Group created successfully.")
        |> redirect(to: ~p"/admin/group/#{group}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    group = Budgets.get_group!(id)
    render(conn, :show, group: group)
  end

  def edit(conn, %{"id" => id}) do
    group = Budgets.get_group!(id)
    changeset = Budgets.change_group(group)
    render(conn, :edit, group: group, changeset: changeset)
  end

  def update(conn, %{"id" => id, "group" => group_params}) do
    group = Budgets.get_group!(id)

    case Budgets.update_group(group, group_params) do
      {:ok, group} ->
        conn
        |> put_flash(:info, "Group updated successfully.")
        |> redirect(to: ~p"/admin/group/#{group}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, group: group, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    group = Budgets.get_group!(id)
    {:ok, _group} = Budgets.delete_group(group)

    conn
    |> put_flash(:info, "Group deleted successfully.")
    |> redirect(to: ~p"/admin/group")
  end
end
