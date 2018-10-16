// //: Playground - noun: a place where people can play //!

import UIKit //!

// # Hao's Swift Study Notes

// (中文版请看[README.cn.md](./README.cn.md))

// This is the playground I've used during learning Swift, I mainly read [The Swift Programming Language (Swift 4)](https://docs.swift.org/swift-book/index.html) from Apple, took notes and wrote code as I read.

// Soon I realised the notes could be organized in a way so that a human readable markdown could be generated with a little tweaks, and I can even use [Hugo](https://gohugo.io/) to generate an HTML from it and host it somewhere.

// As a result, this markdown was directly generated from the code and comments in the playground.

// To make this possible, comments in the code have to follow certain convention, in order to have the right content format for markdown as well as keeping Playground able to compile. The convention looks like:

// ```
// // This is a comment, will become text content of **markdown**.
// // Below will become a fragment of code:

// // ```swift
// // let name = "Noname"
// // ```
// ```

// **Simple way to generate markdown from above code:**

// ```
// sed 's/^\/\/ //g' SwiftBasicNotes.playground/Contents.swift > ~/Documents/SwiftBasicNotes.md
// (strips leading double slashes followed by a space from each line)
// ```

// *(PS: the details of how to generate markdown from the source code is written in the markdown itself, embedded as comments in the source code, this recursion feels weird, doesn't it? It feels like a hungry snake swallows down itself from its own tail.)*

// ## "Hello, world!" Printing

// The classic "Hello, world!" print out illustrates a few things of the language, for example, no semicolon needed to end a line, how a function/method call looks like, how string literal is represented.

// ```
print("Science may someday discover what faith has always known.")
// ```

// ###$interview$###

// Swift has built-in support for things that are common in functional programming, such like `map`, `reduce`, `filter` and `compactMap`, which allows developer to focus only on results without having to write boiler-plate code.
// In this regard, Swift is both object-oriented and functional programming language.

// ## Table of Contents

// - [Constants and Variables](#constants-and-variables)
// - [Types and Operations](#types-and-operations)
// - [Control Flow](#control-flow)
// - [Functions](#functions)
// - [Optionals](#optionals)
// - [Collection Types](#collection-types)
//   - [Array](#array)
//   - [Set](#set)
//   - [Dictionary](#dictionary)
// - [Closures](#closures)
// - [Strings and Characters](#strings-and-characters)
// - [Enumerations](#enumerations)
// - [Classes and Structures](#classes-and-structures)
// - [Protocols](#protocols)
// - [Generics](#generics)
// - [Access Control](#access-control)
// - [Advanced Operators](#advanced-operators)
// - [Patterns](#patterns)
// - [Error Handling](#error-handling)
// - [Encoding and Decoding](#encoding-and-decoding)
// - [Memory Safety](#memory-safety)
// - [Data Structure in Swift](#data-structure-in-swift)
// - [Sorting in Swift](#sorting-in-swift)

// ## Constants and Variables

// _constant:_

// > Something mysterious is formed, born in the silent void. waiting alone and unmoving, it is at once still and yet in _constant_ motion. It is the source of all programs. I do not know its name, so I will call it the Tao of Programming. - _The Tao of Programming_

// _variable:_

// > Cloudy; _variable_ winds, with local showers; cooler; snow. - _Halcyon Jones_

// ```
// let <constant name>: <type> = <expression>
// var <variable name>: <type> = <expression>
// ```

// - **Make sure** constant or variable has value set before the first time its value is read
// - if the value of a variable isn't modified throughout its lifecycle, or not intended to be modified, define it as a constant instead, this makes sure any unexpected modification could be captured by compiler

// ```swift
let catsMaximumNumberOfLives = 9 // constant
var catsCurrentDeathCount = 0 // variable
catsCurrentDeathCount = 9
// // catsMaximumNumberOfLives = 10 would generate a compiler error

// // multiple constants or variables on a single line:
var variable1 = 0.0, variable2 = 1.2, variable3 = 5.6
// ```

// [ToC](#table-of-contents)

// ## Types and Operations

// ### Type Annotations

// ```swift
var welcomeMessage: String
var red, green, blue: Double
var someNumber: Int
// ```

// Semicolon (;) isn't required after each statement although you can;
// Required for separating statements on the same line:

// ```swift
let sameLineGuru = "Same Line"; print("This is Mr. \(sameLineGuru)")
// ```

// string interpolation was used above to include the name of a constant or variable as a placeholder in a longer string, and to prompt Swift to replace it with the current value of that constant or variable.

// ### Integers

// ```swift
let integer8: Int8 // signed 8-bit integer, UInt8 for unsigned
let integer16: Int16 // signed 16-bit integer, UInt16 for unsigned
let integer32: Int32 // signed 32-bit integer, UInt32 for unsigned
let integer64: Int64 // signed 64-bit integer, UInt64 for unsigned
// ```

// Usually `Int` is used, it's the same size as `Int32` on 32-bit platform and same size as `Int64` on 64-bit platform

// #### Integer Bounds

// Unsigned X-bit integer range from 0 to (2^X)-1 inclusive

// Signed X-bit integer range from -(2^(X-1)) to (2^(X-1))-1 inclusive

// ```swift
print("maximum value of UInt16 is \(UInt16.max) which is (2^16)-1 = \(Int(pow(2.0, 16.0) - 1))")
print("minimum value of Int8 is \(Int8.min) which is -(2^(8-1)) = \(-Int(pow(2.0, 8.0 - 1.0)))")
print("maximum value of Int32 is \(Int32.max) which is (2^(32-1))-1 = \(Int(pow(2.0, 32.0 - 1.0)) - 1)")
// ```

// ### Floating Points

// - `Double`: a 64-bit floating-point number, usually preferred
// - `Float`: a 32-bit floating-point number

// ### Type Safe and Type Inferences

// ```swift
let youth = 3
// // inferred to be type `Int`

let experienceOfYouth = 0.14
// // inferred to be type `Double`

let pi = 3 + 0.1415926
// // Inferred to be type `Double`

// // you can't get pi by adding:
// // let youthAndExperienceOfYouth = youth + experienceOfYouth
// // error: binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
// // (you can't have youth and experience of youth at the same time)
// ```

// ### Type Conversion

// ```swift
let alsoPi = Double(youth) + experienceOfYouth
let werePi = Int(alsoPi) // lost precision
// ```

// ### Type Alias

// ```swift
typealias Mood = UInt8
print("mood: happy = \(Mood.max) sad = \(Mood.min)")
// ```

// ### Booleans

// ```swift
let fake = false
let truth = true
// ```

// ### Assignment operator

// ```swift
var b = 10
var a = 5
a = b // a is now equal to 10
let (x, y) = (1, 2) // x is 1 and y is 2
// ```

// ### Arithmetic operator

// ```swift
1 + 2       // addition (+)
5 - 3       // subtraction (-)
2 * 3       // multiplication (*)
10.0 / 2.5  // division (/)
9 % 4       // remainder (%)
-5          // unary minus
+6          // unary plus
// ```

// ### Compound assignemnt operators

// ```swift
a = 1
a += 2
a -= 5
a *= 3
a /= 2
// ```

// ### Comparison Operators

// ```swift
1 == 1  // equal to
2 != 1  // not equal to
2 > 1   // greater than
1 < 2   // less than
1 >= 1  // greater than or equal to
2 <= 1  // less than or equal to
// ```

// You can compare two tuples if they have the same type and the same number of values,
// tuples are compared from left to right, and you can compare "Apple" with "Orange"

// ```swift
(1, "zebra") < (2, "apple")
// // 1 is less than 2 and "zebra" and "apple" are not compared

(3, "apple") < (3, "orange")
// // 3 is equal to 3 and "apple" is less than "orange"

(4, "dog") == (4, "dog")
// // all equal
// ```

// ### Tuples

// ```swift
let someCoordinates: (Int, Int) = (3, 6)
let someOtherCoordinates = (21, 97)
// // type inference without type `(Int, Int)`

// // access value by index:
print("some coordinate is (\(someCoordinates.0), \(someCoordinates.1))");

// // access value by name:
let someCoordinatesNamed = (x: 71, y: 89)
print("some coordinate has x = \(someCoordinatesNamed.x) and y = \(someCoordinatesNamed.y)")
// ```

// ### Range operators

// _closed range operator_:
// `(a...b)` defines a range from `a` to `b` inclusive, `a` must not be greater than `b`.

// _half-open range operator_:
// `(a..<b)` defines a range from `a` up to, but not include `b`.

// _one-sided range_:
// a range that continue as far as possible, e.g. `array[3...]` from 3 to the end, `array[...9]` from beginning up to 9

// ```swift
let someArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(someArray[5...])
print(someArray[...3])
// ```

// ### Terminology

// - _Unary_ operators operate on a single target
//   - unary _prefix_ operators appear immediately before their targets (such as `!b`)
//   - unary _postfix_ operators appear immediately after their targets (such as `c!`)
// - _Binary_ operators operate on two targets
//   - e.g. 2 + 3
//   - are _infix_ because they appear between their two targets
// - _Ternary_ operators operate on three targets
//   - only ternary operator: `a ? b : c`

// [ToC](#table-of-contents)

// ## Control Flow

// [Comparison Operators](#comparison-operators) let you compare values and get an answer of either `true` or `false`

// ### `if` statement

// ```
// if <condition> {
//     <statement>
// }
// ```

// ```
// if <condition1> {
//     <statement1>
// } else if <condition2> {
//     <statement2>
// } else {
//     <statement3>
// }
// ```

// ```
// if <condition> {
//     <statement1>
// } else {
//     <statement2>
// }
// ```

// ```swift
let isOnePlusOneEqualThree = (1 + 1) == 3
// false, `==` equality comparison

let isFake = isOnePlusOneEqualThree == false

if isFake == true {
    print("Fake, is the new truth")
}
// ```

// ```swift
let nameOfAnimal = "Deer"
if nameOfAnimal == "Horse" {
    print("Chaos.")
} else {
    print("A place where we don't have to lie.")
}
// ```

// ### Short Circuiting

// ```swift
if "country" > "people" && 1 + 1 == 2 {
    // here it won't check if 1 + 1 equals to 2
    // because the first condition is already wrong
    print("We can sacrifice the people for the benefit of the country.")
} else {
    print("Fighting for the people is fighting for the country.")
}
// // Result: Fighting for the people is fighting for the country.
// ```

// ```swift
var someoneIsDrunk = true
var divorceAgreementReadyToSign = true

if someoneIsDrunk || divorceAgreementReadyToSign == false {
    // here it doesn't matter if divorce agreement is ready to sign or not
    // because the person is already drunk
    // ie. first condition true
    print("Let's decide later.")
}
// ```

// ### Ternary Conditional Operator

// ```
// (<CONDITION>) ? <TRUE VALUE> : <FALSE VALUE>
// ```

// ```swift
let weightOfMountain = 9
let weightOfFeather = 1
let onesLife = 0
let anotherOnesLife = 10

