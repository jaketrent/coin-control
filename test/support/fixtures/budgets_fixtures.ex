defmodule CoinControl.BudgetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CoinControl.Budgets` context.
  """

  @doc """
  Generate a group.
  """
  def group_fixture(attrs \\ %{}) do
    {:ok, group} =
      attrs
      |> Enum.into(%{
        name: "some name",
        order: 42
      })
      |> CoinControl.Budgets.create_group()

    group
  end

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        name: "some name",
        order: 42
      })
      |> CoinControl.Budgets.create_item()

    item
  end

  @doc """
  Generate a budget.
  """
  def budget_fixture(attrs \\ %{}) do
    {:ok, budget} =
      attrs
      |> Enum.into(%{
        end: ~U[2025-04-05 14:58:00Z],
        name: "some name",
        start: ~U[2025-04-05 14:58:00Z]
      })
      |> CoinControl.Budgets.create_budget()

    budget
  end

  @doc """
  Generate a budget_item.
  """
  def budget_item_fixture(attrs \\ %{}) do
    {:ok, budget_item} =
      attrs
      |> Enum.into(%{
        actual: "120.5",
        enveloped: true,
        expected: "120.5"
      })
      |> CoinControl.Budgets.create_budget_item()

    budget_item
  end

  @doc """
  Generate a budget.
  """
  def budget_fixture(attrs \\ %{}) do
    {:ok, budget} =
      attrs
      |> Enum.into(%{
        end: ~U[2025-04-05 18:10:00Z],
        name: "some name",
        start: ~U[2025-04-05 18:10:00Z]
      })
      |> CoinControl.Budgets.create_budget()

    budget
  end
end
