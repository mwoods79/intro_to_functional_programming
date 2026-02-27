---
marp: true
theme: default
paginate: true
---

# Intro to Functional Programming in Elixir

---

## Why Elixir?

- Pattern matching is a core language feature
- Tail call optimization — recursion without blowing the stack

---

## Getting set up

```bash
$ git clone https://github.com/mwoods79/intro_to_functional_programming.git
$ cd intro_to_functional_programming
$ mix test
```

Two tests should pass. Your job: make the rest pass!

---

## How the workshop works

1. Open `test/intro_test.exs` — find the next commented-out test
2. Uncomment it
3. Run `mix test` — it will fail
4. Open `lib/intro.ex` — read the hints and implement the function
5. Run `mix test` — it should pass
6. Repeat!

---

## Data types we'll use

```elixir
42              # integer
3.14            # float
true            # boolean (just atoms!)
:hello          # atom — a named constant
"hello"         # string
[1, 2, 3]      # list — a linked list
{:ok, "value"}  # tuple — fixed-size container
%{name: "José"} # map — key-value pairs
```

---

## What is pattern matching?

The `=` in Elixir is the **match operator**, not assignment:

```elixir
iex> x = 1        # binds x to 1
iex> 1 = x        # succeeds! 1 matches 1
iex> 2 = x        # ** (MatchError)
```

---

## Pattern matching in functions

Elixir tries each function clause **top-to-bottom** until one matches:

```elixir
def greet(:morning), do: "Good morning!"
def greet(:evening), do: "Good evening!"
def greet(:night),   do: "Good night!"
```

---

## Exercise 1: greet/1 (already done!)

Look at `lib/intro.ex` — this is already implemented for you.

```elixir
greet(:morning)  # => "Good morning!"
greet(:evening)  # => "Good evening!"
greet(:night)    # => "Good night!"
```

---

## Exercise 2: b_not/1 (already done!)

Booleans `true` and `false` are just atoms — you can match on them:

```elixir
def b_not(true), do: false
def b_not(false), do: true
```

---

## Exercise 3: b_or/2 and b_and/2

Uncomment the tests and implement!

```elixir
b_or(true, false)   # => true
b_and(true, false)  # => false
```

HINT: The `_` wildcard matches anything.

---

## SOLUTION: b_or and b_and

```elixir
def b_or(true, _), do: true
def b_or(_, true), do: true
def b_or(_, _), do: false

def b_and(true, true), do: true
def b_and(_, _), do: false
```

---

## How it works: clause ordering

```elixir
b_or(false, true)
# Clause 1: b_or(true, _)  — false != true, skip
# Clause 2: b_or(_, true)  — _ matches, true matches
# => true
```

Elixir tries clauses top-to-bottom. The `_` wildcard matches anything and discards the value.

---

## Exercise 4: same?/2

Check if two values are the same.

```elixir
same?(1, 1)       # => true
same?(:a, :a)     # => true
same?(1, 2)       # => false
same?("hi", "ho") # => false
```

HINT: What happens if you use the same variable name twice?

---

## SOLUTION: same?

```elixir
def same?(a, a), do: true
def same?(_, _), do: false
```

---

## Repeated variables in patterns

When the same variable appears twice, Elixir requires both positions to have **the same value**:

```elixir
def same?(a, a), do: true   # only matches when both args are equal
def same?(_, _), do: false  # matches everything else
```

```elixir
{a, a} = {1, 1}    # works! a is bound to 1
{a, a} = {1, 2}    # ** (MatchError) — 1 != 2
```

---

## Exercise 5: describe/1

Return a string describing the type of value.

```elixir
describe(42)       # => "integer"
describe("hello")  # => "string"
describe(:ok)      # => "atom"
describe([1, 2])   # => "list"
```

HINT: Use `when` guards.

---

## SOLUTION: describe

```elixir
def describe(x) when is_integer(x), do: "integer"
def describe(x) when is_binary(x), do: "string"
def describe(x) when is_atom(x), do: "atom"
def describe(x) when is_list(x), do: "list"
```

---

## Guards

Guards extend pattern matching with runtime checks:

```elixir
def absolute(x) when x >= 0, do: x
def absolute(x), do: -x
```

Only a limited set of expressions are allowed in guards.

---

## Exercise 6: first/1

Return the first element of a list, or `:empty` for `[]`.

```elixir
first([1, 2, 3])  # => 1
first([])          # => :empty
```

HINT: `[head | tail]` destructures a list.

---

## SOLUTION: first

```elixir
def first([]), do: :empty
def first([head | _tail]), do: head
```

