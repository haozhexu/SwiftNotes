// //: Playground - noun: a place where people can play //!

import UIKit //!

// # Swift学习笔记

// 这是我在学习Swift时用的Playground，主要参考苹果的[The Swift Programming Language (Swift 4)](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/index.html)，读的过程中记下这些笔记。
// 逐渐我发现笔记可以整理成一个易于阅读的Markdown文档，甚至可以用[Hugo](https://gohugo.io/)来生成一个静态的网页。于是，这个文档本身就是从Playground代码的注释直接生成的。为了生成Markdown格式的文档，注释遵循了一定的格式：

// > // 这是一段注视，会成为*Markdown*的内容
// > // 下面则会成为Markdown里的一段源代码:
// > //
// > // ```swift
// > let 名 = "无名"
// > // ```

// **然后只需要一个命令来删除注视开始的// （两个斜线及一个空格）**

// > sed 's/^\/\/ //g' SwiftBasicNotes.playground/Contents.swift > ~/Documents/SwiftBasicNotes.md

// *(PS: 如何把带有注释的源代码转换成Markdown文档的步骤就写在源代码里，这种递归关系是否很奇特？就好像一只饥饿的蛇从尾巴开始把自己给吞掉一样)*

// ## "Hello, world!" 输出

// 经典的"Hello, world!"输出展示了一个语言的几点特性，比如每行代码的末尾不需要分号，调用一个函数／方法大致的样子，字符串是如何表示的。

// ```
print("科学的探索也许某天会验证信仰中一直知道的事实。")
// ```

// ## 目录

// - [常量与变量](#常量与变量)
// - [类型与操作](#类型与操作)
// - [流程控制](#流程控制)
// - [函数](#函数)
// - [Optional 可有可无](#optional-可有可无)
// - [合集类型](#合集类型)
//   - [数组](#数组)
//   - [集合](#集合)
//   - [字典](#字典)
// - [闭包](#闭包)
// - [字符串与字符](#字符串与字符)
// - [枚举](#枚举)
// - [类与结构](#类与结构)
// - [协议](#协议)
// - [范型](#范型)
// - [访问控制](#访问控制)
// - [操作符进阶](#操作符进阶)
// - [模式](#模式)
// - [错误处理](#错误处理)
// - [编码与解码](#编码与解码)
// - [内存安全](#内存安全)

// ## 常量与变量

// _常量：_

// > 寂静的虚空里诞生了神秘的东西，这种东西_恒久_存在永不消失，它是所有程序的根源所在，我不知道怎么形容它，姑且称它为编程之道。 - _编程之道_

// _变量:_

// > 多云；_多变_的风，局部小雨；微凉；小雪。- _Halcyon Jones_

// ```
// let <常量名>: <类型> = <表达式>
// var <变量名>: <类型> = <表达式>
// ```

// **确保** 变量与常量使用前被赋值

// ```swift
let 猫有几条命 = 9 // constant
var 猫死过几次 = 0 // variable
猫死过几次 = 9
// // 改变常量`猫有几条命 = 10`会产生一个编译错误

// // 同一行多个常量或变量：
var variable1 = 0.0, variable2 = 1.2, variable3 = 5.6
// ```

// [目录](#目录)

// ## 类型与操作

// ### 类型注解

// ```swift
var welcomeMessage: String
var red, green, blue: Double
var someNumber: Int
// ```

// 每行最后不需要有分号，有也不会怎样
// 一行多个代码陈述时需要用分号隔开

// ```swift
let sameLineGuru = "同行"; print("我们在\(sameLineGuru)")
// ```

// 字符串插值：在一个字符串里用\(内容)的方式用实际`内容`来替代临时`内容`

// ### 正数

// ```swift
let integer8: Int8 // 有符号8位整数, UInt8无符号
let integer16: Int16 // 有符号16位整数, UInt16无符号
let integer32: Int32 // 有符号32位整数, UInt32无符号
let integer64: Int64 // 有符号64位整数, UInt64无符号
// ```

// 一般情况下会用 `Int` , 它的大小在32位系统上是 `Int32` 而在64位系统上是 `Int64`。

// #### 整数边界

