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

  def part2(args) do
    {left, right} =
      String.split(args, "\n")
      |> Enum.reject(&(String.trim(&1) == ""))
      |> Enum.map(fn line ->
        String.split(line, "   ")
      end)
      |> Enum.map(fn [a, b] -> {String.to_integer(a), String.to_integer(b)} end)
      |> Enum.unzip()

    right_map =
      right
      |> Enum.reduce(%{}, fn item, acc ->
        if Map.has_key?(acc, item) do
          Map.put(acc, item, acc[item] + 1)
        else
          Map.put(acc, item, 1)
        end
      end)

    left
    |> Enum.reduce(0, fn item, sum ->
      if Map.has_key?(right_map, item) do
        sum + item * right_map[item]
      else
        sum
      end
    end)
    |> dbg
  end
end
