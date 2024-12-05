defmodule AdventOfCode.Day03 do
  def part1(args) do
    Regex.scan(~r/mul\(\d+,\d+\)/, args)
    |> Enum.map(fn [match] ->
      match
      |> String.replace("mul(", "")
      |> String.replace(")", "")
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)
      |> then(fn [a, b] -> a * b end)
    end)
    |> Enum.sum()
    |> IO.inspect()
  end

  def part2(args) do
    disabled_chunks = Regex.scan(~r/don't\(\).*?do\(\)/s, args)

    # remove the disabled chunks from the input
    enabled =
      Enum.reduce(disabled_chunks, args, fn [chunk], acc ->
        String.replace(acc, chunk, "")
      end)

    part1(enabled)
  end
end