// 无符号的X位整数范围从 0 到 (2^X)-1

// 有符号的X位整数范围从 -(2^(X-1)) 到 (2^(X-1))-1

// ```swift
print("UInt16 的最大值是 \(UInt16.max)，计算方法为 (2^16)-1 = \(Int(pow(2.0, 16.0) - 1))")
print("Int8 的最大值是 \(Int8.min)，计算方法为 -(2^(8-1)) = \(-Int(pow(2.0, 8.0 - 1.0)))")
print("Int32 的最大值是 \(Int32.max) which is (2^(32-1))-1 = \(Int(pow(2.0, 32.0 - 1.0)) - 1)")
// ```

// ### 浮点数

// - `Double`: 64位浮点数，一般都用这个
// - `Float`: 32位浮点数

// ### 类型安全与类型推断

// ```swift
let 有意义的生命 = 42
// // 推断为 `Int` 整数型

let 派 = 3.14159
// // 推断为 `Double`

let 另一个派 = 3 + 0.1415926
// // 推断为 `Double`

// // let 最后的派 = 有意义的生命 + 派 不能通过编译：
// // error: binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
// // （错误：二元操作符不能用来操作 'Int' 和 'Double'）
// ```

// ### 类型转换

// ```swift
let 最后的派 = Double(有意义的生命) + 派
let 曾经的派 = Int(最后的派) // 浮点数转换成整数丢失了精度
// ```

// ### 类型别名 Type alias

// ```swift
typealias 心情 = UInt8
print("心情: 得意 = \(心情.max) 失落 = \(心情.min)")
// ```

// ### 布尔数 Boolean

// ```swift
let 假 = false
let 真 = true
// ```

// ### 赋值操作符

// ```swift
var b = 10
var a = 5
a = b // a现在的值是10
let (x, y) = (1, 2)
// ```

// ### 代数操作

// ```swift
1 + 2       // 加法 (+)
5 - 3       // 减法 (-)
2 * 3       // 乘法 (*)
10.0 / 2.5  // 除法 (/)
9 % 4       // 除法余数 (%)
-5          // 一元剑法（负数）
+6          // 一元加法（正数）
// ```

// ### 复合赋值操作符

// ```swift
a = 1
a += 2
a -= 5
a *= 3
a /= 2
// ```

// ### 比较操作符

// ```swift
1 == 1  // 等于
2 != 1  // 不等于
2 > 1   // 大于
1 < 2   // 小于
1 >= 1  // 大于或等于
2 <= 1  // 小于或等于
// ```

// 两个元素数量与类型都相同的元组（Tuple）可以进行比较
// 元组的元素从左到右一一比较

// ```swift
(1, "斑马") < (2, "苹果")
// // 1 小于 2 所以 斑马 跟 苹果 不需要比较

(3, "苹果") < (3, "橘子")
// // 3 等于 3 而 “苹果” 大于 “橘子”

(4, "dog") == (4, "dog")
// // 所有都相同
// ```

// ### 元组

// ```swift
let 一个坐标点: (Int, Int) = (3, 6)
let 另一个坐标点 = (21, 97)
// // 类型推断为 `(Int, Int)`

// // 用索引来访问元组里的元素:
print("一个坐标点在 (\(一个坐标点.0), \(一个坐标点.1))");

// // 用命名来访问元组里的元素:
let 一个有名字的坐标点 = (x: 71, y: 89)
print("一个有名字的坐标点在 X轴 \(一个有名字的坐标点.x) Y轴 = \(一个有名字的坐标点.y)")
// ```

// ### 范围操作符

// _封闭范围_:
// `(a...b)` 定义从 `a` 到 `b` 并包括 `a` 和 `b` 的范围, `a` 一定不能大于 `b`.

// _半开范围_:
// `(a..<b)` 定义从 `a` 到 `b`，包括 `a` 却不包括 `b`的范围.

// _单边范围_:
// 定义从一个边界到尽可能多的另一个边界的范围, 例如 `array[3...]` 范围从索引3开始到数组的最后元素, `array[...9]` 范围从数组开始到索引9

// ### 专业术语

