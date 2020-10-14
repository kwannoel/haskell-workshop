# Outline

## Introduction:
Whoami?
Hi everyone, I am Noel a Y2 CS student at NUS. I currently work part-time for Holmusk, writing Haskell and mainly doing backend work.

## What is Haskell?
I think you guys may have seen from the description, it has been around for quite sometime, around 1990s till now.

## Features:
- Functional programming
- Strongly and statically typed 

## What is functional programming?

## Pure functions

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

Types???
- Strong vs Weak typing
- Static vs Dynamic typing


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
