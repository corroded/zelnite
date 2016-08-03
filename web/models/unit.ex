defmodule Zelnite.Unit do
  use Zelnite.Web, :model

  schema "units" do
    field :name, :string
    field :stars, :integer
    field :cost, :integer
    field :thumbnail_url, :string

    timestamps
  end

  @required_fields ~w(name stars cost thumbnail_url)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