// - _一元操作符（unary）_ 针对一个目标进行操作
//   - 一元 _前缀（prefix）_ 操作符出现在操作对象之前（比如 `!b`）
//   - 一元 _后缀（postfix）_ 操作符出现在操作对象之后 （比如 `c!`）
// - _二进制_ 操作符对两个对象进行操作
//   - 例如 2 + 3
//   - 称为 _中缀_ 因为操作符出现在两个操作对象中间
// - _三进制（ternary）_ 操作符对三个对象操作
//   - 仅有的一个三进制操作: `a ? b : c`

// [回到目录](#目录)

// ## 控制流

// [比较操作符](#比较操作符) 让你比较两个值并得出一个或真（`true`）或假（`false`）的答案

// ### `if` 陈述

// ```
// if <条件> {
//     <陈述>
// }
// ```

// ```
// if <条件1> {
//     <陈述1>
// } else if <条件2> {
//     <陈述2>
// } else {
//     <条件3>
// }
// ```

// ```
// if <条件> {
//     <陈述1>
// } else {
//     <陈述2>
// }
// ```

// ```swift
let 一加一是否等于三 = (1 + 1) == 3
// 假（`false`）, `==` 为相等操作符

let 真理 = true
let 谎言 = 一加一是否等于三 == false

if 谎言 == 真理 {
    print("谎言，是新的真理。")
}
// ```

// ```swift
let 动物的名字 = "鹿"
if 动物的名字 == "马" {
    print("一个指鹿为马的混沌时代。")
} else {
    print("一个不需要说谎而活着的地方。")
}
// ```

// ### 短路

// ```swift
let 国家 = "country"
let 人民 = "people"
if 国家 > 人民 && 1 + 1 == 2 {
    // 这里不会检查1 + 1是否等于2
    // 因为第一个条件已经是错的
    print("为了国家的利益我们应该牺牲个人。")
} else {
    print("为个人利益而奋斗就是为国家而奋斗。")
}
// // 结果：为个人利益而奋斗就是为国家而奋斗。
// ```

// ```swift
var 此人已醉 = true
var 离婚协议书已准备好 = true

if 此人已醉 || 离婚协议书已准备好 == false {
    // 离婚协议书是否已准备好并不重要因为：此人已醉
    // （第一个条件为真而不需要检查第二个条件）
    print("迟点再决定")
}
// ```

// ### 三元条件操作符

// ```
// (<条件>) ? <条件成立> : <条件不成立>
// ```

// ```swift
let 泰山的重量 = 9
let 鸿毛的重量 = 1
let 懦弱的生命 = 0
let 怒放的生命 = 10

var 生命的描述 = 懦弱的生命 < 鸿毛的重量 ? "轻于鸿毛" : "重于泰山"
print("懦弱的生命 \(生命的描述)。")
// // 懦弱的生命 轻于鸿毛。

生命的描述 = 怒放的生命 > 泰山的重量 ? "重于泰山" : "不如泰山重"
print("怒放的生命 \(生命的描述)。")
// // 怒放的生命 重于泰山。
// ```

// ### 循环

// #### `while` 循环

// ```
// while <条件> {
//     <循环代码>
// }
// ```

// ```swift
let 周末开始之日 = 6
var 今天 = 1
while 今天 < 周末开始之日 {
    print("今天 \(今天)：以微笑开始新的一天，微笑过后再回到卑微厌世的自我。")
    今天 += 1
}
print("今天 \(今天)：周末开始。")
// ```

// ```
// repeat {
//     <循环代码>
// } while <条件>
// ```

// ```swift
let 一杯水的量 = 5
var 杯中水 = 一杯水的量

repeat {
    if (杯中水 > 0) {
        print("正如这杯水，你心中满是主观偏见，若要看到智慧之光，你必须先把这杯水倒掉。")
        杯中水 -= 1
    }
} while 杯中水 > 0
// ```

// #### `for` 循环

// ```
// for <常量> in <可数范围> {
//     <循环代码>
// }
// ```

// ```swift
let 所有版本 = 5
for 当前版本 in 1...所有版本 {
    print("当前版本：\(当前版本)")
}
// ```

// **`where`**

