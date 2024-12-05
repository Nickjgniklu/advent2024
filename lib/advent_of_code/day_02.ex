defmodule AdventOfCode.Day02 do
  def part1(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(fn sr ->
      String.split(sr, " ", trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.map(&is_valid/1)
    |> Enum.sum()
    |> dbg()
  end

  defp is_increase(report) do
    Enum.chunk_every(report, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a < b && abs(a - b) < 4 end)
  end

  defp is_decrease(report) do
    Enum.chunk_every(report, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a > b && abs(a - b) < 4 end)
  end

  defp is_valid(report) do
    if is_increase(report) || is_decrease(report) do
      1
    else
      0
    end
  end

  defp is_validp(report) do
    0..(length(report) - 1)
    |> Enum.map(fn index ->
      meh = List.delete_at(report, index)
      is_valid(meh)
    end)
    |> Enum.any?(&(&1 == 1))
    |> then(fn
      true -> 1
      false -> 0
    end)
  end

  def part2(args) do
    args
    |> String.split("\n", trim: true)
    |> Enum.map(fn sr ->
      String.split(sr, " ", trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
    |> Enum.map(&is_validp/1)
    |> Enum.sum()
    |> dbg()
  end
end
