# Script for populating the database. You can run it as:
#
    # mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
alias Zelnite.Repo
alias Zelnite.Unit

defmodule Zelnite.Seeds do
  def save_row(row) do
    changeset = Unit.changeset(%Unit{}, row)
    Repo.insert!(changeset)
  end
end

File.stream!("priv/repo/unit_db.csv")
  |> Stream.drop(1)
  |> CSV.decode(headers: [:id, :stars, :thumbnail_url, :name, :cost])
  |> Enum.each(&Zelnite.Seeds.save_row/1)

#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