// ```swift
let 厄运版本 = 4
for 当前版本 in 1...所有版本 where 当前版本 != 厄运版本 {
    print("当前版本：\(当前版本)")
}
// ```

// **`continue` 和有标签的循环**

// ```swift
for 当前版本 in 1...所有版本 {
    if 当前版本 == 厄运版本 {
        print("我们用 continue 关键字来跳过 厄运版本 \(厄运版本)。")
        continue // 跳过当前循环，开始新的循环
    }
    print("当前版本：\(当前版本)")
}
// ```

// **例子**

// 破鞋与小三的故事

// - 与破鞋或小三约会时不要让另一人知道
// - 如果破鞋与小三互相认识那么就麻烦了

// ```swift
let 破鞋与小三的总数 = 3
let 每人约会次数 = 5
let 破鞋与小三认识 = 2
let 可能让其他破鞋或小三知道的约会 = 4

lover: for 当前约会对象编号 in 1...破鞋与小三的总数 {
    date: for 当前约会 in 1...每人约会次数 {
        print("与情人编号 \(当前约会对象编号) 约会编号 \(当前约会)")
        if 当前约会对象编号 == 破鞋与小三认识 && 当前约会 == 可能让其他破鞋或小三知道的约会 {
            print("祝你平安。")
            break lover
        } else if 当前约会 == 可能让其他破鞋或小三知道的约会 {
            print("这次约会取消。")
            continue date
        }
        print("王子与公主过上了没羞没臊的生活。")
    }
}
// ```

// ### Switch 开关

// ```
// switch <控制表达式> {
// case <模式1>:
//     <陈述>
// case <模式2> where <条件>:
//     <陈述>
// case <模式3> where <条件>,
//      <模式4> where <条件>:
//     <陈述>
// default:
//     <默认陈述>
// }
// ```

// ```swift
let 有人 = true, 没人 = false
var 去洗手间的人性别 = "男" // 试试换成 女
var 洗手间有没有人 = (男: 有人, 女: 没人)

switch 洗手间有没有人 {
case let (男间有无人, 女间有无人) where 男间有无人 != 女间有无人:
    print("至少一间是可用的。")
fallthrough // 继续下面的陈述
case (男: 没人, _) where 去洗手间的人性别 == "男":
    // 男间无人
    // 不关心女间情况
    print("男生可以去洗手间了")
case (_, 女: true) where 去洗手间的人性别 == "女":
    // 女间无人
    // 不关心男间情况
    print("女生可以去洗手间了")
case (男: true, 女: false) where 去洗手间的人性别 == "女":
    print("女生忍不住的话可以去男洗手间")
case (男: false, 女: true) where 去洗手间的人性别 == "男":
    print("男生忍不住的话可以去女洗手间")
default:
    // **消耗尽**: switch要覆盖所有可能
    // 如果做不到可以用 `default case` 默认
    break;
}
// ```

// ```swift
var 学年 = 3 // 可以换成 1...12 范围里的任何一个数
switch 学年 {
case 1...3:
    print("你不知道自己不知道")
case 4...6:
    print("你知道自己不知道")
case 7...9:
    print("你不知道自己知道")
case 10...12:
    print("你知道自己知道")
default:
    // **消耗尽**: switch要覆盖所有可能
    // 如果做不到可以用 `default case` 默认
    break
}
// ```

// [回到目录](#目录)

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

// **Example:**

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

// [回到目录](#目录)

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

// [回到目录](#目录)

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

// [回到目录](#目录)

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

// [回到目录](#目录)

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

// [回到目录](#目录)

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
var garbageCollection: [() -> Void] = []

func collectGarbageWithEscapingClosure(garbageCollector: @escaping () -> Void) {
    garbageCollection.append(garbageCollector)
}

func collectGarbageRightNow(garbageCollector: () -> Void) {
    garbageCollector() // execute immediately
}

collectGarbageWithEscapingClosure {
    print("Collecting garbage")
}

collectGarbageRightNow {
    print("If Java had true garbage collection, most programs would delete themselves upon execution. -- Robert Sewell") // only this is executed
}
// ```

// ### Autoclosures

// ```swift
var customersInLine = ["Chris", "Alex", "Ewa", "Barry"]
print(customersInLine.count) // Prints "4"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count) // Prints "4"

