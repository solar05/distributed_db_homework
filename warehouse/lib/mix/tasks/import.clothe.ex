defmodule Mix.Tasks.Import.Clothe do
  use Mix.Task

  @shortdoc "Seeds clothe warehouse data."

  @data_path "generator/data.txt"

  def run(_) do
    {:ok, body} = File.read(@data_path)
    queries = String.split(body, "\n")
    Enum.map(queries, fn data_query -> Ecto.Adapters.SQL.query(Repo, data_query, []) end)
  end
end
