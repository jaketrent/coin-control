defmodule CoinControl.PlansFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CoinControl.Plans` context.
  """

  @doc """
  Generate a template.
  """
  def template_fixture(attrs \\ %{}) do
    {:ok, template} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> CoinControl.Plans.create_template()

    template
  end

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
      |> CoinControl.Plans.create_group()

    group
  end

  @doc """
  Generate a line_item.
  """
  def line_item_fixture(attrs \\ %{}) do
    {:ok, line_item} =
      attrs
      |> Enum.into(%{
        enveloped: true,
        expected: "120.5",
        order: 42
      })
      |> CoinControl.Plans.create_line_item()

    line_item
  end
end