print("Now serving \(customerProvider())!")
// // Prints "Now serving Chris!"
print(customersInLine.count) // Prints "3"

// // parameter: () -> String
// // argument is auto converted to a closure
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

// // now can pass a String
serve(customer: "Hi")
// // "Hi" will be converted to a closure that returns this string
// // which is only evaluated when being called
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
// And God said, Let there be light:
// and there was light.

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

// [ToC](#table-of-contents)

// ## Enumerations

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

// [ToC](#table-of-contents)

// ## Classes and Structures

// Declare a class:

// ```swift
class Love { // class name
    // <statements>
    // }
// ```
    
    // Class statements:
    
    // class/type constant:
    
// ```swift
    // by default, love isn't persistent
    static let defaultPersistency = false
// ```
    
    // stored properties
    
// ```swift
    var name: String?
    let thorny = true // constant
    
    // inferred boolean variable
    var isPersistent = defaultPersistency
    var looksPretty: Bool // variable
// ```
    
// **computed property**
    
// ```swift
    var tastesGood: Bool {
        // computed property
        // must be variable
        return !looksPretty
    }
// ```
    
// **lazy property**

// ```swift
    lazy var complexity: Int = { [unowned self] in
        if let name = self.name {
            return name.lengthOfBytes(using: .utf8)
        } else {
            return 123
        }
    }()
// ```
    
// **initializer**
    
// ```swift
    // non-optional properties must be
    // initialized before use
    init(looksPretty: Bool, name: String? = nil) {
        self.looksPretty = looksPretty
        self.name = name
    }
// ```
    
// **instance method**
    
// ```swift
    func printDescription() {
        Love.printNotes(about: self)
    }
// ```
    
// **class/type method**
    
// ```swift
    // `final` indicates cannot be overwritten
    final func displayName() -> String {
        return self.name ?? self.defaultName()
    }
    
    func defaultName() -> String {
        return "love"
    }
    
    // called when no reference to the instance
    // ie. reference counter reaches 0
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

// >Notes about love:
// >love has noname
// >love is thorny
// >love doesn't last long by default
// >love looks ugly but tastes good

// `hate` prints

// >Notes about Hate:
// >love has a name of "Hate"
// >Hate is thorny
// >Hate can be persistent
// >Hate looks pretty but tastes bad

// ```swift
struct Address {
    
    // type constant
    static let format = "British"
    
    var streetNumber: String
    var streetName: String
    var suburb: String
    var state: String
    var postcode: String
    var country: String
    
    var fullAddress: String {
        return "\(streetNumber) \(streetName), \(suburb), \(state) \(postcode), \(country)"
    }
}
// ```

// ```swift
print("Using \(Address.format) format")
// ```

// ```swift
// // default struct-wise initializer
let address = Address(streetNumber: "123", streetName: "Straight Street", suburb: "Curveless", state: "XYZ", postcode: "1234", country: "Unobtainable")
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

// > Notes about hate:
// > hate has a name of "exclusive love"
// > exclusive love is thorny
// > exclusive love can be persistent
// > exclusive love looks ugly but tastes good

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

// > love disappears in a puff of logic

// ### class vs struct

// *class*:

// - reference type, object with identity, e.g. `Student`
// - slower on heap
// - updated with logic
// - internals can remain mutable even when declared with `let`

// *struct*:

// - value type, e.g. `Address`
// - faster on stack
// - simple data store
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

// It's like a super-type of different types.

// ```swift
func swapValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var firstNumber = 3
var secondNumber = 7
swapValues(&firstNumber, &secondNumber)
// // `firstNumber` is now 7, `secondNumber` is now 3

var humanWorld = ""
var hell = "full of evil"
swapValues(&humanWorld, &hell)
// // `hell` is now empty, `humanWorld` is now "full of evil"
// ```

// ### Generic Types

// *Example*

// Implement a bag of generic typed stuff, stuff can be put in the bag and picked up randomly

// ```swift
struct Bag<Stuff> {
    var stuff = [Stuff]()
    mutating func putin(_ stuff: Stuff) {
        self.stuff.append(stuff)
    }
    mutating func pickup() -> Stuff {
        let index: Int = Int(arc4random_uniform(UInt32(self.stuff.count)))
        return self.stuff.remove(at: index)
    }
}

var bagOfStrings = Bag<String>();
bagOfStrings.putin("Masquito's leg")
bagOfStrings.putin("Grandma's beard")
bagOfStrings.pickup()
// ```

// ### Associated types

// ```swift
protocol Fate {
    associatedtype ChanceType
    associatedtype EventType
    