---

## How it works: list destructuring

```elixir
[head | tail] = [1, 2, 3]
# head => 1
# tail => [2, 3]

[head | tail] = [1]
# head => 1
# tail => []
```

This is **the** fundamental pattern for processing lists.

---

## Exercise 7: shape_area/1

Calculate the area of a shape given as a tagged tuple.

```elixir
shape_area({:circle, 5})
shape_area({:rectangle, 4, 6})
shape_area({:triangle, 3, 8})
```

HINT: Match on the tuple structure directly.

---

## SOLUTION: shape_area

```elixir
def shape_area({:circle, r}), do: :math.pi() * r * r
def shape_area({:rectangle, w, h}), do: w * h
def shape_area({:triangle, b, h}), do: b * h / 2
```

---

## Tagged tuples

A convention in Elixir — use an atom as the first element to "tag" what a tuple represents:

```elixir
{:ok, "success"}
{:error, "not found"}
{:circle, 5}
```

Pattern matching makes this incredibly powerful.

---

## Exercise 8: get_info/1

Extract information from a user map.

```elixir
get_info(%{name: "José", role: :admin}) # => "José is an admin"
get_info(%{name: "Chris", role: :user}) # => "Chris is a user"
get_info(%{name: "Anon"})              # => "Anon has no role"
```

---

## SOLUTION: get_info

```elixir
def get_info(%{name: name, role: :admin}), do: "#{name} is an admin"
def get_info(%{name: name, role: :user}), do: "#{name} is a user"
def get_info(%{name: name}), do: "#{name} has no role"
```

---

## Map matching

You can match on maps in function heads. More specific patterns first!

```elixir
%{name: name, role: :admin} = %{name: "José", role: :admin}
# name => "José"
```

`#{}` inside a string is **string interpolation**.

---

## Pattern Matching Summary

You've now matched on:
- **Atoms**: `:morning`, `true`, `false`
- **Repeated variables**: `def same?(a, a)`
- **Guards**: `when is_integer(x)`
- **Lists**: `[head | tail]`, `[]`
- **Tuples**: `{:circle, r}`, `{:rectangle, w, h}`
- **Maps**: `%{name: name, role: :admin}`

Now let's combine this with **recursion**.

---

## What is recursion?

A function that calls itself, with a **base case** that stops it.

```elixir
def factorial(0), do: 1
def factorial(n), do: n * factorial(n - 1)
```

Pattern matching defines when to stop and when to keep going.

---

## Exercise 9: count/1

Count the elements in a list.

```elixir
count(["a", "b", "c"])  # => 3
count([])                # => 0
```

---

## SOLUTION: count

```elixir
def count([]), do: 0
def count([_head | tail]), do: 1 + count(tail)
```

---

## How it works

```elixir
count(["a", "b", "c"])
# => 1 + count(["b", "c"])
# => 1 + 1 + count(["c"])
# => 1 + 1 + 1 + count([])
# => 1 + 1 + 1 + 0
# => 3
```

---

## Exercise 10: sum/1

Sum all numbers in a list.

```elixir
sum([1, 2, 3])  # => 6
sum([])          # => 0
```

---

## SOLUTION: sum

```elixir
def sum([]), do: 0
def sum([head | tail]), do: head + sum(tail)
```

---

## How it works

```elixir
sum([1, 2, 3])
# => 1 + sum([2, 3])
# => 1 + 2 + sum([3])
# => 1 + 2 + 3 + sum([])
# => 1 + 2 + 3 + 0
# => 6
```

---

## Exercise 11: maximum/1

Find the largest value in a list.

```elixir
maximum([5, 4, 9, 2, 7])  # => 9
```

HINT: `max(5, 9) # => 9`

---

## SOLUTION: maximum

```elixir
def maximum([x]), do: x
def maximum([head | tail]), do: max(head, maximum(tail))
```

---

## How it works

```elixir
maximum([1, 9, 7])
# => max(1, maximum([9, 7]))
# => max(1, max(9, maximum([7])))
# => max(1, max(9, 7))
# => max(1, 9)
# => 9
```

---

## Exercise 12: reverse/1

Reverse a list. This introduces the **accumulator pattern**.

```elixir
reverse([1, 2, 3])  # => [3, 2, 1]
```

HINT: You need a helper function.

```elixir
def reverse(list), do: do_reverse(list, [])
defp do_reverse([], acc), do: ???
defp do_reverse([head | tail], acc), do: ???
```

---

## SOLUTION: reverse

