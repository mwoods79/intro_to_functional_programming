# Intro to Functional Programming in Elixir

A hands-on workshop teaching pattern matching and recursion from first principles.

## Prerequisites

- Elixir installed (`brew install elixir` on macOS)
- A text editor
- Basic programming experience (any language)

## Getting Started

```bash
git clone <repo-url>
cd intro
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
4. **describe/1** — Type checking with guards
5. **first/1** — List destructuring
6. **shape_area/1** — Tuple pattern matching
7. **get_info/1** — Map pattern matching

### Phase 2: Recursion

8. **count/1** — Count list elements
9. **sum/1** — Sum list elements
10. **maximum/1** — Find the largest element
11. **reverse/1** — Reverse a list (accumulator pattern)
12. **zip/2** — Combine two lists

### Phase 3: Higher-Order Functions

13. **reduce/3** — The fundamental fold
14. **map/2** — Transform elements (built on reduce)
15. **filter/2** — Select elements (built on reduce)
16. **quicksort/1** — Sort a list (capstone!)

## Viewing Slides

```bash
npx @marp-team/marp-cli -s slides.md
```

This opens a browser with the presentation slides.

## Solutions

Solutions for each exercise are shown in the slides.
