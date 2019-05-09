import UIKit

# Hao's Swift Study Notes

(中文版请看[README.cn.md](./README.cn.md))

This is the playground I've used during learning Swift, I mainly read [The Swift Programming Language (Swift 4)](https://docs.swift.org/swift-book/index.html) from Apple, took notes and wrote code as I read.

Soon I realised the notes could be organized in a way so that a human readable markdown could be generated with a little tweaks, and I can even use [Hugo](https://gohugo.io/) to generate an HTML from it and host it somewhere.

As a result, this markdown was directly generated from the code and comments in the playground.

To make this possible, comments in the code have to follow certain convention, in order to have the right content format for markdown as well as keeping Playground able to compile. The convention looks like:

```
// This is a comment, will become text content of **markdown**.
// Below will become a fragment of code:

// ```swift
// let name = "Noname"
// ```
```

**Simple way to generate markdown from above code:**

```
sed 's/^\/\/ //g' SwiftBasicNotes.playground/Contents.swift > ~/Documents/SwiftBasicNotes.md
(strips leading double slashes followed by a space from each line)
```

*(PS: the details of how to generate markdown from the source code is written in the markdown itself, embedded as comments in the source code, this recursion feels weird, doesn't it? It feels like a hungry snake swallows down itself from its own tail.)*

## "Hello, world!" Printing

The classic "Hello, world!" print out illustrates a few things of the language, for example, no semicolon needed to end a line, how a function/method call looks like, how string literal is represented.

```
print("Science may someday discover what faith has always known.")
```

## Table of Contents

- [Constants and Variables](#constants-and-variables)
- [Types and Operations](#types-and-operations)
- [Control Flow](#control-flow)
- [Functions](#functions)
- [Optionals](#optionals)
- [Collection Types](#collection-types)
  - [Array](#array)
  - [Set](#set)
  - [Dictionary](#dictionary)
- [Closures](#closures)
- [Strings and Characters](#strings-and-characters)
- [Enumerations](#enumerations)
- [Classes and Structures](#classes-and-structures)
- [Protocols](#protocols)
- [Generics](#generics)
- [Access Control](#access-control)
- [Advanced Operators](#advanced-operators)
- [Patterns](#patterns)
- [Error Handling](#error-handling)
- [Encoding and Decoding](#encoding-and-decoding)
- [Memory Safety](#memory-safety)
- [Data Structure in Swift](#data-structure-in-swift)
- [Sorting and Searching](#sorting-and-searching)
- [Objective-C](#objective-c)

## Constants and Variables

_constant:_

> Something mysterious is formed, born in the silent void. waiting alone and unmoving, it is at once still and yet in _constant_ motion. It is the source of all programs. I do not know its name, so I will call it the Tao of Programming. - _The Tao of Programming_

_variable:_

> Cloudy; _variable_ winds, with local showers; cooler; snow. - _Halcyon Jones_

```
let <constant name>: <type> = <expression>
var <variable name>: <type> = <expression>
// type can be omitted if it can be inferred, read further
```

- constant or variable must have value set before the first time its value is read
- if the value of a variable isn't modified throughout its lifecycle, or not intended to be modified, define it as a constant instead, this makes sure any unexpected modification could be captured by compiler

```swift
let thereBeLight = true // constant
var livesOfACat = 9 // variable
// thereBeLight = false would generate a compiler error

var firstBody = 0.0, secondBody = 1.2, thirdBody = 5.6
// note, you can't do this:
// var firstBody = secondBody = thirdBody = 1.0
```

[ToC](#table-of-contents)

## Types and Operations

### Type Annotations


