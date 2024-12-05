defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  test "part1" do
    input = AdventOfCode.Input.get!(3)
    result = part1(input)

    assert result
  end

  @tag :skip
  test "part2" do
    input = AdventOfCode.Input.get!(3)
    result = part2(input)

    assert result
  end
end