var lifeDescription = onesLife < weightOfFeather ? "lighter than a feather" : "more than a feather"
print("Someone's life is \(lifeDescription).")
// // Someone's life is lighter than a feather.

lifeDescription = anotherOnesLife > weightOfMountain ? "heavier than a mountain" : "less than a mountain"
print("Someone's life is \(lifeDescription).")
// // Someone's life is heavier than a mountain.
// ```

// ### Loops

// #### `while` Loop

// ```
// while <CONDITION> {
//     <LOOP CODE>
// }
// ```

// ```swift
let weekendStarts = 6
var today = 1
while today < weekendStarts {
    print("Day \(today): start the day with a smile, after that you can be your nasty old self again.")
    today += 1
}
print("Day \(today): weekend starts")
// ```

// ```
// repeat {
//     <LOOP CODE>
// } while <CONDITION>
// ```

// ```swift
let fullCupOfWater = 5
var waterInCup = fullCupOfWater

repeat {
    if (waterInCup > 0) {
        print("Like this cup, you are full of opinions and speculations.\nTo see the light of wisdom, you first must empty your cup before adding more.")
        waterInCup -= 1
    }
} while waterInCup > 0
// ```

// #### `for` Loop

// ```
// for <CONSTANT> in <COUNTABLE RANGE> {
//     <LOOP CODE>
// }
// ```

// ```swift
let totalVersions = 5
for currentVersion in 1...totalVersions {
    print("Current version: \(currentVersion)")
}
// ```

// **`where`**

// ```swift
let versionNumberOfBadLuck = 4
for currentVersion in 1...totalVersions where currentVersion != versionNumberOfBadLuck {
    print("Current version: \(currentVersion)")
}
// ```

// **`continue` and Labeld Statements**

// ```swift
for currentVersion in 1...totalVersions {
    if currentVersion == versionNumberOfBadLuck {
        print("We skip version \(currentVersion) to avoid bad luck.")
        continue // start next loop and ignore the remaining loop code
    }
    print("Current version: \(currentVersion)")
}
// ```

// **Example**

// Dating with different lovers:

// - avoid dating if wife might know
// - we'll be in big trouble if the lover is also wife's friend and wife might know the dating

// ```swift
let numberOfSecretLovers = 3
let plannedDatesPerLover = 5
let loverThatIsAlsoWifesFriend = 2
let dateThatWifeMightKnow = 4

lover: for currentLover in 1...numberOfSecretLovers {
    date: for currentDate in 1...plannedDatesPerLover {
        print("lover \(currentLover) date \(currentDate)")
        if currentLover == loverThatIsAlsoWifesFriend && currentDate == dateThatWifeMightKnow {
            print("We are in trouble now.")
            break lover
        } else if currentDate == dateThatWifeMightKnow {
            print("Do not date if wife might know.")
            continue date
        }
        print("Let's go dating.")
    }
}
// ```

// ### Switch

// ```
// switch <control expression> {
// case <pattern 1>:
//     <statements>
// case <pattern 2> where <condition>:
//     <statements>
// case <pattern 3> where <condition>,
//      <pattern 4> where <condition>:
//     <statements>
// default:
//     <statements>
// }
// ```

// ```swift
let occupied = true, unoccupied = false
var gender = "boy" // try changing it to "girl"
var toiletOccupancy = (male: occupied, female: unoccupied)

switch toiletOccupancy {
case let (male, female) where male != female:
    print("At least one toilet is empty")
fallthrough // continue the statements below
case (male: true, _) where gender == "boy":
    // male toilet is empty
    // and boys do not care about female toilet
    print("boy can use toilet now")
case (_, female: true) where gender == "girl":
    // female toilet is empty
    // and girls do not care about male toilet
    print("girl can use toilet now")
case (male: true, female: false) where gender == "girl":
    print("girl has to use boy's toilet if urgent")
case (male: false, female: true) where gender == "boy":
    print("boy has to use girl's toilet if urgent")
default:
    // **exhaustive**: every possible value of the control expression’s type
    // must match the value of at least one pattern of a case
    // `default case` can be used to satisfy this if it's not feasible.
    break;
}
// ```

// ```swift
var schoolYear = 3 // try changing it to something within 1...12
switch schoolYear {
case 1...3:
    print("You don't know you don't know.")
case 4...6:
    print("You know you don't know.")
case 7...9:
    print("You don't know you know.")
case 10...12:
    print("You know you know.")
default:
    // exhaustive: “every possible value of the control expression’s type
    // must match the value of at least one pattern of a case”
    // `default case` can be used to satisfy this if it's not feasible.
    break
}
// ```

// [ToC](#table-of-contents)

// ## Functions

// ```
// func <function name>(<parameters>) -> <return type> {
//     statements
// }
// ```

// If the function has a return type of `Void` (ie. no return value):

// ```
// func <function name>(<parameters>) {
//     statements
// }
// ```

// Forms of a parameter:

// ```
// <parameter name>: <parameter type>
// <argument label> <parameter name>: <parameter type>
// _ <parameter name>: <parameter type>
// ```

// ```swift
func add(a: Int, b: Int) -> Int {
    return x + y
}

func sayHi(to person: String) {
    print("Hi, \(person)!")
}

sayHi(to: "future")

func sayHi(_ person: String) {
    print("Hi, \(person)!")
}

sayHi("people")
// ```

// #### Change a parameter directly

// Terminology: copy-in copy-out, call by value result

// ```swift
let vampiresAppetitePerPerson = 0.4
func payTax(for income: inout Double) {
    income *= (1.0 - vampiresAppetitePerPerson)
}

var income = 100.00
payTax(for: &income)

print("After tax, income becomes \(income)")
// // Prints "After tax, income becomes 60.0"
// ```

// ### Functions as variables

// A function that takes a parameter, and returns another function that uses the parameter:

// **Example**

// Define a generic function that returns a function mimicing money deduction behaviour with specified deduction rate

// ```swift
func createMoneyDeductor(with percentage: Double) -> (Double) -> Double {
    // define and return another function:
    func bloodSuckingVampire(bloodQuantity: Double) -> Double {
        return bloodQuantity * (1 - percentage)
    }
    return bloodSuckingVampire
}

let taxOffice = createMoneyDeductor(with: 0.3)
let laywer = createMoneyDeductor(with: 0.1)
let dentist = createMoneyDeductor(with: 0.1)

income = 10_000.00
print("Start with income \(income)")
income = taxOffice(income)
income = laywer(income)
income = dentist(income)
print("After tax, laywer and dentist, now it becomes \(income)")
// ```

// ### Function that Never Returns

// ```swift
func oneInfiniteLoop() -> Never {
    print("DO NOT CALL THIS FUNCTION OR:")
    while true {
        print("Falling apple on your head.")
    }
}
// ```

// [ToC](#table-of-contents)

// ## Optionals

// A variable holding either some value, or nothing.

// ```
// <Type>?
// ```

// ```swift
var errorCode: Int?
errorCode = 404
errorCode = nil
// ```

// **force unwrap**

// ```swift
errorCode = 500
print("Error code is \(errorCode!)")
// ```

// **optional binding**

// ```swift
if let errorCode = errorCode {
    print("Error code is \(errorCode)")
} else {
    print("No error.")
}
// ```

// ***$interview$***

// Both reference type and value type can be optional, they both represent the situation when the variable has no value. There's no such a concept in Objective-C, although a variable of reference type can be assigned `nil`, to indicate the variable has no (referenced) value.

// [ToC](#table-of-contents)

// ## Collection Types

// ```
// Array[Element]
// [Element] // short form
// ```

// ### Array

// ```swift
var someNumbers = [Int]()

someNumbers.append(9)
someNumbers = [] // type has been provided as `Int`
// ```

// #### Array with default value

// ```swift
var fiveNumbers = Array(repeating: 1.2, count: 3)
// result: [1.2, 1.2, 1.2]
// ```

// #### Adding two array together

// ```swift
let threePowers = ["Executive", "Legislative", "Judicial"]
let twoPowers = ["Supervision Audit", "Examination"]
let fivePowers = threePowers + twoPowers
// ```

// #### Accessing and modifying array

// ```swift
var shoppingList = ["Wine", "Coffee", "Cigarette"]
print("Shopping list has \(shoppingList.count) items")

if shoppingList.isEmpty {
    print("Shopping list is empty")
} else {
    print("Shopping list isn't empty")
}

shoppingList.append("Panado")
shoppingList += ["Meat", "Tea"]

var firstItem = shoppingList[0]

shoppingList[3] = "Condom"
shoppingList[3...4] = ["Energy Drink"]
// shoppingList: ["Wine", "Coffee", "Cigarette", "Energy Drink", "Tea"]

shoppingList.insert("Honey", at: 0)
let honey = shoppingList.remove(at: 0)
// ```

// #### Iterating Over an Array

// ```swift
for item in shoppingList {
    print("Shopping list item: \(item)")
}

for (index, item) in shoppingList.enumerated() {
    print("Shopping list item \(index): \(item)")
}
// ```

// #### Implementation

// `Array` in Swift combines and replaces `NSArray` and `NSMutalbeArray` in Objective-C, there are several kinds of arrays.

// - `ContiguousArray<Element>`: a specialized array that always stores its elements in a contiguous region of memory, this is the most efficient implementation.
// - `Array<Element>`: store its elements in either a contiguous region of memory or an NSArray instance if its Element type is a class or @objc protocol.
// - `ArraySlice<Element>`: a slice of an Array, ContiguousArray, or ArraySlice instance, it represents a view onto the storage of a larger array instead of copying over elements into a new storage.

// #### copy-on-write

// ***$interview&***

// When value-type is copied, the copied version still points to the same memory location as the original version, only when copied version is modified, a new memory region is allocated for the copied version. This means that memory footprint of copied value type only increases when copied value changes, this ensures maximum efficiency of memory usage.

// [ToC](#table-of-contents)

// ### Set

// #### Hash Value for Set Types

// `Set` can only contain _hashable_ values
// if `a == b`, then `a.hashValue == b.hashValue`

// #### Creating Sets

// ```swift
var letters = Set<Character>()
letters.insert("a")
letters = []
// ```

// ```swift
var someColors: Set<String> = ["Blue", "White", "Red"]
var someOtherColors: Set = ["Sunset", "Autumn", "Zen"]
// ```

// #### Operations

// **Count**

// ```swift
print("Other colors have \(someOtherColors.count) colors")
// ```

// **Check Empty**

// ```swift
if someOtherColors.isEmpty {
    print("No color, is the real color.")
} else {
    print("There are a few colors in it.")
}
// ```

// **Insert and Remove**

// ```swift
someColors.insert("Cyan")
if let removedColor = someColors.remove("Yellow") {
    print("\(removedColor) removed from someColors")
} else {
    print("someColors does not have Yellow in it")
}
// ```

// **Union and Intersection**

// ```
let openDays: Set = [1, 2, 3, 4, 5]
let closedDays: Set = [6, 7]
openDays.union(closedDays)
openDays.intersection(closedDays)
// ```

