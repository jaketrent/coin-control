defmodule CoinControl.PlansTest do
  use CoinControl.DataCase

  alias CoinControl.Plans

  describe "template" do
    alias CoinControl.Plans.Template

    import CoinControl.PlansFixtures

    @invalid_attrs %{name: nil}

    test "list_template/0 returns all template" do
      template = template_fixture()
      assert Plans.list_template() == [template]
    end

    test "get_template!/1 returns the template with given id" do
      template = template_fixture()
      assert Plans.get_template!(template.id) == template
    end

    test "create_template/1 with valid data creates a template" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Template{} = template} = Plans.create_template(valid_attrs)
      assert template.name == "some name"
    end

    test "create_template/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plans.create_template(@invalid_attrs)
    end

    test "update_template/2 with valid data updates the template" do
      template = template_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Template{} = template} = Plans.update_template(template, update_attrs)
      assert template.name == "some updated name"
    end

    test "update_template/2 with invalid data returns error changeset" do
      template = template_fixture()
      assert {:error, %Ecto.Changeset{}} = Plans.update_template(template, @invalid_attrs)
      assert template == Plans.get_template!(template.id)
    end

    test "delete_template/1 deletes the template" do
      template = template_fixture()
      assert {:ok, %Template{}} = Plans.delete_template(template)
      assert_raise Ecto.NoResultsError, fn -> Plans.get_template!(template.id) end
    end

    test "change_template/1 returns a template changeset" do
      template = template_fixture()
      assert %Ecto.Changeset{} = Plans.change_template(template)
    end
  end

  describe "group" do
    alias CoinControl.Plans.Group

    import CoinControl.PlansFixtures

    @invalid_attrs %{name: nil, order: nil}

    test "list_group/0 returns all group" do
      group = group_fixture()
      assert Plans.list_group() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Plans.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      valid_attrs = %{name: "some name", order: 42}

      assert {:ok, %Group{} = group} = Plans.create_group(valid_attrs)
      assert group.name == "some name"
      assert group.order == 42
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plans.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      update_attrs = %{name: "some updated name", order: 43}

      assert {:ok, %Group{} = group} = Plans.update_group(group, update_attrs)
      assert group.name == "some updated name"
      assert group.order == 43
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Plans.update_group(group, @invalid_attrs)
      assert group == Plans.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Plans.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Plans.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Plans.change_group(group)
    end
  end

  describe "line_item" do
    alias CoinControl.Plans.LineItem

    import CoinControl.PlansFixtures

    @invalid_attrs %{expected: nil, order: nil, enveloped: nil}

    test "list_line_item/0 returns all line_item" do
      line_item = line_item_fixture()
      assert Plans.list_line_item() == [line_item]
    end

    test "get_line_item!/1 returns the line_item with given id" do
      line_item = line_item_fixture()
      assert Plans.get_line_item!(line_item.id) == line_item
    end

    test "create_line_item/1 with valid data creates a line_item" do
      valid_attrs = %{expected: "120.5", order: 42, enveloped: true}

      assert {:ok, %LineItem{} = line_item} = Plans.create_line_item(valid_attrs)
      assert line_item.expected == Decimal.new("120.5")
      assert line_item.order == 42
      assert line_item.enveloped == true
    end

    test "create_line_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plans.create_line_item(@invalid_attrs)
    end

    test "update_line_item/2 with valid data updates the line_item" do
      line_item = line_item_fixture()
      update_attrs = %{expected: "456.7", order: 43, enveloped: false}

      assert {:ok, %LineItem{} = line_item} = Plans.update_line_item(line_item, update_attrs)
      assert line_item.expected == Decimal.new("456.7")
      assert line_item.order == 43
      assert line_item.enveloped == false
    end

    test "update_line_item/2 with invalid data returns error changeset" do
      line_item = line_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Plans.update_line_item(line_item, @invalid_attrs)
      assert line_item == Plans.get_line_item!(line_item.id)
    end

    test "delete_line_item/1 deletes the line_item" do
      line_item = line_item_fixture()
      assert {:ok, %LineItem{}} = Plans.delete_line_item(line_item)
      assert_raise Ecto.NoResultsError, fn -> Plans.get_line_item!(line_item.id) end
    end

    test "change_line_item/1 returns a line_item changeset" do
      line_item = line_item_fixture()
      assert %Ecto.Changeset{} = Plans.change_line_item(line_item)
    end
  end
end
