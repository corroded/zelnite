defmodule Zelnite.UnitControllerTest do
  use Zelnite.ConnCase

  alias Zelnite.Unit
  @valid_attrs %{cost: 42, name: "some content", stars: 42, thumbnail_url: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, unit_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing units"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, unit_path(conn, :new)
    assert html_response(conn, 200) =~ "New unit"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, unit_path(conn, :create), unit: @valid_attrs
    assert redirected_to(conn) == unit_path(conn, :index)
    assert Repo.get_by(Unit, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, unit_path(conn, :create), unit: @invalid_attrs
    assert html_response(conn, 200) =~ "New unit"
  end

  test "shows chosen resource", %{conn: conn} do
    unit = Repo.insert! %Unit{}
    conn = get conn, unit_path(conn, :show, unit)
    assert html_response(conn, 200) =~ "Show unit"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, unit_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    unit = Repo.insert! %Unit{}
    conn = get conn, unit_path(conn, :edit, unit)
    assert html_response(conn, 200) =~ "Edit unit"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    unit = Repo.insert! %Unit{}
    conn = put conn, unit_path(conn, :update, unit), unit: @valid_attrs
    assert redirected_to(conn) == unit_path(conn, :show, unit)
    assert Repo.get_by(Unit, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    unit = Repo.insert! %Unit{}
    conn = put conn, unit_path(conn, :update, unit), unit: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit unit"
  end

  test "deletes chosen resource", %{conn: conn} do
    unit = Repo.insert! %Unit{}
    conn = delete conn, unit_path(conn, :delete, unit)
    assert redirected_to(conn) == unit_path(conn, :index)
    refute Repo.get(Unit, unit.id)
  end
end