```elixir
def reverse(list), do: do_reverse(list, [])

defp do_reverse([], acc), do: acc
defp do_reverse([head | tail], acc), do: do_reverse(tail, [head | acc])
```

---

## How it works

```elixir
reverse([1, 2, 3])
# => do_reverse([1, 2, 3], [])
# => do_reverse([2, 3], [1])
# => do_reverse([3], [2, 1])
# => do_reverse([], [3, 2, 1])
# => [3, 2, 1]
```

This is **tail recursion** — the last thing each clause does is call itself.
`defp` means the helper is private — only callable inside this module.

---

## Tail call optimization

The BEAM (Erlang VM) optimizes tail calls — when the **last thing** a function does is call itself, it reuses the current stack frame instead of adding a new one.

```elixir
# tail recursive — uses constant stack space
defp do_reverse([head | tail], acc), do: do_reverse(tail, [head | acc])

# NOT tail recursive — must hold the stack to add 1 after the call returns
def count([_head | tail]), do: 1 + count(tail)
```

This means tail-recursive functions can handle lists of any size without overflowing the stack.

---

## Exercise 13: zip/2

Combine two lists into a list of tuples.

```elixir
zip([1, 2, 3], [:a, :b, :c])  # => [{1, :a}, {2, :b}, {3, :c}]
```

HINT: Two base cases, one recursive case.

---

## SOLUTION: zip

```elixir
def zip([], _), do: []
def zip(_, []), do: []
def zip([h1 | t1], [h2 | t2]), do: [{h1, h2} | zip(t1, t2)]
```

---

## Recursion Summary

The pattern is always the same:

1. **Base case** — match the simplest input, return directly
2. **Recursive case** — break input down, process one piece, recurse on the rest

---

## What are higher-order functions?

Functions that take other functions as arguments.

```elixir
add = fn a, b -> a + b end
add.(1, 2)  # => 3
```

Anonymous functions use `fn -> end` and are called with `.()`.

---

## Exercise 14: reduce/3

Reduce a list to a single value using a function.

```elixir
reduce([1, 2, 3], 0, fn x, acc -> x + acc end)  # => 6
```

---

## SOLUTION: reduce

```elixir
def reduce([], acc, _fun), do: acc
def reduce([head | tail], acc, fun) do
  reduce(tail, fun.(head, acc), fun)
end
```

---

## How it works

```elixir
reduce([1, 2, 3], 0, fn x, acc -> x + acc end)
# => reduce([2, 3], 1, fun)   # fun.(1, 0) = 1
# => reduce([3], 3, fun)      # fun.(2, 1) = 3
# => reduce([], 6, fun)       # fun.(3, 3) = 6
# => 6
```

---

## Exercise 15: map/2

Transform every element. Build it using reduce!

```elixir
map([1, 2, 3], fn x -> x * 2 end)  # => [2, 4, 6]
```

---

## SOLUTION: map

```elixir
def map(list, fun) do
  reduce(list, [], fn x, acc -> [fun.(x) | acc] end)
  |> reverse()
end
```

The `|>` pipe operator passes the result of the left side as the first argument to the right side.

---

## Exercise 16: filter/2

Keep only matching elements. Build it using reduce!

```elixir
filter([1, 2, 3, 4], fn x -> rem(x, 2) == 0 end)  # => [2, 4]
```

---

## SOLUTION: filter

```elixir
def filter(list, fun) do
  reduce(list, [], fn x, acc ->
    if fun.(x), do: [x | acc], else: acc
  end)
  |> reverse()
end
```

---

## Obligatory quicksort

```elixir
def quicksort([]), do: []
def quicksort([pivot | rest]) do
  lesser  = filter(rest, fn x -> x <= pivot end)
  greater = filter(rest, fn x -> x > pivot end)
  quicksort(lesser) ++ [pivot] ++ quicksort(greater)
end
```

---

## Exercise 17: quicksort/1

Use everything you've built to sort a list!

```elixir
quicksort([8, 2, 5, 3, 1, 9, 0, 6])
# => [0, 1, 2, 3, 5, 6, 8, 9]
```

HINT: Use `filter` to partition and `++` to concatenate.

---

## Bonus: merge_sort/1

Another way to sort — split, sort each half, merge.

```elixir
merge_sort([8, 2, 5, 3, 1, 9, 0, 6])
# => [0, 1, 2, 3, 5, 6, 8, 9]
```

HINT: `Enum.split/2` splits a list at a position.
HINT: Write a private `merge/2` helper for two sorted lists.

---

## SOLUTION: merge_sort

