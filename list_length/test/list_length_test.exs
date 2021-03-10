defmodule ListLengthTest do
  use ExUnit.Case
  test "ListLength.call/1 returns list length" do

    list = [1, 2, 3, 5, 7]
    
    response = ListLength.call(list)
    expect_response = 5

    assert expect_response == response
  end
end