// ***$interview$***

// Given an array of numbers and a target value, determine whether the array has two numbers whose sum equals to the target value

// ```
func twoSum(numbers: [Int], _ target: Int) -> Bool {
    var set = Set<Int>()

    for number in numbers {
        if set.contains(target - number) {
            return true
        }
        set.insert(number)
    }
    
    return false
}

func twoSumIndices(numbers: [Int], _ target: Int) -> (Int, Int)? {
    var dict = [Int: Int]()
    for (index, number) in numbers.enumerated() {
        if let lastIndex = dict[target - number] {
            return (lastIndex, index)
        } else {
            dict[number] = index
        }
    }
    return nil
}
// ```

// [ToC](#table-of-contents)

// ### Dictionary

// #### Creating a Dictionary

// ```
// // creating empty dictionary:
var meaningsOfAges = [String: String]()
meaningsOfAges["eighteen"] = "By which the acquired collection of prejudices become common sense"
// ```

// ```
// // creating with dictionary literal:
var meaningOfWords = ["agreement": "when people are tired of thinking"]
// // `String` type inferred for `var meaningOfWords: [String: String]`
// ```

// #### Dictionary operations

// ```swift
if meaningsOfAges.isEmpty == false {
    print("At least one age has some meaning")
}

meaningsOfAges["one"] = "One year closer to death"

if let meaningOf18 = meaningsOfAges["eighteen"] {
    print("The meaning of age 18:\n\(meaningOf18)")
}
// ```

// #### Iterating Over a Dictionary

// ```swift
for (age, meaning) in meaningsOfAges {
    print("Meaning of \(age): \(meaning)")
}
// ```

// [ToC](#table-of-contents)

// ## Closures

// Function without name:

// ```
// { (<parameters>) -> <return type> in
//     statement
// }
// ```

// ```swift
let cups = ["A", "B", "C", "D", "E"]
let biggestCup = cups.sorted { (c1: String, c2: String) -> Bool in
    c1 > c2
    }.first!
let smallestCup = cups.sorted { (c1: String, c2: String) -> Bool in
    c1 < c2
    }.first!
print("Biggest cup is \(biggestCup), most environemtnal friendly cup is \(smallestCup)")
// ```

// ### Inferring type from context

// without parameter type:

// ```swift
cups.sorted { (c1, c2) -> Bool in
    c1 > c2
}
// ```

// without return type:

// ```swift
cups.sorted { (c1, c2) in c1 > c2 }
// ```

// shorthand argument names:

// ```swift
cups.sorted { $0 > $1 }
// ```

// operator methods:

// ```swift
cups.sorted(by: >)
// ```

// - A closure can _capture_ constants and variables from the surrounding context in which it is defined.
// - Closures are reference types

// ### Escaping closures

// A closure is said to _escape_ a function when the closure is passed as an argument to the function,
// but is called after the function returns.

// ```swift
var executionGround: [() -> Void] = []

func executionSuspended(prisonerExecution: @escaping () -> Void) {
    executionGround.append(prisonerExecution)
}

func executionImmediate(prisonerExecution: () -> Void) {
    prisonerExecution() // execute immediately
}

executionSuspended {
    print("Summer is here, will autumn be far away?")
}

executionImmediate {
    print("Don't laugh if I lay drunken on the battleground, how many warriors ever came back safe and sound?")
    // only this is executed
}
// ```

// ### Autoclosures

// ```swift
var toBeInDinnerPlate = ["Chicken", "Duck", "Fish", "Pork"]
print(toBeInDinnerPlate.count) // Prints "4"

let dinnerProvider = { toBeInDinnerPlate.remove(at: 0) }
print(toBeInDinnerPlate.count) // Prints "4"

print("Now serving \(dinnerProvider())!")
// // Prints "Now serving Chicken!"
print(toBeInDinnerPlate.count) // Prints "3"

// // parameter: () -> String
// // argument is auto converted to a closure
func serve(dinner provider: @autoclosure () -> String) {
    print("Now serving \(provider())!")
}

// // now can pass a String
serve(dinner: "Vegetable")
// // "Hi" will be converted to a closure that returns this string
// // which is only evaluated when being called
// ```

// ***$interview$***

// Implement OR (||) operation.

// Flawed version:

// ```
// func ||(left: Bool, right: Bool) -> Bool {
//     if left {
//         return true
//     } else {
//         return right
//     }
// }
// ```

// The problem with above implementation is that both `left` and `right` sides are evaluated when `left` is `true`, so there's a better implementation using autoclosure:

// ```
// func ||(left: Bool, right: @autoclosure () -> Bool) -> Bool {
//     if left {
//         return true
//     } else {
//         return right()
//     }
// }
// ```

// [ToC](#table-of-contents)

// ## Strings and Characters

// - string literals can be single or multi line
// - backslash (\) can be used to make the string easier to read but won't have line break in the final string
// - blank line as the first and/or last line in multiline string as line feed
// - indentation is only considered after the indentation of triple quotation marks
// - special characters are espaced with backslash
// - unicode can be written with \u{<CodePoint>}
// - strings are value types

// ```swift
let quotationSingleLine = "There be light."
let quotationMultiLine = """

And God said, \
Let there be light:
and there was light.

"""
// ```

// final string:

// ```
// And God said, Let there be light:
// and there was light.
// ```

// ### Create emtpy string

// ```swift
var emptyString = ""
var anotherEmptyString = String()
// ```

// ```swift
if emptyString.isEmpty {
    print("Unfortunately the emptiness of a string can't be derived from its name.")
}
// ```

// You can do this:

// ```swift
emptyString += "no longer empty"
// ```

// ### Strings are sequence of characters

// ```swift
for character in "Dog🐶Inside!" {
    print(character)
}

let nethackCharacters: [Character] = ["T", "h", "e", " ", "n", "e", "w", "t", " ", "b", "i", "t", "e", "s"]
var nethackString = String(nethackCharacters)
print(nethackString)
// // Prints "The newt bites"

nethackString += "!"
// ```

// ### Unicode

// Unicode is an international standard for encoding text in different languages, it covers much more than the original ASCII character set, however the underlying representation are still integers. Integers within certain ranges (U+0000 to U+D7FF inclusive, U+E000 to U+10FFFF inclusive) are called Unicode Scalars.

// ### Extended grapheme clusters

// Every instance of Swift’s Character type represents a single extended grapheme cluster. An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character.

// ```swift
let eAcute: Character = "\u{E9}"
// // é

let combinedEAcute: Character = "\u{65}\u{301}"
// // e followed by  ́ (the thing above e)
// ```

// ### Accessing and Modifying a String

// Because a character in Unicode may consist of more than one number, anything related to indices, inculding counting the number of characters in a string, becomes tricky. A swift string can't be indexed by integer values, the type of index is `String.Index`

// ```swift
var word = "cafe"
word.count // 4
word += "\u{301}"
word.count // 4
// ```

// ```swift
let science = "ABCDEFGHIJKMNPQRTVWXYZ"

print(science[science.startIndex])
// // A

print(science[science.index(before: science.endIndex)])
// // Z

print(science[science.index(after: science.startIndex)])
// // B

let index7 = science.index(science.startIndex, offsetBy: 7)
print(science[index7])
// // H
// ```

// ```swift
var indexS: String.Index? = science.index(of: "S")
var indexO: String.Index? = science.index(of: "O")
var indexU: String.Index? = science.index(of: "U")
var indexL: String.Index? = science.index(of: "L")

if (indexS == nil && indexO == nil && indexU == nil && indexL == nil) {
    print("science has no SOUL")
}
// ```

// **inserting**

// ```swift
var sentence = "you understand"
sentence.insert(contentsOf: "could ", at: sentence.startIndex)
sentence.insert(contentsOf: "?", at: sentence.endIndex)
print(sentence)
// // Print: "could you understand?"
// ```

// **replacing**

// ```swift
let range1 = sentence.range(of: "oul")!
sentence.replaceSubrange(range1, with: "ulo")
let range2 = sentence.range(of: "nderstan")!
sentence.replaceSubrange(range2, with: "redntsna")
print(sentence)
// // Prints: "culod you uredntsnad?"
// ```

// **substrings**

// ```swift
let englishForDummy = "therapist"
let indexOfR = englishForDummy.index(of: "r")!
let firstWord = englishForDummy[..<indexOfR]
let lastWord = englishForDummy[indexOfR...]
print("Have you ever realised the word \"\(englishForDummy)\" is made up by \"\(String(firstWord))\" and \"\(String(lastWord))\"?")
// // Prints: "Have you ever realised the word "therapist" is made up by "the" and "rapist"?
// ```

// ***$interview$***

// Given a string, return another string which is a reverse of given string by words,
// example: "what the f**k" becomes "f**k the what"

// ```
func reverse<T>(_ things: inout [T], _ start: Int, _ end: Int) {
    var startIndex = start, endIndex = end
    while startIndex < endIndex {
        (things[startIndex], things[endIndex]) = (things[endIndex], things[startIndex])
        startIndex += 1
        endIndex -= 1
    }
}

func reverseWords(_ s: String?) -> String? {
    guard let s = s else {
        return nil
    }
    
    var mutableString = Array(s), start = 0
    reverse(&mutableString, 0, mutableString.count - 1)
    
    for i in 0..<mutableString.count {
        if i == mutableString.count - 1 || mutableString[i + 1] == " " {
            reverse(&mutableString, start, i)
            start = i + 2
        }
    }
    
    return String(mutableString)
}

reverseWords("what the f**k")
// // prints: f**k the what
// ```

// Note: one could use of `components(separatedBy:)` and `joined(separator:)`, but interview question is usually not this straight forward, at least a more primitive solution could make you stand out among other interviewees.

// [ToC](#table-of-contents)

// ## Enumerations

// > the average pencil is seven inches long, with just a half-inch eraser-in **case** you thought optimism was dead. -- Robert Brault

// Some history regarding switch-case - in case you need to show off your knowledge to friends:
//
// In his 1952 text Introduction to Metamathematics, Stephen Kleene formally proved that the CASE function (the IF-THEN-ELSE function being its simplest form) is a primitive recursive function.
//

// ### Syntax

// ```
// enum <enumeration name> {
//     <enumeration definitions>
// }
// ```

// each case can be a single line:

// ```swift
enum PlanetVertical {
    case mercury
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
}
// ```

// or multiple cases can appear on a single line:

