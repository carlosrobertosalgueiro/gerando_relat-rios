defmodule GenReport do
  def build(path) do
    usuarios =  read(path)
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  def read(path) do
    case File.read(path) do
      {:ok, binary} ->
        binary

      {:error, reason} ->
        raise File.Error, reason: reason, action: "read file", path: IO.chardata_to_string(path)
    end
  end

  defp parse_line(line) do
    line
    |> String.trim()
    # |> String.split(",")
    # |> List.update_at(2, &String.to_integer/1)
  end

end