    func event(for chance: ChanceType) -> EventType
}

enum Chance: String {
    case birth = "a new life was born"
    case death = "a new journey just started"
}

class Life: Fate {
    typealias ChanceType = Chance
    typealias EventType = String
    
    func event(for chance: Chance) -> String {
        return chance.rawValue
    }
}

let ant = Life()
print("chance \"death\" triggered event: \(ant.event(for: .death))")
print("chance \"birth\" triggered event: \(ant.event(for: .birth))")

// // prints "chance "death" triggered event: a new life was born".
// // prints "chance "birth" triggered event: a new journey just started".
// ```

// ### Type constraints

// ```
// func someFunctionL<T: SomeClass, U: SomeProtocol>(someT: T, someP: U)
// ```

// Alternatively, `Fate` can be conformed this way:

// ```swift
// // type constraint, ChanceT must conform to `Hashable`
class Robot<ChanceT: Hashable, EventT>: Fate {
    
    private var programmedInstructions = [ChanceT: EventT]()
    
    func add(_ event: EventT, for chance: ChanceT) {
        programmedInstructions[chance] = event
    }
    
    // no need to have `typealias` here
    // since types can be inferred
    func event(for chance: ChanceT) -> EventT {
        return programmedInstructions[chance]!
    }
}

let mrBetterHuman = Robot<String, String>()
mrBetterHuman.add("lights blinking and arms waving", for: "poweron")
mrBetterHuman.add("sudden stop with dull and lifeless eyes", for: "poweroff")

print("Robot gets chance of 'poweron': \(mrBetterHuman.event(for: "poweron"))")
print("Robot gets chance of 'poweroff': \(mrBetterHuman.event(for: "poweroff"))")
// ```

// ### Generic where clauses

// A piece of code worths thousands of words:

// ```swift
func crossFate<F1: Fate, F2: Fate>(_ someFate: F1, _ otherFate: F2, chance: F1.ChanceType) -> String where F1.ChanceType == F2.ChanceType, F1.EventType == F2.EventType, F1.EventType: Equatable {
    let event1 = someFate.event(for: chance)
    let event2 = otherFate.event(for: chance)
    if (event1 == event2) {
        return "Fate meets with common event: \(event1)"
    } else {
        return "Fate crossed but missed!"
    }
}

let husband = Life()
let wife = Life()
let fateCrossed = crossFate(husband, wife, chance: .birth)
print("Cross fated husband and wife: \(fateCrossed)")
// // Prints "Cross fated husband and wife: Fate meets with common event: a new life was born"
// ```

// _PS: I have a feeling that the whole Fate/Chance/Event thing could be made super fun, but for the purpose of this study notes let's stop here_

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
// - any type members added in an **extension** have the same default access level as type members declared in the original type being extended
// - you can mark an extension with explicit access-level modifier, e.g. `private extension`
// - a type alias can have an access level less than or equal to the access level of the type it aliases

// **simple way to remember**
// Imagine a passenger on a airplane has recently visited virus infected area and not feeling well on the plane, all passengers have to be examined.

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

// *Example*

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
let someOptional: Int? = 250
if case .some(let x) = someOptional {
    print(x)
}

if case let x? = someOptional {
    print(x)
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

// *Example*:

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

// *Example*

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

// ### Coding custom yypes

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

// - **Weak references** don't increase/decrease the **reference count** of a certain object, declared as optionals, they become `nil` once the reference count reaches zero
// - **Unowned references** behave similar to `weak`, they always expect to have a value - can't be declared as optional.

// ### Capture list

// A **capture list** is an array of variables captured by a closure

// ** Example **

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

// ### unowned self

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

// [回到目录](#目录)

