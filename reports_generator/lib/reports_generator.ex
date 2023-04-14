defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(%{}, fn [id, _food_name, price], report -> create_report_map(id, price, report) end)
  end

  defp create_report_map(id, price, report), do: Map.put(report, id, price_sum(report[id], price))

  defp price_sum(nil, price), do: price
  defp price_sum(actual_price, price), do: actual_price + price
end