// ```swift
enum PlanetHorizontal {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
// ```

// enumeration type can be inferred

// ```swift
enum Direction {
    case north
    case west
    case south
    case east
}

var lostDirection: Direction
var nextDirection = Direction.east

lostDirection = .north
nextDirection = .west
// ```

// ### Switch matching

// ```swift
switch lostDirection {
case .north, .west, .south:
    print("Lost in the wild")
case .east:
    print("You need a pilot")
}
// ```

// Remember `switch` must be exhaustive

// ```swift
switch nextDirection {
case .east:
    print("Be prepared.")
default:
    print("Why not heading east?")
}
// ```

// ### Associated Values

// **Example**

// Define an enumeration for daily attendence,
// if unattended, give and execuse as well as a real reason,
// define three functions, evaluate the execuse and reason for unattendence,
// from perspectives of teacher, manager and self

// ```swift
enum DailyAttendence {
    case attended
    case unattended(execuse: String, realReason: String)
}

func teacherEvaluate(_ attendence: DailyAttendence) {
    switch attendence {
    case .attended:
        print("Keep up")
    case .unattended(_, let realReason):
        print("I need to talk to your parents regarding \(realReason)")
    }
}

func managerEvaluate(_ attendence: DailyAttendence) {
    switch attendence {
    case .attended:
        print("Keep up")
    case .unattended(let execuse, _):
        print("I'm fine with \(execuse)")
    }
}

func selfEvaluate(_ attendence: DailyAttendence) {
    switch attendence {
    case .attended:
        print("A boring day")
    case let .unattended(execuse, realReason):
        print("I have \"\(execuse)\" as execuse for the real reason of \"\(realReason)\"")
    }
}

let jackyAttendence: DailyAttendence = DailyAttendence.unattended(execuse: "alarm clock stopped working", realReason: "late sleep watching TV")
teacherEvaluate(jackyAttendence)
// // I need to talk to your parents regarding late sleep watching TV

let goodsonAttendence: DailyAttendence = DailyAttendence.attended
teacherEvaluate(goodsonAttendence)
// // keep up

let mrUnsatisiable: DailyAttendence = DailyAttendence.unattended(execuse: "sick", realReason: "job interview")
managerEvaluate(mrUnsatisiable)
// // I'm fine with sick

selfEvaluate(mrUnsatisiable)
// // I have "sick" as execuse for the real reason of "job interview"
// ```

// ### Raw Values

// Implicit:

// ```swift
enum Month : Int {
    case january = 1
    case feburary // 2
    case march // 3
    case april // 4
    case may // 5
    case june // 6
    case july // 7
    case august // 8
    case september // 9
    case october // 10
    case november // 11
    case december // 12
}

print("September has a value of \(Month.september.rawValue)")
// // Print "September has a value of 9"
// ```

// ```swift
enum SomeNames : String {
    case michael
    case tom
    case jack
}

print("case tom has raw value of \(SomeNames.tom.rawValue)")
// // Print "case tom has raw value of tom"
// ```

// ### Initializing from raw value

// ```swift
var monthNumber = 7
if let month = Month(rawValue: monthNumber) {
    switch month {
    case .july:
        print("Month of examination, graduation and boy/girl-friend breaking up.")
    default:
        print("Some other month")
    }
} else {
    print("Cannot recognize month number")
}
// ```

// ### Recursive enumerations

// A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases

// ```swift
enum Trap {
    case rightWayOut
    indirect case wayOut(Trap)
}

let eternity = Trap.wayOut(Trap.rightWayOut)
let love = Trap.wayOut(eternity)

func escape(from trap: Trap) {
    switch trap {
    case .rightWayOut:
        print("Found the right way out")
    case .wayOut(let anotherTrap):
        print("Fall into another trap")
        escape(from: anotherTrap)
    }
}

escape(from: love)
// // Fall into another trap
// // Fall into another trap
// // Found the right way out
// ```

// ### Different Uses of Enum

// - enum can have methods inside it, the methods are for each case (so if a method performs case-dependent action, it need to consider all cases)
// - enum can be a good way of representing hierarchy, structure and even certain kinds of flow

// **Example**

// An `enum` representing seasons with method that evolves to next season

// ```swift
enum Season: String, CustomStringConvertible {

    case spring
    case summer
    case autumn
    case winter

    mutating func next() {
        switch self {
        case .spring:
            self = .summer
        case .summer:
            self = .autumn
        case .autumn:
            self = .winter
        case .winter:
            self = .spring
        }
    }
    
    var description: String {
        return "It's \(self.rawValue) now."
    }
}

var currentSeason = Season.spring
print(currentSeason)
currentSeason.next()
print(currentSeason)
// ```

// Prints:
// It's spring now.
// It's autumn now.

// **Example**

// An 'enum' representing stages of love and with ability to evolve

// ```swift
enum StageOfLove: String {
    case acquaint
    case inLove
    case marriage
    case accustomed
    case bored
    case stranger
    case separate
    case lost
}

extension StageOfLove {
    func nextStageWithTime() -> StageOfLove {
        guard self != .lost else {
            preconditionFailure("No time left")
        }
        
        switch self {
        case .acquaint:
            return .inLove
        case .inLove:
            return .marriage
        case .marriage:
            return .accustomed
        case .accustomed:
            return .bored
        case .bored:
            return .stranger
        case .stranger:
            return .separate
        case .separate:
            return .lost
        default:
            preconditionFailure()
        }
    }
    
    func memoryRecall() -> StageOfLove {
        guard self == .separate else {
            preconditionFailure("You never know how deep you are involved unless you lost it.")
        }
        return .lost
    }
}

extension StageOfLove: CustomStringConvertible {
    var description: String {
        switch self {
        case .acquaint, .inLove, .marriage, .accustomed:
            return "You are the one"
        case .bored, .stranger, .separate:
            return "Memory fades as time goes by, we got seperated as we were pacing."
        case .lost:
            return "The moment I turned round, I found that you were not there. Suddenly, I was flustered."
        }
    }
}

var currentStage = StageOfLove.acquaint
var nextStage = currentStage.nextStageWithTime()
print("\(currentStage.rawValue) becomes \(nextStage.rawValue)")

currentStage = nextStage
nextStage = currentStage.nextStageWithTime()

print("\(currentStage.rawValue) becomes \(nextStage.rawValue)")

currentStage = nextStage
nextStage = currentStage.nextStageWithTime()

print("\(currentStage.rawValue) becomes \(nextStage.rawValue)")

currentStage = nextStage
nextStage = currentStage.nextStageWithTime()

print("\(currentStage.rawValue) becomes \(nextStage.rawValue)")

currentStage = nextStage
nextStage = currentStage.nextStageWithTime()

print("\(currentStage.rawValue) becomes \(nextStage.rawValue)")

currentStage = nextStage
nextStage = currentStage.nextStageWithTime()

print("\(currentStage.rawValue) becomes \(nextStage.rawValue)")

currentStage = nextStage
nextStage = currentStage.nextStageWithTime()

print(currentStage)
print(nextStage)

// ```

// prints:
//
// acquaint becomes inLove
// inLove becomes marriage
// marriage becomes accustomed
// accustomed becomes bored
// bored becomes stranger
// stranger becomes separate

// Memory fades as time goes by, we got seperated as we were pacing.
// The moment I turned round, I found that you were not there. Suddenly, I was flustered.

// ### Enum with Generic parameters

// Enum can be defined with generic parameters for associated values

// **Example**
// Define an `enum` representing success and error response with generic response and error type

// ```swift
enum Response<SuccessType, ErrorType> {
    case success(SuccessType)
    case failure(ErrorType)
}

let response1 = Response<String, Int>.success("valid response")
let response2 = Response<String, Int>.failure(404)

func print(response: Response<String, Int>) {
    switch response {
    case .success(let message):
        print("success message: \(message)")
    case .failure(let errorCode):
        print("error code: \(errorCode)")
    }
}

print(response1)
print(response2)
// ```

// [ToC](#table-of-contents)

// ## Classes and Structures

// Declare a class:

// ```swift
class Love { // class name
    // <statements>
    // }
// ```

// Class/Type constant:

// ```swift
    // by default, love isn't persistent
    static let defaultPersistency = false
// ```

// Stored properties

// ```swift
var name: String?
let thorny = true // constant
    
// // inferred boolean variable
var isPersistent = defaultPersistency
var looksPretty: Bool // variable
// ```

// Computed property

// ```swift
var tastesGood: Bool {
// // computed property
// // must be variable
    return !looksPretty
}
// ```

// Lazy property

// ```swift
lazy var complexity: Int = { [unowned self] in
    if let name = self.name {
        return name.lengthOfBytes(using: .utf8)
    } else {
        return 123
    }
}()
// ```
    
// Initializer

// ```swift
// // non-optional properties must be
// // initialized before use
init(looksPretty: Bool, name: String? = nil) {
    self.looksPretty = looksPretty
    self.name = name
}
// ```
    
// Instance method

// ```swift
func printDescription() {
    Love.printNotes(about: self)
}
// ```
    
// Class/Type method

// ```swift
// // `final` indicates cannot be overwritten
final func displayName() -> String {
    return self.name ?? self.defaultName()
}

func defaultName() -> String {
    return "love"
}
// ```

// ```swift

// // called when no reference to the instance
// // ie. reference counter reaches 0
deinit {
    print("\(self.displayName()) disappeared in a puff of logic")
}

static func printNotes(about love: Love) {
    let displayName = love.displayName()
    print("Notes about \(love.defaultName()):")

    if let name = love.name {
        print("\(love.defaultName()) has a name of \"\(name)\"")
    } else {
        print("\(love.defaultName()) has noname")
    }

    if love.thorny {
        print("\(displayName) is thorny")
    }

    if love.isPersistent {
        print("\(displayName) can be persistent")
    } else {
        print("\(displayName) \(Love.defaultPersistency ? "lasts forever" : "doesn't last long") by default")
    }

    let look = love.looksPretty ? "looks pretty" : "looks ugly"
    let taste = love.tastesGood ? "tastes good" : "tastes bad"

    if love.looksPretty == love.tastesGood {
        print("\(displayName) \(look) and \(taste)")
    } else {
        print("\(displayName) \(look) but \(taste)")
    }
}
// ```

// Property Observer

// ```swift
    var notes: String? {
        willSet {
            if let newNotes = newValue {
                print("Notes will be \(newNotes)")
            }
        }
        didSet {
            if let notes = self.notes, let oldNotes = oldValue {
                print("Notes has been set to \(notes) from \(oldNotes)")
            }
        }
    }
// ```

// ***$interview$***

// Note: setting a property in `init`, `willSet` and `didSet` won't trigger property observer.

} //!

// make some loves:

// ```swift
let someLove = Love(looksPretty: false)
someLove.printDescription()
let someHate = Love(looksPretty: true, name: "Hate")
someHate.isPersistent = true
someHate.printDescription()
// ```

// `someLove` prints

// ```
// Notes about love:
// love has noname
// love is thorny
// love doesn't last long by default
// love looks ugly but tastes good
// ```

// `hate` prints

// ```
// Notes about Hate:
// love has a name of "Hate"
// Hate is thorny
// Hate can be persistent
// Hate looks pretty but tastes bad
// ```

// ```swift
struct Address {
    
    // type constant
    static let format = "British"
    
    var nickName: String
    var streetNumber: String
    var streetName: String
    var suburb: String
    var state: String
    var postcode: String
    var country: String
    
    var fullAddress: String {
        return "\(streetNumber) \(streetName), \(suburb), \(state) \(postcode), \(country)"
    }
    
