defmodule CoinControl.Budgets do
  @moduledoc """
  The Budgets context.
  """

  import Ecto.Query, warn: false
  alias CoinControl.Repo

  alias CoinControl.Budgets.Group

  @doc """
  Returns the list of group.

  ## Examples

      iex> list_group()
      [%Group{}, ...]

  """
  def list_group do
    Repo.all(Group)
  end

  @doc """
  Gets a single group.

  Raises `Ecto.NoResultsError` if the Group does not exist.

  ## Examples

      iex> get_group!(123)
      %Group{}

      iex> get_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_group!(id), do: Repo.get!(Group, id)

  @doc """
  Creates a group.

  ## Examples

      iex> create_group(%{field: value})
      {:ok, %Group{}}

      iex> create_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_group(attrs \\ %{}) do
    %Group{}
    |> Group.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a group.

  ## Examples

      iex> update_group(group, %{field: new_value})
      {:ok, %Group{}}

      iex> update_group(group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_group(%Group{} = group, attrs) do
    group
    |> Group.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a group.

  ## Examples

      iex> delete_group(group)
      {:ok, %Group{}}

      iex> delete_group(group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_group(%Group{} = group) do
    Repo.delete(group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking group changes.

  ## Examples

      iex> change_group(group)
      %Ecto.Changeset{data: %Group{}}

  """
  def change_group(%Group{} = group, attrs \\ %{}) do
    Group.changeset(group, attrs)
  end

  alias CoinControl.Budgets.Item

  @doc """
  Returns the list of item.

  ## Examples

      iex> list_item()
      [%Item{}, ...]

  """
  def list_item do
    Repo.all(Item)
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id), do: Repo.get!(Item, id)

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{data: %Item{}}

  """
  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end

  alias CoinControl.Budgets.Budget

  @doc """
  Returns the list of budget.

  ## Examples

      iex> list_budget()
      [%Budget{}, ...]

  """
  def list_budget do
    Repo.all(Budget)
  end

  @doc """
  Gets a single budget.

  Raises `Ecto.NoResultsError` if the Budget does not exist.

  ## Examples

      iex> get_budget!(123)
      %Budget{}

      iex> get_budget!(456)
      ** (Ecto.NoResultsError)

  """
  def get_budget!(id), do: Repo.get!(Budget, id)

  @doc """
  Creates a budget.

  ## Examples

      iex> create_budget(%{field: value})
      {:ok, %Budget{}}

      iex> create_budget(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_budget(attrs \\ %{}) do
    %Budget{}
    |> Budget.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a budget.

  ## Examples

      iex> update_budget(budget, %{field: new_value})
      {:ok, %Budget{}}

      iex> update_budget(budget, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_budget(%Budget{} = budget, attrs) do
    budget
    |> Budget.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a budget.

  ## Examples

      iex> delete_budget(budget)
      {:ok, %Budget{}}

      iex> delete_budget(budget)
      {:error, %Ecto.Changeset{}}

  """
  def delete_budget(%Budget{} = budget) do
    Repo.delete(budget)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking budget changes.

  ## Examples

      iex> change_budget(budget)
      %Ecto.Changeset{data: %Budget{}}

  """
  def change_budget(%Budget{} = budget, attrs \\ %{}) do
    Budget.changeset(budget, attrs)
  end

  alias CoinControl.Budgets.BudgetItem

  @doc """
  Returns the list of budget_item.

  ## Examples

      iex> list_budget_item()
      [%BudgetItem{}, ...]

  """
  def list_budget_item do
    Repo.all(BudgetItem) |> Repo.preload(:item)
  end

  @doc """
  Gets a single budget_item.

  Raises `Ecto.NoResultsError` if the Budget item does not exist.

  ## Examples

      iex> get_budget_item!(123)
      %BudgetItem{}

      iex> get_budget_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_budget_item!(id), do: Repo.get!(BudgetItem, id) |> Repo.preload(:item)

  @doc """
  Creates a budget_item.

  ## Examples

      iex> create_budget_item(%{field: value})
      {:ok, %BudgetItem{}}

      iex> create_budget_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_budget_item(attrs \\ %{}) do
    %BudgetItem{}
    |> change_budget_item(attrs)
    |> Repo.insert()
  end

  def change_budget_item(%BudgetItem{} = budget_item, attrs \\ %{}) do
    budget_id = attrs["budget_id"]
    budget = if budget_id != nil do get_budget!(budget_id) end

    item_id = attrs["item_id"]
    item = if item_id != nil do get_item!(item_id) end

    budget_item
    |> Repo.preload(:budget)
    |> BudgetItem.changeset(attrs)
    |> Ecto.Changeset.put_assoc(:budget, budget)
    |> Ecto.Changeset.put_assoc(:item, item)
  end

  @doc """
  Updates a budget_item.

  ## Examples

      iex> update_budget_item(budget_item, %{field: new_value})
      {:ok, %BudgetItem{}}

      iex> update_budget_item(budget_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_budget_item(%BudgetItem{} = budget_item, attrs) do
    budget_item
    |> BudgetItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a budget_item.

  ## Examples

      iex> delete_budget_item(budget_item)
      {:ok, %BudgetItem{}}

      iex> delete_budget_item(budget_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_budget_item(%BudgetItem{} = budget_item) do
    Repo.delete(budget_item)
  end
end
