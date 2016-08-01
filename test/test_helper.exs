ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Zelnite.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Zelnite.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Zelnite.Repo)