```elixir
def merge_sort([]), do: []
def merge_sort([x]), do: [x]
def merge_sort(list) do
  mid = div(length(list), 2)
  {left, right} = Enum.split(list, mid)
  merge(merge_sort(left), merge_sort(right))
end

defp merge([], right), do: right
defp merge(left, []), do: left
defp merge([lh | lt], [rh | _] = right) when lh <= rh do
  [lh | merge(lt, right)]
end
defp merge(left, [rh | rt]) do
  [rh | merge(left, rt)]
end
```

---

## What we built today

Starting from just **pattern matching**, we built:

- Boolean logic, type inspection, data destructuring
- List traversal, accumulators
- reduce, map, filter
- Two sorting algorithms

All from **pattern matching** and **recursion**. That's functional programming.

---

## What's next?

- The `Enum` module — Elixir's standard library has all of this built in!
- The pipe operator `|>`
- Processes and concurrency
- OTP and GenServer

Thank you!

---

## Bonus: all?/2

Do all elements satisfy the predicate?

```elixir
all?([2, 4, 6], fn x -> rem(x, 2) == 0 end)  # => true
all?([2, 3, 6], fn x -> rem(x, 2) == 0 end)  # => false
```

HINT: Reduce with `true` as the initial accumulator.

---

## SOLUTION: all?

```elixir
def all?(list, fun) do
  reduce(list, true, fn x, acc -> acc and fun.(x) end)
end
```

---

## Bonus: any?/2

Does any element satisfy the predicate?

```elixir
any?([1, 3, 5], fn x -> rem(x, 2) == 0 end)  # => false
any?([1, 2, 5], fn x -> rem(x, 2) == 0 end)  # => true
```

HINT: Reduce with `false` as the initial accumulator.

---

## SOLUTION: any?

```elixir
def any?(list, fun) do
  reduce(list, false, fn x, acc -> acc or fun.(x) end)
end
```

---

## Bonus: reject/2

The opposite of filter — keep elements where the function returns false.

```elixir
reject([1, 2, 3, 4], fn x -> rem(x, 2) == 0 end)  # => [1, 3]
```

---

## SOLUTION: reject

```elixir
def reject(list, fun) do
  filter(list, fn x -> not fun.(x) end)
end
```

Or build it directly with reduce — your choice!

---

## Bonus: find/2

Return the first element matching a predicate, or nil.

```elixir
find([1, 2, 3], fn x -> x > 1 end)  # => 2
find([1, 2, 3], fn x -> x > 5 end)  # => nil
```

---

## SOLUTION: find

```elixir
def find(list, fun) do
  reduce(list, nil, fn x, acc ->
    if acc == nil and fun.(x), do: x, else: acc
  end)
end
```

---

## Bonus: frequencies/1

Count occurrences of each element. Returns a map.

```elixir
frequencies([:a, :b, :a, :c, :b, :a])
# => %{a: 3, b: 2, c: 1}
```

HINT: `Map.update(map, key, 1, fn count -> count + 1 end)`

---

## SOLUTION: frequencies

```elixir
def frequencies(list) do
  reduce(list, %{}, fn x, acc ->
    Map.update(acc, x, 1, fn count -> count + 1 end)
  end)
end
```

---

## Bonus: flat_map/2

Map then flatten one level.

```elixir
flat_map([1, 2, 3], fn x -> [x, x * 10] end)
# => [1, 10, 2, 20, 3, 30]
```

---

## SOLUTION: flat_map

```elixir
def flat_map(list, fun) do
  reduce(list, [], fn x, acc -> acc ++ fun.(x) end)
end
```

---

## Bonus: join/2

Join a list of strings with a separator.

```elixir
join(["a", "b", "c"], "-")  # => "a-b-c"
join([], "-")                # => ""
```

---

## SOLUTION: join

```elixir
def join([], _sep), do: ""
def join([first | rest], sep) do
  reduce(rest, first, fn x, acc -> acc <> sep <> x end)
end
```

---

## Bonus: chunk_every/2

Split a list into chunks of size n.

```elixir
chunk_every([1, 2, 3, 4, 5], 2)  # => [[1, 2], [3, 4], [5]]
```

HINT: Use a `{current_chunk, all_chunks}` accumulator.

---

## SOLUTION: chunk_every

```elixir
def chunk_every([], _n), do: []
def chunk_every(list, n) do
  {chunk, chunks} =
    reduce(list, {[], []}, fn x, {current, all} ->
      current = current ++ [x]
      if length(current) == n do
        {[], all ++ [current]}
      else
        {current, all}
      end
    end)

  if chunk == [], do: chunks, else: chunks ++ [chunk]
end
```
