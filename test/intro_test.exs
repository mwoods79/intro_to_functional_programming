defmodule IntroTest do
  use ExUnit.Case
  import Intro

  # =============================================
  # Phase 1: Pattern Matching
  # =============================================

  test "greet" do
    assert greet(:morning) == "Good morning!"
    assert greet(:evening) == "Good evening!"
    assert greet(:night) == "Good night!"
  end

  test "b_not" do
    assert b_not(true) == false
    assert b_not(false) == true
  end

  # test "b_or" do
  #   assert b_or(true, true) == true
  #   assert b_or(true, false) == true
  #   assert b_or(false, true) == true
  #   assert b_or(false, false) == false
  # end

  # test "b_and" do
  #   assert b_and(true, true) == true
  #   assert b_and(false, true) == false
  #   assert b_and(true, false) == false
  #   assert b_and(false, false) == false
  # end

  # test "same?" do
  #   assert same?(1, 1) == true
  #   assert same?(:a, :a) == true
  #   assert same?(1, 2) == false
  #   assert same?("hi", "ho") == false
  # end

  # test "describe" do
  #   assert describe(42) == "integer"
  #   assert describe("hello") == "string"
  #   assert describe(:ok) == "atom"
  #   assert describe([1, 2]) == "list"
  # end

  # test "first" do
  #   assert first([1, 2, 3]) == 1
  #   assert first([:a, :b]) == :a
  #   assert first([]) == :empty
  # end

  # test "shape_area" do
  #   assert shape_area({:circle, 5}) == :math.pi() * 25
  #   assert shape_area({:rectangle, 4, 6}) == 24
  #   assert shape_area({:triangle, 3, 8}) == 12.0
  # end

  # test "get_info" do
  #   assert get_info(%{name: "José", role: :admin}) == "José is an admin"
  #   assert get_info(%{name: "Chris", role: :user}) == "Chris is a user"
  #   assert get_info(%{name: "Anon"}) == "Anon has no role"
  # end

  # =============================================
  # Phase 2: Recursion
  # =============================================

  # test "count" do
  #   assert count([]) == 0
  #   assert count(["a", "b", "c"]) == 3
  # end

  # test "sum" do
  #   assert sum([]) == 0
  #   assert sum([1, 2, 3]) == 6
  # end

  # test "maximum" do
  #   assert maximum([5]) == 5
  #   assert maximum([5, 4, 9, 2, 7]) == 9
  # end

  # test "reverse" do
  #   assert reverse([]) == []
  #   assert reverse([1, 2, 3]) == [3, 2, 1]
  # end

  # test "zip" do
  #   assert zip([], [1, 2, 3]) == []
  #   assert zip([1, 2, 3], []) == []
  #   assert zip([1, 2, 3], [:a, :b, :c]) == [{1, :a}, {2, :b}, {3, :c}]
  #   assert zip([1, 2], [:a, :b, :c]) == [{1, :a}, {2, :b}]
  # end

  # =============================================
  # Phase 3: Higher-Order Functions
  # =============================================

  # test "reduce" do
  #   assert reduce([1, 2, 3], 0, fn x, acc -> x + acc end) == 6
  #   assert reduce([], 42, fn _, acc -> acc end) == 42
  # end

  # test "map" do
  #   assert map([1, 2, 3], fn x -> x * 2 end) == [2, 4, 6]
  #   assert map([], fn x -> x end) == []
  # end

  # test "filter" do
  #   assert filter([1, 2, 3, 4], fn x -> rem(x, 2) == 0 end) == [2, 4]
  #   assert filter([1, 2, 3], fn _ -> false end) == []
  # end

  # test "quicksort" do
  #   assert quicksort([]) == []
  #   assert quicksort([8, 2, 5, 3, 5, 1, 9, 0, 6, 5]) == [0, 1, 2, 3, 5, 5, 5, 6, 8, 9]
  # end

  # =============================================
  # Bonus
  # =============================================

  # test "merge_sort" do
  #   assert merge_sort([]) == []
  #   assert merge_sort([1]) == [1]
  #   assert merge_sort([8, 2, 5, 3, 5, 1, 9, 0, 6, 5]) == [0, 1, 2, 3, 5, 5, 5, 6, 8, 9]
  # end
end