    mutating func updateNickName(_ nickName: String) {
        self.nickName = nickName
    }
}
// ```

// ***$interview$***

// Be careful, `mutating` prefix is need for `struct` and `enum` to modify its own value.

// ```swift
print("Using \(Address.format) format")
// ```

// ```swift
// // default struct-wise initializer
let address = Address(nickName: "Beehive", streetNumber: "123", streetName: "Straight Street", suburb: "Curveless", state: "XYZ", postcode: "1234", country: "Unobtainable")
print(address.fullAddress)
// ```

// ### Inheritance

// ```swift
// // hate is a kind of love
class Hate: Love {
    init() {
        super.init(looksPretty: false, name: "exclusive love")
        self.isPersistent = true
    }
    
    // `override` keyword used here
    override func defaultName() -> String {
        return "hate"
    }
}

let moreHate = Hate()
moreHate.printDescription()
// ```

// `moreHate` prints:

// ```
// Notes about hate:
// hate has a name of "exclusive love"
// exclusive love is thorny
// exclusive love can be persistent
// exclusive love looks ugly but tastes good
// ```

// ### `required` and `convenience` initializers

// - `required` initializer makes sure subclass still implements the initializer
//   - `required init(name: String)`
// - `convenience` initializer is forced to call a non-convenience initializer directly or indirectly
//   - `convenience init()`
// - non-convenience initializer is called *designated* initializer
// - a designated initializer must call a designated initializer from its immediate superclass.
// - a convenience initializer must call another initializer from the same class.
// - a convenience initializer must ultimately call a designated initializer.

// ### Identify operators
// Check whether two constants or variables refer to the same single instance:
// - Identical to (===)
// - Not identical to (!==)

// ```swift
let fakeLove = someLove
print("someLove is fakeLove? \(someLove === fakeLove)")
// ```

// ### Deinitialization

// ```swift
var shortTermLove: Love? = Love(looksPretty: true)
shortTermLove = nil
// ```

// Prints:

// love disappears in a puff of logic

// ### class vs struct

// ***$interview$***

// *class*:

// - reference type, object with identity, e.g. `Student`
// - slower on heap
// - updated with logic
// - internals can remain mutable even when declared with `let`
// - can be inherited
// - type conversion can check the type of instance at runtime
// - can use `deinit`
// - same instance can be referenced more than once

// *struct*:

// - value type, object without identity, e.g. `Address`, copy on assignment
// - faster on stack
// - simple data store, safer for multi-threading
// - immutable when declared with `let`

// [ToC](#table-of-contents)

// ## Protocols

// ### Define a protocol

// ```swift
protocol Rescuable {
    
    // method:
    func rescue()
    
    // property:
    var distanceToGod: UInt { get set }
    var hasBeenSaved: Bool { get }
    
    // initializer
    init?(initialDistanceToGod: UInt)
}
// ```

// ### Implementing a protocol

// ```swift
class Person: Rescuable {
    
    var distanceToGod: UInt
    
    // satisfied by a `required` initializer in non-final class
    required init?(initialDistanceToGod: UInt) {
        if initialDistanceToGod == 0 {
            print("Already rescued, not a human anymore")
            return nil
        }
        self.distanceToGod = initialDistanceToGod
    }
    
    func rescue() {
        if distanceToGod > 0 {
            distanceToGod -= 1
        }
    }
    
    var hasBeenSaved: Bool {
        return distanceToGod == 0
    }
}
// ```

// Swift doesn't care how you implement a protocol, as long as you implemnet it.
// Choices for implementing a `get` property in protocol:

// - a constant stored property
// - a variable stored property
// - a read-only computed property
// - a read-write computed property

// ### Implementing multiple protocols

// We define an `Evil` protocol:

// ```swift
protocol Evil {
    func fulfilDesire()
}
// ```

// ### Adopt protocol using extension

// Make `Person` also implements `Evil`

// ```swift
extension Person: Evil {
    func fulfilDesire() {
        self.distanceToGod += 1
    }
}
// ```

// ```swift
func commentary(of thing: Rescuable & Evil) {
    print("Something that is evil but rescuable")
    
    if thing.hasBeenSaved {
        print("God saved you")
    } else {
        print("distance to God: \(thing.distanceToGod)")
        thing.fulfilDesire()
        print("desire makes the distance to God becomes \(thing.distanceToGod)")
        thing.rescue()
        print("after rescue, distance to God becomes \(thing.distanceToGod)")
    }
}

let person = Person(initialDistanceToGod: 20)!
commentary(of: person)

let distance = person.distanceToGod
for _ in 1...distance {
    person.rescue()
}

commentary(of: person)
// // Print: "God saved you"
// ```

// [ToC](#table-of-contents)

// ## Generics

// > It is __generally__ agreed that "Hello" is an appropriate greeting because if you entered a room and said "Goodbye," it could confuse a lot of people.
// > -- Dolph Sharp, "I'm O.K., You're Not So Hot"

// ### Generic Function

// Suppose you want to create a function that swaps the values of its parameters, and the function has to work for different types. Instead of having one function per data type, you can have one single function with generic type. **It is like a super-type of different types.**

// ```swift
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var humanWorld = ""
var hell = "full of evil"
swapValues(&humanWorld, &hell)
// // `hell` is now empty, `humanWorld` is now "full of evil"
// ```

// ### Generic Types

// Here we want to create a Box that contains objects of generic types

// ```swift
struct Box<Stuff> {
    var stuff = [Stuff]()
    mutating func putin(_ stuff: Stuff) {
        self.stuff.append(stuff)
    }
    mutating func pickup() -> Stuff {
        return stuff.removeLast()
    }
}
// ```

// `Stuff` is a generic type - there's no need to hard code any real type (concrete or protocol) in the `Box` definition; When we create a `Box` instance, we need to specify a type that replaces `Stuff`:

// ```swift
var magicBox = Box<String>()
magicBox.putin("rabbit")
magicBox.putin("apple")
magicBox.putin("hat")

print("Something from the box: \(magicBox.pickup())")
// // print: hat
// ```

// ### Type Constraints

// ***$interview$***

// ```swift
// func fight<G: GoodProtocol, E: EvilProtocol>(somethingGood: G, somethingEvil: E)
// ```

// Why not:

// ```swift
// func fight(somethingGood: GoodProtocol, somethingEvil: EvilProtocol)
// ```

// Because the compiler must be able to figure out at __compile time__ what types are used, if either `GoodProtocol` or `EvilProtocol` has `associatedtype` or defined in a way that certain constraints it declares must be satisfied, using the protocol directly won't compile.

// For example, the code below would not work:

// ```swift
// func exists(object: Equatable, in array: [Equatable]) -> Bool {
//     return array.contains(object)
// }
// ```

// while this does:

// ```swift
func exists<T: Equatable>(object: T, in array: [T]) -> Bool {
    return array.contains(object)
}
// ```

// ### Associated Types

// Sometimes it can be useful to specify `associatedtype` in `protocol`, they behave like placeholder.

// Imagine we have a very generic `Generator` which generates output of `OutputType`, from input of `InputType`:

// ```swift
protocol Generator {
    associatedtype InputType
    associatedtype OutputType
    func generate(input: InputType) -> OutputType
}
// ```

// And we also define `Transformable` protocol:

// ```swift
protocol Transformable {
    associatedtype TransformType
    func transform() -> TransformType
}
// ```

// ### Associated Types with Constraints

// Define a `ChainedGenerator` which has has `InputProvider` and `OutputConsumer` of type `Generator`, that generates input and consumes output

// ```swift
protocol ChainedGenerator: Generator {
    associatedtype InputProvider: Generator where InputProvider.OutputType == InputType
    associatedtype OutputConsumer: Generator where OutputConsumer.InputType == OutputType
    func generate(input: InputProvider, consumer: OutputConsumer) -> OutputConsumer.OutputType
}
// ```

// Conforming to the `Generator` protocol, we want to describe the photosynthesis of green plants that absorbs carbon dioxide and generates oxygen.

// > There are some micro-organisms that exhibit characteristics of both plants and animals. When exposed to light they undergo __photosynthesis__; and when the lights go out, they turn into animals. But then again, don't we all?

// ```swift
protocol Photosynthate {
    // photosynthate: n. the product of photosynthesis
    init()
    func emit()
}
// ```

// Now we can define the generator:

// ```swift
class Photosynthesizer<T: Transformable, P: Photosynthate>: Generator where T.TransformType == P {
    func generate(input: T) -> P {
        return input.transform()
    }
}

struct CO2<P: Photosynthate>: Transformable {
    func transform() -> P {
        print("transforming CO2…")
        return P()
    }
}

struct Oxygen: Photosynthate {
    init() {}
    func emit() {
        print("emitting oxygen…")
    }
}
// ```

// Now we can have our green plant:

// ```swift
// // Define a green plant that is a `Photosynthesizer` (thus a `Generator`), its input is CO2 (a `Transformable`) that can transform to `Oxygen`
let greenPlant = Photosynthesizer<CO2<Oxygen>, Oxygen>()
greenPlant.generate(input: CO2<Oxygen>()).emit()
// // print:
// // transforming CO2…
// // emitting oxygen…
// ```

// We can abstract the idea of `Photosynthesizer` and create a `DefaultGenerator` that __semantically__ works for any `Transformable` (`Photosynthesizer` requires the `Transformable`'s `TransformType` conforms to `Photosynthate`):

// ```swift
class DefaultGenerator<T: Transformable, O>: Generator where O == T.TransformType {
    func generate(input: T) -> O {
        return input.transform()
    }
}
// ```

// It could be further simplified:

// ```swift
class TransformBasedGenerator<T: Transformable>: Generator {
    func generate(input: T) -> T.TransformType {
        return input.transform()
    }
}
// ```

// > the world we live in / is like a junkyard / people are like bugs / fighting against each other for food / all we eat is conscience / all we shit is opinions
// > "Junkyard" - He Yong

// ```swift
struct Conscience: Transformable {
    func transform() -> String {
        return "transforming conscience into opinions"
    }
}

let junkyard = TransformBasedGenerator<Conscience>()
print(junkyard.generate(input: Conscience()))
// // print: transforming conscience into opinions
// ```

// ### Generics with where clause

// ```swift
func compareTransform<T1: Transformable, T2: Transformable>(_ transformable1: T1, _ transformable2: T2) -> Bool where T1.TransformType == T2.TransformType, T1.TransformType: Equatable {
    let transformed1 = transformable1.transform()
    let transformed2 = transformable2.transform()
    return transformed1 == transformed2
}
// ```

// ### Extension with generics

// Create an extension of `Array` for `Statement` to check whether a true statement exists.

// ```swift
struct Statement: CustomStringConvertible {
    let sentence: String
    let isTruth: Bool
    var description: String {
        return "This is a \(isTruth ? "true" : "false") statement."
    }
}

let statement1 = Statement(sentence: "The following statement is true", isTruth: true)
let statement2 = Statement(sentence: "The previous statement is false", isTruth: false)

let statements = [statement1, statement2]

extension Array where Element == Statement {
    var hasTrueStatement: Bool {
        return self.contains(where: { $0.isTruth })
    }
}

print("Has true statement? \(statements.hasTrueStatement ? "Y" : "N")")
// ```

// ### Generics subscript

// ```swift
extension Array where Element == Statement {
    subscript<Indices: Sequence>(indices: Indices) -> [Element]
        where Indices.Iterator.Element == Int {
            var result = [Element]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}

let partialStatements = statements[[1, 0]]
print(partialStatements)
// ```

// [ToC](#table-of-contents)

// ## Access Control

// A module is a single unit of code distribution, can be imported by another module using `import`.

// ### Syntax

// ```swift
public class PublicPool {}
internal class InternalChangeRoom {}
fileprivate class MaleFilePrivateBath {}
private class PrivateLocker {}

public var publicFeedback = "Good"
internal let internalComments = "Not great"
fileprivate func someFilePrivateFunction() {}
private func privateFunctionRoom() {}
// ```

// ### Access control levels

// ***$interview$***

// - `open` and `public` entities can be used within any source file from their defining module, and also in source files from other modules that imports the defining module. Usually used for framework public interface.
// - `internal` entities can be used within any source file from defining module but not in any file outside.
// - `file-private` entities can only be used by its own defining source file.
// - `private` entities can be used only by the enclosing declaration and extensions of the declaration in the same file
// - default access level is `internal`

// *`open` vs `public`*

// - `public` classes and members can be subclassed / overridden only within its defining module.
// - `open` classes and members can be subclassed / overridden within its defining module as well as importing module.

// No entities can be defined in terms of another entity that has more restrictive access level

// _an `open` property defined in a `private` class, or a `public` function with `private` type parameters is like saying you can get a gift without buying our product and details are written on a note inside our product package._

// ### Unit tests targets

// A unit test target can access any internal entity, if you mark the import declaration for a product module with the `@testable` attribute and compile that produce module with testing enabled.

// ### Custom types

// The access control level of a type also affects the default access level of the type's members

// - private or file private type -> private or type private members
// - internal or public type -> internal members
// - public type defaults to have internal members, to ensure public-facing API for a type doesn't expose internal workings by mistake

// ### Other types

// You can skip to the end of the below list for **simple way to remember**.

// - the access level for a **tuple type** is the most restrictive access level of all types used in the tuple
// - the access level for a **function type** is the most restrictive access level of the function's parameter types and return type, access level must be specified as part of function definition if its calculated access level doesn't match its contextual default
// - individual cases of an **enumeration** has same access level as the enumeration
// - types used for any **raw values** or **associated values** in enumeration must have access level at least as high as the enumeration
// - **nested types** has the same kind of access level rule as custom types -> members, actually nested types are also a kind of member of enclosing type
// - a **subclass** can't have higher access level than its superclass, however, an override can make an inherited class member more accessible than its superclass version
// - a **constant**, **variable** or **property** can't be more public than its type
// - **getters** and **setters** for constants, variables, properties, and subscripts have the same access level as the constants, variables or properties
// - you can give a **setter** a *lower* access level than its corresponding **getter**: `fileprivate(set)`, `private(set)` or `internal(set)` before the `var` or `subscript` introducer
// - custom **initializers** can be assigned an access level less or equal to the type that they initialize
// - a **required initializer** must have the same access level as the class it belongs to
// - **default initializer** has the same access level as the type it initializes, unless for `public` type the default initializer is `internal`
// - **default memberwise initializer** for a structure type has the same access level of the lowest access level of the structure's stored properties, `public` structure has `internal` default initializer unless specified explicitly
// - the access level of each requirement within a **protocol** definition is automatically set to the same access level as the protocol
// - a type can **conform to a protocol** with a lower access level than the type itself
// - this is not about Access Control, just here to test if you read carefully; So, if you see this, you can be confident that you are a careful person
// - any type members added in an **extension** have the same default access level as type members declared in the original type being extended
// - you can mark an extension with explicit access-level modifier, e.g. `private extension`
// - a type alias can have an access level less than or equal to the access level of the type it aliases

// **simple way to remember**
// - the volume of a timber bucket depends on the shorted piece of timber
// - imagine a passenger on a airplane has recently visited virus infected area and not feeling well on the plane, all passengers have to be examined.

// [ToC](#table-of-contents)

// ## Advanced Operators

// ### Bitwise operators

// > one and zero looked just right, made for each other: 1, the definite, upright line; and 0, the diagram of nothing at all - Sadie Plant, _zeros + ones_

// **Bitwise NOT**

// ```swift
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits // equals 11110000
// ```

// **Bitwise AND**

// ```swift
let partialTruth: UInt8 = 0b11111000
let missingTruth: UInt8 = 0b00111001
let theRealTruth = partialTruth & missingTruth // equals 00111000
// ```

// **Bitwise OR**

// ```swift
let upperTeeth: UInt8 = 0b01010101
let lowerTeeth: UInt8 = 0b10101010
let bite = upperTeeth | lowerTeeth // equals 11111111
// ```

// **Bitwise XOR**

// ```swift
let boysAndGirls: UInt8 = 0b00010100
let girlsAndBoys: UInt8 = 0b00000101
let nextGenerationExistence = boysAndGirls ^ girlsAndBoys
 // equals 00010001
// ```

// **Bitwise shift**

// **unsigned integers**:

// 1. existing bits are moved to the left or right by the requested number of places
// 2. any bits moved beyond the bounds of integer's storage are discarded
// 3. zeros are inserted in the spaces left behind

// **signed integers**: when shifting signed integers to the right, apply the same rule as unsigned integers, but fill any empty bits on the left with the _sign bit_, rather than with a zero.

// **Overflow operators**

// ```swift
var unsignedOverflow = UInt8.max // 255
// // unsignedOverflow += 1 would cause an error
unsignedOverflow = unsignedOverflow &+ 1 // 0
// ```

// - overflow addition (`&+`)
// - overflow subtraction (`&-`)
// - overflow multiplication (`&*`)

// ### Precedence and Associativity

// ```swift
2 + 3 % 4 * 5 // equals 17
2 + ((3 % 4) * 5) // equals 17
// ```

// ### Operator Methods

// Classes and structures can provide their own implementation of existing operators (ie. _overloading_).

// **Example**

// The universe was born with two concepts: spirit and material. `Characteristic` is a structure
// with `spirit` and `material` as boolean properties. Use this as a start, define custom operators and
// derive the follows: human, evil and divine.

// ```swift
struct Characteristic {
    var spirit = false
    var material = false
}

infix operator &|
infix operator |&
prefix operator ...

extension Characteristic {
    
