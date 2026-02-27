# Intro to Functional Programming in Elixir

A hands-on workshop teaching pattern matching and recursion from first principles.

## Prerequisites

- Elixir installed (`brew install elixir` on macOS)
- A text editor
- Basic programming experience (any language)

## Getting Started

```bash
git clone https://github.com/mwoods79/intro_to_functional_programming.git
cd intro_to_functional_programming
mix test
```

You should see 2 tests passing. The remaining exercises are commented out in
`test/intro_test.exs`.

## How to Work Through Exercises

1. Open `test/intro_test.exs` and find the next commented-out test
2. Uncomment the test block
3. Run `mix test` — it will fail
4. Open `lib/intro.ex` and find the matching exercise (look for the hints!)
5. Implement the function
6. Run `mix test` — it should pass
7. Move on to the next test

## Exercises

### Phase 1: Pattern Matching

1. **greet/1** — Match on atoms _(done for you!)_
2. **b_not/1** — Boolean NOT _(done for you!)_
3. **b_or/2, b_and/2** — Boolean OR and AND
4. **same?/2** — Repeated variables in patterns
5. **describe/1** — Type checking with guards
6. **first/1** — List destructuring
7. **shape_area/1** — Tuple pattern matching
8. **get_info/1** — Map pattern matching

### Phase 2: Recursion

9. **count/1** — Count list elements
10. **sum/1** — Sum list elements
11. **maximum/1** — Find the largest element
12. **reverse/1** — Reverse a list (accumulator pattern)
13. **zip/2** — Combine two lists

### Phase 3: Higher-Order Functions

14. **reduce/3** — The fundamental fold
15. **map/2** — Transform elements (built on reduce)
16. **filter/2** — Select elements (built on reduce)
17. **quicksort/1** — Sort a list (capstone!)

### Bonus

- **merge_sort/1** — Sort a list using divide and conquer
- **all?/2** — Check if all elements satisfy a predicate
- **any?/2** — Check if any element satisfies a predicate
- **reject/2** — Opposite of filter
- **find/2** — Find the first matching element
- **frequencies/1** — Count occurrences of each element
- **flat_map/2** — Map then flatten
- **join/2** — Join strings with a separator
- **chunk_every/2** — Split a list into chunks of size n

## Viewing Slides

```bash
npx @marp-team/marp-cli -s -I .
```

This opens a browser with the presentation slides.

## Solutions

Solutions for each exercise are shown in the slides.
