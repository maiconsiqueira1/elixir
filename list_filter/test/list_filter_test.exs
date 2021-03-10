defmodule ListFilterTest do
  use ExUnit.Case
  test "ListFilter.call/1 returns odd list" do

    list = ["1", "3", "6", "43", "banana", "6", "abc"]

    response = ListFilter.call(list)
    expect_response = [1,3,43]

    assert expect_response == response
  end
end