    static func && (left: Characteristic, right: Characteristic) -> Characteristic {
        return Characteristic(spirit: left.spirit && right.spirit, material: left.material && right.material)
    }
    
    static func || (left: Characteristic, right: Characteristic) -> Characteristic {
        return Characteristic(spirit: left.spirit || right.spirit, material: left.material || right.material)
    }
    
    static func &| (left: Characteristic, right: Characteristic) -> Characteristic {
        return Characteristic(spirit: left.spirit && right.spirit, material: left.material || right.material)
    }
    
    static func |& (left: Characteristic, right: Characteristic) -> Characteristic {
        return Characteristic(spirit: left.spirit || right.spirit, material: left.material && right.material)
    }
    
    static prefix func ... (c: Characteristic) -> String {
        switch (c.spirit, c.material) {
        case (true, false):
            return "Spirit without matter"
        case (false, true):
            return "Souless materialist"
        case (false, false):
            return "Neither spirit or material, initial void"
        case (true, true):
            return "Ordinary people, mind and body"
        }
    }
}

let spiritual = Characteristic(spirit: true, material: false)
let material = Characteristic(spirit: false, material: true)

let human = spiritual || material
let evil = spiritual &| material
let divine = spiritual |& material

print("Human: \(...human)")
print("Evil: \(...evil)")
print("Divine: \(...divine)")
// ```

// [ToC](#table-of-contents)

// ## Patterns

// A _pattern_ represents the structure of a single value or a composite value. e.g. (1, 2) is a comma-separated list of two elements, matched by the pattern (x, y).

// ### Wildcard Pattern

// ```swift
let somethingImportant = "Don't struggle which side of bread you spread butter on - you eat both sides."
for _ in 1...3 {
    // repeat three times
    print(somethingImportant)
}
// ```

// ### Identifier pattern

// An identifier pattern is the variable or constant itself, matched by any value.

// ```swift
let someValue = 123
// ```

// ### Value binding pattern

// Binds matched values to variable or constant names

// ```swift
let point = (1, 9, 3)
switch point {
case let (x, 9, _):
    print("At y-coordinate 9, x-coordinates of \(x), there's something on the z-plane.")
default:
    break
}
// ```

// ### Tuple pattern

// Comma-separated list of zero or more patterns, enclosed by parentheses.

// ```swift
let (goodNews, badNews): (Int, Int) = (2, 3)
// ```

// ```swift
let newsGoodBadPerDay = [(1, 0), (3, 2), (5, 7)]
for (goodNews, _) in newsGoodBadPerDay {print("ignore bad news, number of good news on the day: \(goodNews)")}
// ```

// The parentheses around a single element pattern has no effect, the followings are equivalent:

// ```swift
let someonesAge = 1
let (sometowsAge) = 2
let (somethreesAge): Int = 3
// ```

// ### Optional pattern

// An optional pattern matches values wrapped in a `some(Wrapped)` case of an `Optional<Wrapped>` enumeration.

// ```swift
let kingsClothes: Int? = nil
if case .some(let x) = kingsClothes {
    print(x)
} else {
    print("Kid: the King has no clothes!")
}

if case let x? = kingsClothes {
    print(x)
} else {
    print("Kid: the King has no clothes!")
}
// ```

// ### Type-casting patterns

// ```
// is <type>
// <pattern> as <type>
// ```

// ### Expression pattern

// Value of expression. Appears only in `switch` statement case label.

// ```swift
let spaceDust = (102, 57, 81)
switch spaceDust {
case (0, 0, 0):
    print("Origin")
case (-10...10, -10...10, -10...10):
    print("Around origin")
default:
    print("Somewhere else")
}
// ```

// You can overload `~=` operator to provide custom expression matching behaviour

// ```swift
func ~=(pattern: String, value: Int) -> Bool {
    return pattern == "\(value)"
}

switch spaceDust {
case ("0", "0", "0"):
    print("Space dust starts from origin")
default:
    print("Space dust has gone from origin")
}
// ```

// [ToC](#table-of-contents)

// ## Error Handling

// If you have Java background, error handling is the similar trick as Java's `try...catch...` and `throw`.
// In Swift, errors are represented by values of types that conform to the empty `Error` protocol
// which indicates that type can be used for error handling.

// Enumerations are well suited to modelling a group of related error conditions.

// ```
// func functionThatThrowsErrors() throws -> String
// func functionThatDoesntThrowError() -> String
// ```

// ### Handling errors using do-catch

// ```
// do {
//     try <expression>
//     <statements>
// } catch <pattern 1> {
//     <statements>
// } catch <pattern 2> where <condition> {
//     <statements>
// }
// ```

// **Example**

// In the classic of Buddhism, there are seven types of sorrows in life: birth, aging, sickness, death, separation of lovers, hatred and unsatisfiable desire.
// Represents each type of sorrows as an `Error`, define a function that can throw these errors, and a piece of code that try the function and catch possible errors.

// ```swift
enum SorrowOfLife: Error {
    case birth(msg: String)
    case aging(msg: String)
    case sickness(msg: String)
    case death(msg: String)
    case separationOfLovers(msg: String)
    case hatred(msg: String)
    case unsatisfiableDesire(msg: String)
}

enum LifeTarget {
    case human, god
}

func rollDiceOfLife(for target: LifeTarget) throws -> String {
    guard target == .human else {
        return "silent, calm and harmony"
    }
    
    let sorrows: [SorrowOfLife] = [.birth(msg: "sin entered the world through one's birth"),
                                   .aging(msg: "there was a face in the mirror like a face out of time"),
                                   .sickness(msg: "if we got sick, at least we didn't die"),
                                   .death(msg: "death through sin, so death came to all people, because all sinned"),
                                   .separationOfLovers(msg: "over the sea grows the moon bright; We gaze on it far, far apart. Lovers complain of long, long night."),
                                   .hatred(msg: "why then when people part, is the moon full and bright?"),
                                   .unsatisfiableDesire(msg: "happiness lies in contentment")]
    
    let number = arc4random_uniform(UInt32(sorrows.count + 1))
    if number < sorrows.count {
        throw sorrows[Int(number)]
    }
    
    return "there is still hope"
}

do {
    let diceResult = try rollDiceOfLife(for: .human)
    print("dice result: \(diceResult)")
} catch SorrowOfLife.birth(let msg) {
    print("sorrow of life: \(msg)")
} catch SorrowOfLife.aging(let msg) {
    print("sorrow of life: \(msg)")
} catch SorrowOfLife.sickness(let msg) {
    print("sorrow of life: \(msg)")
} catch SorrowOfLife.death(let msg) {
    print("sorrow of life: \(msg)")
} catch SorrowOfLife.separationOfLovers(let msg) {
    print("sorrow of life: \(msg)")
} catch SorrowOfLife.hatred(let msg) {
    print("sorrow of life: \(msg)")
} catch SorrowOfLife.unsatisfiableDesire(let msg) {
    print("sorrow of life: \(msg)")
} catch _ {
    print("something unexpected in life")
}
// ```

// ### Error to optional values

// ```swift
if let onesLife = try? rollDiceOfLife(for: .human) {
    print("One's life: \(onesLife)")
} else {
    print("One's life thrown error.")
}
// ```

// ### Disabling error propagation

// sometimes you know there won't be an error thrown

// ```swift
let divineLife = try! rollDiceOfLife(for: .god)
print("Divine's life: \(divineLife)")
// ```

// ### Cleanup with `defer`

// > I expect to pass through life but once. If therefore, there be any kindness I can show, or any good thing I can do to any fellow being, let me do it now, and not defer or neglect it, as I shall not pass this way again. -- William Penn

// excuted when current scope exists, in reverse order; I guess it is to have a logical way of cleanup from the most recent to the least recent changes; It's like when you go upstairs from level 1 to level 3, and you want to go downstairs, you have to follow the reversed way as when you went up, that is level 3, 2, 1.

// ```
func printInstructions() {
    print("Velilind's Laws of Experientation:")
    print("1. If reproducibility may be a problem, conduct the test only once.")
    defer {
        print("cleanup step 1")
    }
    print("2. If a straight line fit is required, obtain only two data points.")
    defer {
        print("cleanup step 2")
    }
}

printInstructions()

// // prints:
// // Velilind's Laws of Experientation:
// // 1. If reproducibility may be a problem, conduct the test only once.
// // 2. If a straight line fit is required, obtain only two data points.
// // cleanup step 2
// // cleanup step 1
// ```

// Guess what happens if you put `defer` inside `defer`?

// ```
func quoteMarkTwain() {
    defer { print("wisdom never to use either") }
    defer { defer { print("freedom of thought") } }
    defer { defer { defer { print("freedom of speech") } } }
    print("It is by the fortune of God that, in this country, we have three benefits:")
}

quoteMarkTwain()

// // prints:
// // It is by the fortune of God that, in this country, we have three benefits:
// // freedom of speech
// // freedom of thought
// // wisdom never to use either
// ```


// `defer` blocks don't __capture__ the current value of a variable.

// ```
func tasteOfLove() {
    var taste = "sweet"
    defer { print("a bit \(taste)") }
    taste = "sour"
    defer { print("a bit \(taste)") }
    print("Taste of the first time one falls in love:")
}

tasteOfLove()
// ```

// We want to express that sweet and sour are the taste of the first time one falls in love, however there's only sour printed.

// [ToC](#table-of-contents)

// ## Encoding and Decoding

// ### Protocols

// *Encodable*

// ```swift
// func encode(to: Encoder) throws
// ```

// *Decodable*

// ```swift
// init(from decoder: Decoder) throws
// ```

// *Codable*

// ```swift
// typealias Codable = Encodable & Decodable
// ```

// ### Automatic coding

// Conforming to `Codable` and make sure all stored properties are also codable

// **Example**

// a fool with a tool (is still a fool).

// ```swift
struct Fool: Codable {
    var id: String
    var name: String
    var tool: Tool
    
