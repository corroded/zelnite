defmodule Zelnite.UnitTest do
  use Zelnite.ModelCase

  alias Zelnite.Unit

  @valid_attrs %{cost: 42, name: "some content", stars: 42, thumbnail_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Unit.changeset(%Unit{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Unit.changeset(%Unit{}, @invalid_attrs)
    refute changeset.valid?
  end
end
