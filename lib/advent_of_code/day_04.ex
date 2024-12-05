defmodule AdventOfCode.Day04 do
  def get_point(grid, x, y, max_x, max_y) do
    if x < 0 or x >= max_x or y < 0 or y >= max_y do
      "."
    else
      grid |> Enum.at(y) |> String.at(x)
    end
  end

  def get_strings_from_point(grid, x, y, max_x, max_y) do
    horizontal =
      for i <- 0..3 do
        get_point(grid, x + i, y, max_x, max_y)
      end
      |> Enum.join()

    reverse_horizontal =
      for i <- 0..3 do
        get_point(grid, x - i, y, max_x, max_y)
      end
      |> Enum.join()

    vertical =
      for i <- 0..3 do
        get_point(grid, x, y + i, max_x, max_y)
      end
      |> Enum.join()

    reverse_vertical =
      for i <- 0..3 do
        get_point(grid, x, y - i, max_x, max_y)
      end
      |> Enum.join()

    diagonal_top_left =
      for i <- 0..3 do
        get_point(grid, x - i, y - i, max_x, max_y)
      end
      |> Enum.join()

    diagonal_top_right =
      for i <- 0..3 do
        get_point(grid, x + i, y - i, max_x, max_y)
      end
      |> Enum.join()

    diagonal_bottom_left =
      for i <- 0..3 do
        get_point(grid, x - i, y + i, max_x, max_y)
      end
      |> Enum.join()

    diagonal_bottom_right =
      for i <- 0..3 do
        get_point(grid, x + i, y + i, max_x, max_y)
      end
      |> Enum.join()

    [
      horizontal,
      reverse_horizontal,
      vertical,
      reverse_vertical,
      diagonal_top_left,
      diagonal_top_right,
      diagonal_bottom_left,
      diagonal_bottom_right
    ]
  end

  def part1(normal) do
    lines =
      normal
      |> String.split("\n", trim: true)

    line_length = lines |> Enum.at(0) |> String.length()
    line_count = Enum.count(lines)

    for x <- 0..(line_length - 1), y <- 0..(line_count - 1) do
      strings = get_strings_from_point(lines, x, y, line_length, line_count)

      Enum.map(strings, fn string ->
        if string == "XMAS" do
          1
        else
          0
        end
      end)
      |> Enum.sum()
    end
    |> Enum.sum()
    |> IO.inspect()
  end

  def part2(_args) do
  end
end