    // renaming properties
    enum CodingKeys: String, CodingKey {
        case id = "identifier"
        case name
        case tool
    }
}

struct Tool: Codable {
    var name: String
}
// ```

// ### Coding custom types

// ```swift
var tool = Tool(name: "Too")
var fool = Fool(id: "007", name: "Foo", tool: tool)

let jsonEncoder = JSONEncoder()
let jsonData = try! jsonEncoder.encode(fool)
let jsonString = String(data: jsonData, encoding: .utf8)!
print(jsonString)

let jsonDecoder = JSONDecoder()
fool = try! jsonDecoder.decode(Fool.self, from: jsonData)
// ```

// - `CodingKeys` is a nested enumeration inside the type
// - conforms to `CodingKey`
// - also need `String` as raw type
// - include all properties in the enumeration including the ones that are not renamed
// - created by default, implemented when renaming is needed

// ### Limitation

// - `extension` cannot conform to `Codable`
// - must use concrete type to encode and decode

// [ToC](#table-of-contents)

// ## Memory Safety

// ***$interview$***

// Similar to Objective-C, memory management in Swift is also based on ARC (Automatic Reference Counting), when there's no reference to an object, its allocated memory will be released, otherwise, if there's at least one reference to the object, it will stay in memory until further notice.

// - **strong** is the default, when a reference of object is declared as **strong**, the reference is strongly hold, and the object's reference counter will increment by 1
// - **weak references** don't increase/decrease the **reference count** of a certain object, declared as optionals, they become `nil` once the reference count reaches zero
// - **unowned references** behave similar to `weak`, they always expect to have a value - can't be declared as optional.
// - use `weak` when object can be deallocated while referencing, for example, `delegate`
// - use `unowned` when object cannot be deallocated while referencing, for example, referencing `self` in an escaping completion block

// ### Capture list

// A **capture list** is an array of variables captured by a closure

// **Example**

// Pokemon runs fast, we want to catch Pikachu when it appears.

// ```swift
var pokemon = "Pikachu"
var closure = { print("Let's catch \(pokemon)") }
pokemon = "Zoobat"
closure()
// // Print: "Let's catch Zoobat"

pokemon = "Pikachu"
closure = { [pokemon] in print("Let's catch \(pokemon)") }
pokemon = "Zoobat"
closure()
// // Print: "Let's catch Pikachu"
// ```

// With reference types, a capture list makes the closure to capture and store the current _reference_ stored inside the captured variable.

// ### Unowned self

// ```swift
class Book {
    
    var name = "Book"
    
    lazy var sageRetrieveContent: () -> String = {
        [unowned self] in
        return "\(self.name): reading helps us learn so much about beauty and truth that we can live a better life in our own ways."
    }
    
    lazy var ordinaryRetrieveContent: () -> String = {
        [unowned self] in
        return "\(self.name): as long as one studies hard, wealth and beautiful women will all come his way."
    }
}

let book = Book()
print(book.sageRetrieveContent())
print(book.ordinaryRetrieveContent())
// ```

// ### The strong weak pattern

// When `self` could be `nil`

// ```swift
extension Book {
    func checkWorm() {
        DispatchQueue.main.async {
            [weak self] in
            guard let strongSelf = self else {
                print("The book no longer exists.")
                return
            }
            let hasWorm = strongSelf.name.contains("worm")
            if hasWorm {
                print("The book has worm.")
            }
        }
    }
}
// ```

// [ToC](#table-of-contents)

// ## Data Structure in Swift

// ###$interview$###

// ### Stack

// ```
class Stack<T> {

    var stack = [T]()
    var isEmpty: Bool {
        return self.stack.isEmpty
    }
    var peek: T? {
        return self.stack.last
    }
    var size: Int {
        return self.stack.count
    }

    func push(_ thing: T) {
        self.stack.append(thing)
    }

    func pop() -> T? {
        guard self.isEmpty == false else {
            return nil
        }
        return self.stack.removeLast()
    }
}
// ```

// ### Linked List

// ```
class ListNode<T> {
    var value: T
    var next: ListNode<T>?

    init(_ value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var head: ListNode<T>?
    var tail: ListNode<T>?
}

extension LinkedList {
    func appendToTail(_ value: T) {
        if let tail = self.tail {
            tail.next = ListNode(value)
            self.tail = tail.next
        } else {
            self.tail = ListNode(value)
            self.head = self.tail
        }
    }
    
