defmodule CoinControlWeb.ItemHTML do
  use CoinControlWeb, :html

  embed_templates "item_html/*"

  @doc """
  Renders a item form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def item_form(assigns)

  def group_opts(changeset) do
    existing_group =
      changeset
      |> Ecto.Changeset.get_change(:group, nil)

    for group <- CoinControl.Budgets.list_group() do
      [
        key: group.name,
        value: group.id,
        selected: existing_group != nil and group.id == existing_group.id
      ]
    end
  end
end
