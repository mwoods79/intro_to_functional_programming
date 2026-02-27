defmodule Intro do
  @moduledoc """
  Intro to Functional Programming in Elixir

  Work through the exercises by uncommenting tests in
  test/intro_test.exs and implementing each function below.
  Run `mix test` to check your work.
  """

  # =============================================
  # PHASE 1: Pattern Matching
  # =============================================

  # Exercise 1: greet/1
  # Given an atom representing a time of day, return a greeting string.
  # Elixir tries each function clause top-to-bottom until one matches.
  #
  #   greet(:morning) => "Good morning!"
  #   greet(:evening) => "Good evening!"
  #   greet(:night)   => "Good night!"

  def greet(:morning), do: "Good morning!"
  def greet(:evening), do: "Good evening!"
  def greet(:night), do: "Good night!"

  # Exercise 2: b_not/1
  # Implement boolean NOT using pattern matching.
  # In Elixir, true and false are just atoms — you can match on them directly.
  #
  #   b_not(true)  => false
  #   b_not(false) => true

  def b_not(true), do: false
  def b_not(false), do: true

  # Exercise 3: b_or/2 and b_and/2
  # Implement boolean OR and AND using pattern matching.
  # HINT: Think about which combinations of true/false return true.
  # HINT: For b_or, which cases return true? Use _ (wildcard) for the rest.
  # HINT: b_and only returns true in one case.
  #
  #   b_or(true, false)  => true
  #   b_or(false, false) => false
  #   b_and(true, true)  => true
  #   b_and(true, false) => false

  # Exercise 4: describe/1
  # Return a string describing what type of value was passed in.
  # HINT: Use guards with `when` — e.g., def describe(x) when is_integer(x), do: ...
  # HINT: In Elixir, strings are called "binaries" — use is_binary/1 to check for strings.
  #
  #   describe(42)       => "integer"
  #   describe("hello")  => "string"
  #   describe(:ok)      => "atom"
  #   describe([1, 2])   => "list"

  # Exercise 5: first/1
  # Return the first element of a list, or :empty for an empty list.
  # HINT: Lists in Elixir are linked lists. You can destructure them: [head | tail]
  # HINT: You need two clauses — one for [] and one for [head | _tail].
  #
  #   first([1, 2, 3]) => 1
  #   first([:a, :b])  => :a
  #   first([])         => :empty

  # Exercise 6: shape_area/1
  # Calculate the area of a shape given as a tagged tuple.
  # HINT: Pattern match directly on the tuple structure in the function head.
  # HINT: Use :math.pi() for pi.
  #
  #   shape_area({:circle, 5})        => 78.53981633974483
  #   shape_area({:rectangle, 4, 6})  => 24
  #   shape_area({:triangle, 3, 8})   => 12.0

  # Exercise 7: get_info/1
  # Extract information from a user map using pattern matching.
  # HINT: You can match on maps in function heads: %{name: name, role: :admin}
  # HINT: More specific clauses must come first — Elixir tries top-to-bottom.
  #
  #   get_info(%{name: "José", role: :admin}) => "José is an admin"
  #   get_info(%{name: "Chris", role: :user}) => "Chris is a user"
  #   get_info(%{name: "Anon"})               => "Anon has no role"

  # =============================================
  # PHASE 2: Recursion
  # =============================================

  # Exercise 8: count/1
  # Count the number of elements in a list.
  # HINT: What is the count of an empty list? (this is your base case)
  # HINT: For [_head | tail], the count is 1 + count(tail).
  #
  #   count([])          => 0
  #   count(["a", "b", "c"]) => 3

  # Exercise 9: sum/1
  # Sum all numbers in a list.
  # HINT: Very similar structure to count/1.
  # HINT: The sum of an empty list is 0.
  #
  #   sum([])        => 0
  #   sum([1, 2, 3]) => 6

  # Exercise 10: maximum/1
  # Find the largest value in a list.
  # HINT: The base case is a single-element list: [x] — just return x.
  # HINT: Use the built-in max/2 function: max(5, 9) => 9
  #
  #   maximum([5])             => 5
  #   maximum([5, 4, 9, 2, 7]) => 9

  # Exercise 11: reverse/1
  # Reverse a list using a helper function with an accumulator.
  # HINT: Start with: def reverse(list), do: do_reverse(list, [])
  # HINT: Use defp for the private helper function.
  # HINT: Base case: do_reverse([], acc) — just return acc.
  # HINT: Recursive case: move the head onto the accumulator.
  #
  #   reverse([])        => []
  #   reverse([1, 2, 3]) => [3, 2, 1]

  # Exercise 12: zip/2
  # Combine two lists into a list of tuples.
  # HINT: There are two base cases — either list being empty returns [].
  # HINT: The recursive case destructures BOTH lists at once.
  #
  #   zip([], [1, 2, 3])            => []
  #   zip([1, 2, 3], [:a, :b, :c])  => [{1, :a}, {2, :b}, {3, :c}]
  #   zip([1, 2], [:a, :b, :c])     => [{1, :a}, {2, :b}]

  # =============================================
  # PHASE 3: Higher-Order Functions
  # =============================================

  # Exercise 13: reduce/3
  # Reduce a list to a single value using a function and an initial accumulator.
  # HINT: Base case: reduce([], acc, _fun) — return the accumulator.
  # HINT: Recursive case: apply the function to head and acc, then recurse with tail.
  # HINT: Anonymous functions are called with a dot: fun.(arg1, arg2)
  #
  #   reduce([1, 2, 3], 0, fn x, acc -> x + acc end) => 6
  #   reduce([], 42, fn _, acc -> acc end)            => 42

  # Exercise 14: map/2
  # Transform each element in a list using a function.
  # HINT: Build this using your reduce/3 function!
  # HINT: The accumulator is a list. Prepend with [fun.(x) | acc].
  # HINT: You'll need to reverse the result — use your reverse/1!
  #
  #   map([1, 2, 3], fn x -> x * 2 end) => [2, 4, 6]
  #   map([], fn x -> x end)             => []

  # Exercise 15: filter/2
  # Keep only elements where the function returns true.
  # HINT: Build this using your reduce/3 function!
  # HINT: Use an if expression: if fun.(x), do: [x | acc], else: acc
  # HINT: Reverse the result at the end.
  #
  #   filter([1, 2, 3, 4], fn x -> rem(x, 2) == 0 end) => [2, 4]
  #   filter([1, 2, 3], fn _ -> false end)               => []

  # Exercise 16: quicksort/1
  # Sort a list using the quicksort algorithm.
  # HINT: Base case: an empty list is already sorted.
  # HINT: Pick the first element as the pivot: [pivot | rest]
  # HINT: Use your filter/2 to split into lesser and greater.
  # HINT: Concatenate with ++: quicksort(lesser) ++ [pivot] ++ quicksort(greater)
  #
  #   quicksort([])                        => []
  #   quicksort([8, 2, 5, 3, 1, 9, 0, 6]) => [0, 1, 2, 3, 5, 6, 8, 9]
end
