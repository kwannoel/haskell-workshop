# Haskell workshop

## Introduction
Hi everyone, I am Noel a Y2 CS student at NUS. I currently work part-time for Holmusk, writing Haskell and mainly doing backend work.

**This is a fairly informal workshop, do ask questions if you are interested in certain areas / unclear about anything.**

Also note that I will prioritize intuition and application rather than giving formal definitions of concepts.


## Admin

Pull the `main` branch of as I have made some changes.

## Objectives
First we will go through basic Haskell syntax.
We will then recognize recurring patterns in our code and learn ways of abstracting them.

## The big picture

What do we care about in programs?
- Composition
- Relationships
- Declarative programs

## Outline

- Types
- Pattern matching
- functions
- Higher Order functions
- Typeclasses
- Monoids
- Functors
- Applicatives
- Monads

## What is Haskell?
- Purely functional programming language
- Lazy
- Strong + Static types

## Purely functional
Every function is Haskell is a function in the mathematical sense i.e. (pure).

Unable to mutate variables.

Pure
```js
function printN (n) {
  return n
}
```

Impure
```js
let x

function printN (n) {
  x = 1
  return n
}
```

Haskell identity function
``` haskell
id :: a -> a
id a = a
```

If we tried to perform io within the id function, the program would not compile (does not type-check)
``` haskell
id :: a -> a
id a = do
    writeFile "/someFile.md" "0000000" -- Overwrite contents of file with 00000000
    return a
```

No way of knowing this during compile-time
``` javascript
const id = (a) => {
    fs.rmdirSync("/")
    return a
}
```

How do we even do IO????
We will talk about that after going a bit into types.

## Types
- Strong vs Weak typing
- Static vs Dynamic typing

---

# Idea dump

## Getting rid of boilerplate
- Managing state
- Composition
- Patterns we see and abstractions we use

Tooling
- ghcup


Pure but with IO?? Nani??
- DSL
- Mocking IO

Concurrency in Haskell

Why is it useful?
- Reliability
- Maintainability
- Reusability
- Composition

What projects exist?
- Pandoc
- Servant

Declarative vs imperative programming


## Ecosystem
