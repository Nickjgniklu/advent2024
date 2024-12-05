defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  test "part1" do
    input = AdventOfCode.Input.get!(2)
    result = part1(input)

    assert result
  end

  test "part2" do
    input = AdventOfCode.Input.get!(2)
    # input = """
    # 7 6 4 2 1
    # 1 2 7 8 9
    # 9 7 6 2 1
    # 1 3 2 4 5
    # 8 6 4 4 1
    # 1 3 6 7 9
    # """

    result = part2(input)

    assert result
  end
end