    func appendToHead(_ value: T) {
        if let head = self.head {
            let newHead = ListNode(value)
            newHead.next = head
            self.head = newHead
        } else {
            self.head = ListNode(value)
            self.tail = self.head
        }
    }
}

func printNode<T: CustomStringConvertible>(_ node: ListNode<T>?) {
    var current = node
    var values = [T]()
    while current != nil {
        values.append(current!.value)
        current = current!.next
    }
    print("Values in list nodes: \(values)")
}

let node1 = ListNode(2)
let node2 = ListNode(9)
let node3 = ListNode(7)
let node4 = ListNode(3)
node1.next = node2
node2.next = node3
node3.next = node4

printNode(node1)
// ```

// Given a linked list and a value X, return a new linked list with values less than X on left and values greater than X on right

// ```
func partition<T: Comparable>(_ head: ListNode<T>?, _ x: T) -> ListNode<T>? {
    var leftHead: ListNode<T>?
    var rightHead: ListNode<T>?
    var left: ListNode<T>?
    var right: ListNode<T>?
    var node = head

    while node != nil {
        if node!.value < x {
            if leftHead == nil {
                leftHead = node
                left = leftHead
            } else {
                left!.next = node
                left = node!
            }
        } else {
            if rightHead == nil {
                rightHead = node
                right = rightHead
            } else {
                right!.next = node
                right = node!
            }
        }
        node = node!.next
    }
    
    if let right = right {
        right.next = nil
    }
    if let left = left {
        left.next = rightHead
    }
    if leftHead != nil {
        return leftHead
    } else {
        return rightHead
    }
}

if let partitionedList = partition(node1, 5) {
    printNode(partitionedList)
}

// // prints: Values in list nodes: [2, 3, 9, 7]
// ```

// Given a head node, determine whether a cycle exists.

// ```
func hasCycle<T>(_ head: ListNode<T>?) -> Bool {
    var slow = head
    var fast = head

    while fast != nil && fast!.next != nil {
        slow = slow!.next
        fast = fast!.next!.next
        
        if slow === fast {
            return true
        }
    }

    return false
}
// ```

// Given a head node, remove the nth last node.

// ```
func removeNthFromEnd<T>(head: ListNode<T>?, _ n: Int) -> ListNode<T>? {
    guard let head = head else {
        return nil
    }
    
    var first: ListNode<T>? = head
    var second: ListNode<T>? = head

    for _ in 0 ..< n {
        if second == nil {
            break
        }
        second = second!.next
    }
    
    while second != nil && second!.next != nil {
        first = first!.next
        second = second!.next
    }
    
    first!.next = first!.next!.next
    return head
}

print("Existing list:")
printNode(node1)

print("List with 2nd last node removed:")
if let newHead = removeNthFromEnd(head: node1, 2) {
    printNode(newHead)
}
// ```

// ### Queue

// ```
protocol Queue {
    associatedtype Element

    var isEmpty: Bool { get }
    var size: Int { get }
    var peek: Element? { get }

    mutating func enqueue(_ newElement: Element)
    mutating func dequeue() -> Element?
}

struct ArrayQueue<T>: Queue {

    var isEmpty: Bool {
        return self.left.isEmpty && self.right.isEmpty
    }
    
    var size: Int {
        return self.left.count + self.right.count
    }
    
    var peek: T? {
        return self.left.isEmpty ? self.right.first : self.left.last
    }
    
    private var left = [T]()
    private var right = [T]()
    
    mutating func enqueue(_ newElement: T) {
        self.right.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if self.left.isEmpty {
            self.left = self.right.reversed()
            self.right.removeAll()
        }
        return self.left.popLast()
    }
}

struct StackQueue<T>: Queue {

    var isEmpty: Bool {
        return self.stackA.isEmpty && self.stackB.isEmpty
    }
    
    var peek: T? {
        self.shift()
        return self.stackB.peek
    }
    
    var size: Int {
        return self.stackA.size + self.stackB.size
    }
    
    mutating func enqueue(_ newElement: T) {
        self.stackA.push(newElement)
    }
    
    func dequeue() -> T? {
        self.shift()
        return self.stackB.pop()
    }
    
    private func shift() {
        if self.stackB.isEmpty {
            while let fromA = self.stackA.pop() {
                self.stackB.push(fromA)
            }
        }
    }

    private var stackA = Stack<T>()
    private var stackB = Stack<T>()
}
// ```

// Simplify a file path.

// ```
func simplifyPath(_ path: String) -> String {
    var simplifiedPath = [String]()
    let pathComponents = path.components(separatedBy: "/")
    for component in pathComponents {
        guard component != "." else {
            continue
        }
        if component == ".." {
            if simplifiedPath.isEmpty == false {
                simplifiedPath.removeLast()
            }
        } else if component.isEmpty == false {
            simplifiedPath.append(component)
        }
    }
    
    let fullPath = simplifiedPath.reduce("") { (base, path) -> String in
        return "\(base)/\(path)"
    }
    
    return fullPath.isEmpty ? "/" : fullPath
}

let shortPath = "/home/username/Documents/../Picture/./Travel/"
let simplifiedPath = simplifyPath(shortPath)
print("Simplified path: \(simplifiedPath)")
// ```

// ### Binary Tree

// ```
class TreeNode<T> {
    var value: T
    var left: TreeNode<T>?
    var right: TreeNode<T>?

    init(_ value: T) {
        self.value = value
    }
}

func depthOfTree<T>(_ root: TreeNode<T>?) -> Int {
    guard let root = root else {
        return 0
    }
    return max(depthOfTree(root.left), depthOfTree(root.right)) + 1
}
// ```

// Check whether a binary tree is a valid search tree. (BST)

// ```
func isValidBST<T: Comparable>(root: TreeNode<T>?) -> Bool {
    return isValidBSTNode(root, nil, nil)
}

func isValidBSTNode<T: Comparable>(_ node: TreeNode<T>?, _ min: T?, _ max: T?) -> Bool {
    guard let node = node else {
        return true
    }
    if let min = min, node.value <= min {
        return false
    }
    if let max = max, node.value >= max {
        return false
    }
    return isValidBSTNode(node.left, min, node.value) && isValidBSTNode(node.right, node.value, max)
}
// ```

// Traversal Binary Tree

// ```
func preorderTraversal<T>(root: TreeNode<T>?) -> [T] {
    var result = [T]()
    var stack = [TreeNode<T>]()
    var node = root
    while node != nil || stack.isEmpty == false {
        if let nonNilNode = node {
            result.append(nonNilNode.value)
            stack.append(nonNilNode)
            node = nonNilNode.left
        } else {
            node = stack.removeLast().right
        }
    }
    return result
}

let tnode1 = TreeNode(1)
let tnode2 = TreeNode(2)
let tnode3 = TreeNode(3)
let tnode4 = TreeNode(4)
let tnode5 = TreeNode(5)
let tnode6 = TreeNode(6)
let tnode7 = TreeNode(7)
let tnode8 = TreeNode(8)
let tnode9 = TreeNode(9)
let tnode10 = TreeNode(10)
let tnode11 = TreeNode(11)
let tnode12 = TreeNode(12)
let tnode13 = TreeNode(13)
let tnode14 = TreeNode(14)
let tnode15 = TreeNode(15)

tnode1.left = tnode2
tnode1.right = tnode3
tnode2.left = tnode4
tnode2.right = tnode5
tnode3.left = tnode6
tnode3.right = tnode7
tnode4.left = tnode8
tnode4.right = tnode9
tnode5.left = tnode10
tnode5.right = tnode11
tnode6.left = tnode12
tnode6.right = tnode13
tnode7.left = tnode14
tnode7.right = tnode15

let result = preorderTraversal(root: tnode1)
print("Preorder traversal result:")
result.forEach { print("\($0)") }

// // Preorder traversal result:
// // 1
// // 2
// // 4
// // 8
// // 9
// // 5
// // 10
// // 11
// // 3
// // 6
// // 12
// // 13
// // 7
// // 14
// // 15
// ```

// [ToC](#table-of-contents)

// ## Sorting and Searching in Swift

// ***$interview$***

// ### Merge Sort

func mergeSort(_ array: [Int]) -> [Int] {
    var helper = Array(repeating: 0, count: array.count), array = array
    mergeSort(&array, &helper, 0, array.count - 1)
    return array
}

func mergeSort(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ high: Int) {
    guard low < high else {
        return
    }
    let middle = (high - low) / 2 + low
    mergeSort(&array, &helper, low, middle)
    mergeSort(&array, &helper, middle + 1, high)
    merge(&array, &helper, low, middle, high)
}

func merge(_ array: inout [Int], _ helper: inout [Int], _ low: Int, _ middle: Int, _ high: Int) {
    for i in low...high {
        helper[i] = array[i]
    }
    
    var left = low, right = middle + 1, current = low
    while left <= middle && right <= high {
        if helper[left] < helper[right] {
            array[current] = helper[left]
            left += 1
        } else {
            array[current] = helper[right]
            right += 1
        }
        current += 1
    }
    
    guard middle - left >= 0 else {
        // check whether left half exhausted, if so, there's no need to handle rest
        return
    }
    
    for i in 0...(middle - left) {
        // handle the rest, only left half can have remaining
        array[current] = helper[left + i]
    }
}

// ### Quick Sort

// ```
func quickSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    let pivot = array[array.count / 2]
    let left = array.filter { $0 < pivot }
    let middle = array.filter { $0 == pivot }
    let right = array.filter { $0 > pivot }
    return quickSort(left) + middle + quickSort(right)
}
// ```

// ### Basic Searching

// While iterating through the whole collection could find search term in O(n), searching in a sorted collection in a binary way could reduce it to O(logn).

// ```
func binarySearch<T: Comparable>(_ values: [T], _ target: T) -> Bool {
    var left = 0, mid = 0, right = values.count - 1
    while left <= right {
        mid = (right - left) / 2 + left
        if values[mid] == target {
            return true
        } else if values[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return false
}

// // note: people often forget +1 and -1 when re-adjusting left and right
// ```

// There are a few meetings, merge the ones that overlap.
// Example: given [[1, 3], [5, 6], [4, 7], [2, 3]]
// Output: [[1, 3], [4, 7]]

// ```
class MeetingTime {
    var start: Int
    var end: Int
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

func merge(meetingTimes: [MeetingTime]) -> [MeetingTime] {
    guard meetingTimes.count > 1 else {
        return meetingTimes
    }
    
    var sortedTimes = meetingTimes.sorted { (time1, time2) -> Bool in
        if time1.start != time2.start {
            return time1.start < time2.start
        } else {
            return time1.end < time2.end
        }
    }
    
    var mergedTimes = [MeetingTime]()
    mergedTimes.append(sortedTimes[0])
    
    for i in 1..<sortedTimes.count {
        let current = sortedTimes[i]
        let last = sortedTimes[sortedTimes.count - 1]
        if current.start > last.end {
            mergedTimes.append(current)
        } else {
            last.end = max(last.end, current.end)
        }
    }
    
    return mergedTimes
}
// ```

// A product has several versions, if version n had a bug, versions after n would all have the same bug. Given a function that checks whether a given version has a bug, find the first version that has the bug.

// ```
func findFirstBugVersion(version: Int, isBugVersion: ((Int) -> Bool)) -> Int {
    guard version > 1 else {
        return version
    }
    var left = 1, mid = version / 2, right = version
    while left < right {
        mid = (right - left) / 2 + left
        if isBugVersion(mid) {
            right = mid
        } else {
            left = mid + 1
        }
    }
    return left
}
// ```

// Use binary search for rotated array, for example, [0, 1, 2, 4, 5, 6, 9] becomes [4, 5, 6, 9, 0, 1, 2].

// ```
func searchRotated<T: Comparable>(values: [T], target: T) -> Int {
    var (left, mid, right) = (0, 0, values.count - 1)
    
    while left <= right {
        mid = (right - left) / 2 + left
        
        if values[mid] == target {
            return mid
        }
        
        if values[mid] > values[left] {
            if values[mid] > target && target >= values[left] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else {
            if values[mid] < target && target <= values[right] {
                left = mid + 1
            } else {
                right = mid + 1
            }
        }
    }
    
    return -1
}
// ```

// [ToC](#table-of-contents)
