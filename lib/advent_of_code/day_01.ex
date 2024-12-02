defmodule AdventOfCode.Day01 do
  def part1(args) do
    String.split(args, "\n")
    |> Enum.reject(&(String.trim(&1) == ""))
    |> Enum.map(fn line ->
      String.split(line, "   ")
    end)
    |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
    |> Enum.unzip()
    |> then(fn {a, b} -> [Enum.sort(a), Enum.sort(b)] end)
    |> Enum.zip()
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
    |> dbg()
  end

  def part2(_args) do
  end
end
