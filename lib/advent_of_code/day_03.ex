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

  def part2(_args) do
  end
end
