defmodule CoinControl.BudgetsTest do
  use CoinControl.DataCase

  alias CoinControl.Budgets

  describe "group" do
    alias CoinControl.Budgets.Group

    import CoinControl.BudgetsFixtures

    @invalid_attrs %{name: nil, order: nil}

    test "list_group/0 returns all group" do
      group = group_fixture()
      assert Budgets.list_group() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Budgets.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      valid_attrs = %{name: "some name", order: 42}

      assert {:ok, %Group{} = group} = Budgets.create_group(valid_attrs)
      assert group.name == "some name"
      assert group.order == 42
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budgets.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      update_attrs = %{name: "some updated name", order: 43}

      assert {:ok, %Group{} = group} = Budgets.update_group(group, update_attrs)
      assert group.name == "some updated name"
      assert group.order == 43
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Budgets.update_group(group, @invalid_attrs)
      assert group == Budgets.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Budgets.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Budgets.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Budgets.change_group(group)
    end
  end

  describe "item" do
    alias CoinControl.Budgets.Item

    import CoinControl.BudgetsFixtures

    @invalid_attrs %{name: nil, order: nil}

    test "list_item/0 returns all item" do
      item = item_fixture()
      assert Budgets.list_item() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Budgets.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{name: "some name", order: 42}

      assert {:ok, %Item{} = item} = Budgets.create_item(valid_attrs)
      assert item.name == "some name"
      assert item.order == 42
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budgets.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{name: "some updated name", order: 43}

      assert {:ok, %Item{} = item} = Budgets.update_item(item, update_attrs)
      assert item.name == "some updated name"
      assert item.order == 43
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Budgets.update_item(item, @invalid_attrs)
      assert item == Budgets.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Budgets.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Budgets.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Budgets.change_item(item)
    end
  end

  describe "budget" do
    alias CoinControl.Budgets.Budget

    import CoinControl.BudgetsFixtures

    @invalid_attrs %{name: nil, start: nil, end: nil}

    test "list_budget/0 returns all budget" do
      budget = budget_fixture()
      assert Budgets.list_budget() == [budget]
    end

    test "get_budget!/1 returns the budget with given id" do
      budget = budget_fixture()
      assert Budgets.get_budget!(budget.id) == budget
    end

    test "create_budget/1 with valid data creates a budget" do
      valid_attrs = %{name: "some name", start: ~U[2025-04-05 14:58:00Z], end: ~U[2025-04-05 14:58:00Z]}

      assert {:ok, %Budget{} = budget} = Budgets.create_budget(valid_attrs)
      assert budget.name == "some name"
      assert budget.start == ~U[2025-04-05 14:58:00Z]
      assert budget.end == ~U[2025-04-05 14:58:00Z]
    end

    test "create_budget/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budgets.create_budget(@invalid_attrs)
    end

    test "update_budget/2 with valid data updates the budget" do
      budget = budget_fixture()
      update_attrs = %{name: "some updated name", start: ~U[2025-04-06 14:58:00Z], end: ~U[2025-04-06 14:58:00Z]}

      assert {:ok, %Budget{} = budget} = Budgets.update_budget(budget, update_attrs)
      assert budget.name == "some updated name"
      assert budget.start == ~U[2025-04-06 14:58:00Z]
      assert budget.end == ~U[2025-04-06 14:58:00Z]
    end

    test "update_budget/2 with invalid data returns error changeset" do
      budget = budget_fixture()
      assert {:error, %Ecto.Changeset{}} = Budgets.update_budget(budget, @invalid_attrs)
      assert budget == Budgets.get_budget!(budget.id)
    end

    test "delete_budget/1 deletes the budget" do
      budget = budget_fixture()
      assert {:ok, %Budget{}} = Budgets.delete_budget(budget)
      assert_raise Ecto.NoResultsError, fn -> Budgets.get_budget!(budget.id) end
    end

    test "change_budget/1 returns a budget changeset" do
      budget = budget_fixture()
      assert %Ecto.Changeset{} = Budgets.change_budget(budget)
    end
  end

  describe "budget_item" do
    alias CoinControl.Budgets.BudgetItem

    import CoinControl.BudgetsFixtures

    @invalid_attrs %{actual: nil, expected: nil, enveloped: nil}

    test "list_budget_item/0 returns all budget_item" do
      budget_item = budget_item_fixture()
      assert Budgets.list_budget_item() == [budget_item]
    end

    test "get_budget_item!/1 returns the budget_item with given id" do
      budget_item = budget_item_fixture()
      assert Budgets.get_budget_item!(budget_item.id) == budget_item
    end

    test "create_budget_item/1 with valid data creates a budget_item" do
      valid_attrs = %{actual: "120.5", expected: "120.5", enveloped: true}

      assert {:ok, %BudgetItem{} = budget_item} = Budgets.create_budget_item(valid_attrs)
      assert budget_item.actual == Decimal.new("120.5")
      assert budget_item.expected == Decimal.new("120.5")
      assert budget_item.enveloped == true
    end

    test "create_budget_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budgets.create_budget_item(@invalid_attrs)
    end

    test "update_budget_item/2 with valid data updates the budget_item" do
      budget_item = budget_item_fixture()
      update_attrs = %{actual: "456.7", expected: "456.7", enveloped: false}

      assert {:ok, %BudgetItem{} = budget_item} = Budgets.update_budget_item(budget_item, update_attrs)
      assert budget_item.actual == Decimal.new("456.7")
      assert budget_item.expected == Decimal.new("456.7")
      assert budget_item.enveloped == false
    end

    test "update_budget_item/2 with invalid data returns error changeset" do
      budget_item = budget_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Budgets.update_budget_item(budget_item, @invalid_attrs)
      assert budget_item == Budgets.get_budget_item!(budget_item.id)
    end

    test "delete_budget_item/1 deletes the budget_item" do
      budget_item = budget_item_fixture()
      assert {:ok, %BudgetItem{}} = Budgets.delete_budget_item(budget_item)
      assert_raise Ecto.NoResultsError, fn -> Budgets.get_budget_item!(budget_item.id) end
    end

    test "change_budget_item/1 returns a budget_item changeset" do
      budget_item = budget_item_fixture()
      assert %Ecto.Changeset{} = Budgets.change_budget_item(budget_item)
    end
  end

  describe "budget" do
    alias CoinControl.Budgets.Budget

    import CoinControl.BudgetsFixtures

    @invalid_attrs %{name: nil, start: nil, end: nil}

    test "list_budget/0 returns all budget" do
      budget = budget_fixture()
      assert Budgets.list_budget() == [budget]
    end

    test "get_budget!/1 returns the budget with given id" do
      budget = budget_fixture()
      assert Budgets.get_budget!(budget.id) == budget
    end

    test "create_budget/1 with valid data creates a budget" do
      valid_attrs = %{name: "some name", start: ~U[2025-04-05 18:10:00Z], end: ~U[2025-04-05 18:10:00Z]}

      assert {:ok, %Budget{} = budget} = Budgets.create_budget(valid_attrs)
      assert budget.name == "some name"
      assert budget.start == ~U[2025-04-05 18:10:00Z]
      assert budget.end == ~U[2025-04-05 18:10:00Z]
    end

    test "create_budget/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budgets.create_budget(@invalid_attrs)
    end

    test "update_budget/2 with valid data updates the budget" do
      budget = budget_fixture()
      update_attrs = %{name: "some updated name", start: ~U[2025-04-06 18:10:00Z], end: ~U[2025-04-06 18:10:00Z]}

      assert {:ok, %Budget{} = budget} = Budgets.update_budget(budget, update_attrs)
      assert budget.name == "some updated name"
      assert budget.start == ~U[2025-04-06 18:10:00Z]
      assert budget.end == ~U[2025-04-06 18:10:00Z]
    end

    test "update_budget/2 with invalid data returns error changeset" do
      budget = budget_fixture()
      assert {:error, %Ecto.Changeset{}} = Budgets.update_budget(budget, @invalid_attrs)
      assert budget == Budgets.get_budget!(budget.id)
    end

    test "delete_budget/1 deletes the budget" do
      budget = budget_fixture()
      assert {:ok, %Budget{}} = Budgets.delete_budget(budget)
      assert_raise Ecto.NoResultsError, fn -> Budgets.get_budget!(budget.id) end
    end

    test "change_budget/1 returns a budget changeset" do
      budget = budget_fixture()
      assert %Ecto.Changeset{} = Budgets.change_budget(budget)
    end
  end
end
