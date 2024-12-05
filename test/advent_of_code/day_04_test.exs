defmodule AdventOfCode.Day04Test do
  use ExUnit.Case

  import AdventOfCode.Day04
  @tag :skip
  test "part1" do
    # input = """
    # MMMSXXMASM
    # MSAMXMSMSA
    # AMXSXMAAMM
    # MSAMASMSMX
    # XMASAMXAMM
    # XXAMMXXAMA
    # SMSMSASXSS
    # SAXAMASAAA
    # MAMMMXMMMM
    # MXMXAXMASX
    # """
    input = AdventOfCode.Input.get!(4)

    result = part1(input)

    assert result
  end

  test "part2" do
    input = AdventOfCode.Input.get!(4)

    result = part2(input)

    assert result
  end
end
