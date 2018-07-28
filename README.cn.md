

# Swift学习笔记

这是我在学习Swift时用的Playground，主要参考苹果的[The Swift Programming Language (Swift 4)](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/index.html)，读的过程中记下这些笔记。
逐渐我发现笔记可以整理成一个易于阅读的Markdown文档，甚至可以用[Hugo](https://gohugo.io/)来生成一个静态的网页。于是，这个文档本身就是从Playground代码的注释直接生成的。为了生成Markdown格式的文档，注释遵循了一定的格式：

```
// 这是一段注视，会成为*Markdown*的内容
// 下面则会成为Markdown里的一段源代码:
// ```swift
// let 名 = "无名"
// ```
```

**然后只需要一个命令来删除注视开始的// （两个斜线及一个空格）**

```
sed 's/^\/\/ //g' SwiftBasicNotes_cn.playground/Contents.swift | sed '/\/\/!$/d' > README_cn.md
```

*(PS: 把带有注释的源代码转换成Markdown文档的步骤就写在源代码的注释里，这种递归关系是否很奇特？就好像一只饥饿的蛇从尾巴开始把自己给吞掉一样)*

## "Hello, world!" 输出

经典的"Hello, world!"输出展示了一个语言的几点特性，比如每行代码的末尾不需要分号，调用一个函数／方法大致的样子，字符串是如何表示的。

```
print("科学的探索也许某天会验证信仰中一直知道的事实。")
```

## 目录

- [常量与变量](#常量与变量)
- [类型与操作](#类型与操作)
- [流程控制](#流程控制)
- [函数](#函数)
- [Optional-或有或无](#optional-或有或无)
- [合集类型](#合集类型)
  - [数组](#数组)
  - [集合](#集合)
  - [字典](#字典)
- [闭包](#闭包)
- [字符串与字符](#字符串与字符)
- [枚举](#枚举)
- [类与结构](#类与结构)
- [协议](#协议)
- [泛型](#泛型)
- [访问控制](#访问控制)
- [操作符进阶](#操作符进阶)
- [模式](#模式)
- [错误处理](#错误处理)
- [编码与解码](#编码与解码)
- [内存安全](#内存安全)

## 常量与变量

_常量：_

> 寂静的虚空里诞生了神秘的东西，这种东西_恒久_存在永不消失，它是所有程序的根源所在，我不知道怎么形容它，姑且称它为编程之道。 - _编程之道_

_变量:_

> 多云；_多变_的风，局部小雨；微凉；小雪。- _Halcyon Jones_

```
let <常量名>: <类型> = <表达式>
var <变量名>: <类型> = <表达式>
```

**确保** 变量与常量使用前被赋值

```swift
let 猫有几条命 = 9 // constant
var 猫死过几次 = 0 // variable
猫死过几次 = 9
// 改变常量`猫有几条命 = 10`会产生一个编译错误

// 同一行多个常量或变量：
var variable1 = 0.0, variable2 = 1.2, variable3 = 5.6
```

[目录](#目录)

## 类型与操作

### 类型注解

```swift
var welcomeMessage: String
var red, green, blue: Double
var someNumber: Int
```

每行最后不需要有分号，有也不会怎样
一行多个代码陈述时需要用分号隔开

```swift
let sameLineGuru = "同行"; print("我们在\(sameLineGuru)")
```

字符串插值：在一个字符串里用\(内容)的方式用实际`内容`来替代临时`内容`

### 正数

```swift
let integer8: Int8 // 有符号8位整数, UInt8无符号
let integer16: Int16 // 有符号16位整数, UInt16无符号
let integer32: Int32 // 有符号32位整数, UInt32无符号
let integer64: Int64 // 有符号64位整数, UInt64无符号
```

一般情况下会用 `Int` , 它的大小在32位系统上是 `Int32` 而在64位系统上是 `Int64`。

#### 整数边界

无符号的X位整数范围从 0 到 (2^X)-1

有符号的X位整数范围从 -(2^(X-1)) 到 (2^(X-1))-1

```swift
print("UInt16 的最大值是 \(UInt16.max)，计算方法为 (2^16)-1 = \(Int(pow(2.0, 16.0) - 1))")
print("Int8 的最大值是 \(Int8.min)，计算方法为 -(2^(8-1)) = \(-Int(pow(2.0, 8.0 - 1.0)))")
print("Int32 的最大值是 \(Int32.max) which is (2^(32-1))-1 = \(Int(pow(2.0, 32.0 - 1.0)) - 1)")
```

### 浮点数

- `Double`: 64位浮点数，一般都用这个
- `Float`: 32位浮点数

### 类型安全与类型推断

```swift
let 青春 = 3
// 推断为 `Int` 整数型

let 对青春的感悟 = 0.14
// 推断为 `Double`

let 派 = 3 + 0.1415926
// 推断为 `Double`

下面的操作无法编译：
let 青春以及对青春的感悟 = 青春 + 对青春的感悟
// error: binary operator '+' cannot be applied to operands of type 'Int' and 'Double'
// （错误：二元操作符不能用来操作 'Int' 和 'Double'）
// （你无法同时拥有青春以及对青春的感悟）
```

### 类型转换

```swift
let 同样的派 = Double(青春) + 对青春的感悟
let 曾经的派 = Int(同样的派) // 浮点数转换成整数丢失了精度
```

### 类型别名 Type alias

```swift
typealias 心情 = UInt8
print("心情: 得意 = \(心情.max) 失落 = \(心情.min)")
```

### 布尔数 Boolean

```swift
let 假 = false
let 真 = true
```

### 赋值操作符

```swift
var b = 10
var a = 5
a = b // a现在的值是10
let (x, y) = (1, 2) // x is 1 and y is 2
```

### 代数操作

```swift
1 + 2       // 加法 (+)
5 - 3       // 减法 (-)
2 * 3       // 乘法 (*)
10.0 / 2.5  // 除法 (/)
9 % 4       // 除法余数 (%)
-5          // 一元剑法（负数）
+6          // 一元加法（正数）
```

### 复合赋值操作符

```swift
a = 1
a += 2
a -= 5
a *= 3
a /= 2
```

### 比较操作符

```swift
1 == 1  // 等于
2 != 1  // 不等于
2 > 1   // 大于
1 < 2   // 小于
1 >= 1  // 大于或等于
2 <= 1  // 小于或等于
```

两个元素数量与类型都相同的元组（Tuple）可以进行比较
元组的元素从左到右一一比较

```swift
(1, "斑马") < (2, "苹果")
// 1 小于 2 所以 斑马 跟 苹果 不需要比较

(3, "苹果") < (3, "橘子")
// 3 等于 3 而 “苹果” 大于 “橘子”

(4, "dog") == (4, "dog")
// 所有都相同
```

### 元组

```swift
let 一个坐标点: (Int, Int) = (3, 6)
let 另一个坐标点 = (21, 97)
// 类型推断为 `(Int, Int)`

// 用索引来访问元组里的元素:
print("一个坐标点在 (\(一个坐标点.0), \(一个坐标点.1))");

// 用命名来访问元组里的元素:
let 一个有名字的坐标点 = (x: 71, y: 89)
print("一个有名字的坐标点在 X轴 \(一个有名字的坐标点.x) Y轴 = \(一个有名字的坐标点.y)")
```

### 范围操作符

_封闭范围_:
`(a...b)` 定义从 `a` 到 `b` 并包括 `a` 和 `b` 的范围, `a` 一定不能大于 `b`.

_半开范围_:
`(a..<b)` 定义从 `a` 到 `b`，包括 `a` 却不包括 `b`的范围.

_单边范围_:
定义从一个边界到尽可能多的另一个边界的范围, 例如 `array[3...]` 范围从索引3开始到数组的最后元素, `array[...9]` 范围从数组开始到索引9

```swift
let someArray = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print(someArray[5...])
print(someArray[...3])
```

### 专业术语

- _一元操作符（unary）_ 针对一个目标进行操作
  - 一元 _前缀（prefix）_ 操作符出现在操作对象之前（比如 `!b`）
  - 一元 _后缀（postfix）_ 操作符出现在操作对象之后 （比如 `c!`）
- _二进制_ 操作符对两个对象进行操作
  - 例如 2 + 3
  - 称为 _中缀_ 因为操作符出现在两个操作对象中间
- _三进制（ternary）_ 操作符对三个对象操作
  - 仅有的一个三进制操作: `a ? b : c`

[回到目录](#目录)

## 流程控制

[比较操作符](#比较操作符) 让你比较两个值并得出一个或真（`true`）或假（`false`）的答案

### `if` 陈述

```
if <条件> {
    <陈述>
}
```

```
if <条件1> {
    <陈述1>
} else if <条件2> {
    <陈述2>
} else {
    <条件3>
}
```

```
if <条件> {
    <陈述1>
} else {
    <陈述2>
}
```

```swift
let 一加一是否等于三 = (1 + 1) == 3
假（`false`）, `==` 为相等操作符

let 真理 = true
let 谎言 = 一加一是否等于三 == false

if 谎言 == 真理 {
    print("谎言，是新的真理。")
}
```

```swift
let 动物的名字 = "鹿"
if 动物的名字 == "马" {
    print("一个指鹿为马的混沌时代。")
} else {
    print("一个不需要说谎而活着的地方。")
}
```

### 短路

```swift
let 国家 = "country"
let 人民 = "people"
if 国家 > 人民 && 1 + 1 == 2 {
    // 这里不会检查1 + 1是否等于2
    // 因为第一个条件已经是错的
    print("为了国家的利益我们应该牺牲个人。")
} else {
    print("为个人利益而奋斗就是为国家而奋斗。")
}
// 结果：为个人利益而奋斗就是为国家而奋斗。
```

```swift
var 此人已醉 = true
var 离婚协议书已准备好 = true

if 此人已醉 || 离婚协议书已准备好 == false {
    // 离婚协议书是否已准备好并不重要因为：此人已醉
    // （第一个条件为真而不需要检查第二个条件）
    print("迟点再决定")
}
```

### 三元条件操作符

```
(<条件>) ? <条件成立> : <条件不成立>
```

```swift
let 泰山的重量 = 9
let 鸿毛的重量 = 1
let 懦弱的生命 = 0
let 怒放的生命 = 10

var 生命的描述 = 懦弱的生命 < 鸿毛的重量 ? "轻于鸿毛" : "重于泰山"
print("懦弱的生命 \(生命的描述)。")
// 懦弱的生命 轻于鸿毛。

生命的描述 = 怒放的生命 > 泰山的重量 ? "重于泰山" : "不如泰山重"
print("怒放的生命 \(生命的描述)。")
// 怒放的生命 重于泰山。
```

### 循环

#### `while` 循环

```
while <条件> {
    <循环代码>
}
```

```swift
let 周末开始之日 = 6
var 今天 = 1
while 今天 < 周末开始之日 {
    print("今天 \(今天)：以微笑开始新的一天，微笑过后再回到卑微厌世的自我。")
    今天 += 1
}
print("今天 \(今天)：周末开始。")
```

```
repeat {
    <循环代码>
} while <条件>
```

```swift
let 一杯水的量 = 5
var 杯中水 = 一杯水的量

repeat {
    if (杯中水 > 0) {
        print("正如这杯水，你心中满是主观偏见，若要看到智慧之光，你必须先把这杯水倒掉。")
        杯中水 -= 1
    }
} while 杯中水 > 0
```

#### `for` 循环

```
for <常量> in <可数范围> {
    <循环代码>
}
```

```swift
let 所有版本 = 5
for 当前版本 in 1...所有版本 {
    print("当前版本：\(当前版本)")
}
```

**`where`**

```swift
let 厄运版本 = 4
for 当前版本 in 1...所有版本 where 当前版本 != 厄运版本 {
    print("当前版本：\(当前版本)")
}
```

**`continue` 和有标签的循环**

```swift
for 当前版本 in 1...所有版本 {
    if 当前版本 == 厄运版本 {
        print("我们用 continue 关键字来跳过 厄运版本 \(厄运版本)。")
        continue // 跳过当前循环，开始新的循环
    }
    print("当前版本：\(当前版本)")
}
```

**例子**

破鞋与小三的故事

- 与破鞋或小三约会时不要让另一人知道
- 如果破鞋与小三互相认识那么就麻烦了

```swift
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
```

### Switch 开关

```
switch <控制表达式> {
case <模式1>:
    <陈述>
case <模式2> where <条件>:
    <陈述>
case <模式3> where <条件>,
     <模式4> where <条件>:
    <陈述>
default:
    <默认陈述>
}
```

```swift
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
```

```swift
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
```

[回到目录](#目录)

## 函数

```
func <函数名>(<参数表>) -> <返回类型> {
    陈述
}
```

如果没有返回值，`Void` 可以忽略不写：

```
func <函数名>(<参数表>) {
    陈述
}
```

参数格式:

```
<参数名>: <参数类型>
<参数标签> <参数名>: <参数类型>
_ <参数名>: <参数类型>
```

```swift
func add(a: Int, b: Int) -> Int {
    return x + y
}

func sayHi(to person: String) {
    print("Hi, \(person)!")
}

sayHi(to: "未来")

func sayHi(_ person: String) {
    print("Hi, \(person)!")
}

sayHi("人们")
```

#### 直接改变参数的值

术语: copy-in copy-out, call by value result

```swift
let 吸血鬼的胃口 = 0.4
func 缴税(针对 收入: inout Double) {
    收入 *= (1.0 - 吸血鬼的胃口)
}

var 收入 = 100.00
缴税(针对: &收入)

print("税后收入变成了： \(收入)")
// 输出 "税后收入变成了： 60.0"
```

### 函数类型的变量

一个函数有一个参数，返回另外一个使用该参数的函数：

**例子**

定义一个计算扣款的函数，接受一个扣款比例，并返回另一个函数，接受款额，返回扣款后余额

```swift
func 创建扣款器(扣款比例: Double) -> (Double) -> Double {
    // 定义并返回另一个函数
    func 吸血鬼(血量: Double) -> Double {
        return 血量 * (1 - 扣款比例)
    }
    return 吸血鬼
}

let 税务局 = 创建扣款器(扣款比例: 0.3)
let 律师 = 创建扣款器(扣款比例: 0.1)
let 牙医 = 创建扣款器(扣款比例: 0.1)

收入 = 10_000.00
print("起始收入： \(收入)")
收入 = 税务局(收入)
收入 = 律师(收入)
收入 = 牙医(收入)
print("经过税务局、律师以及牙医，收入还剩下： \(收入)")
```

### 永不返回的函数

```swift
func 一去不回() -> Never {
    print("千万别调用这个函数，否则：")
    while true {
        print("逝去的青春。。。")
    }
}
```

[回到目录](#目录)

## Optional-或有或无

一个可能有值也可能没有任何东西的变量，定义时在类型后加个问号

```
<类型>?
```

```swift
var 错误代码: Int?
错误代码 = 404
错误代码 = nil
```

**强行开包**

```swift
错误代码 = 500
print("错误代码是 \(错误代码!)")
```

**或有或无绑定**

```swift
if let 错误代码 = 错误代码 {
    print("错误代码是 \(错误代码)")
} else {
    print("没毛病")
}
```

[回到目录](#目录)

## 合集类型

```
Array[元素]
[元素] // 简短写法
```

### 数组

```swift
var 有些数 = [Int]()

有些数.append(9)
有些数 = [] // 空的 `Int` 型数组
```

#### 有默认值的数组

```swift
var 三个数 = Array(repeating: 1.2, count: 3)
```

#### 把两个数组加到一起

```swift
let 三权分立 = ["行政", "立法", "司法"]
let 两权 = ["检查", "考试"]
let 五权分立 = 三权分立 + 两权
```

#### 访问与修改数组

```swift
var 购物单 = ["美酒", "咖啡", "香烟"]
print("购物单有 \(购物单.count) 个东西")

if 购物单.isEmpty {
    print("购物单里空空如也")
} else {
    print("购物单并不空")
}

购物单.append("止疼片")
购物单 += ["肉", "茶叶"]

var 第一个东西 = 购物单[0]

购物单[3] = "避孕套"
购物单[3...4] = ["功能饮料"]
购物单内容: ["美酒", "咖啡", "香烟", "功能饮料", "茶叶茶"]

购物单.insert("蜂蜜", at: 0)
let 蜂蜜 = 购物单.remove(at: 0)
```

#### 遍历一个数组

```swift
for 物品 in 购物单 {
    print("购物单里有：\(物品)")
}

for (索引, 物品) in 购物单.enumerated() {
    print("购物单物品 \(索引): \(物品)")
}
```

[回到目录](#目录)

### 集合

#### 集合类型的哈希值

集合只能包含有哈希值的数值
if `a == b`, then `a.hashValue == b.hashValue`

#### 建立集合

```swift
var 字母 = Set<Character>()
字母.insert("a")
字母 = []
```

```swift
var 有的色彩: Set<String> = ["红", "黄", "蓝"]
var 其他色彩: Set = ["日落", "暮秋", "严冬"]
```

#### 操作

**数量**

```swift
print("其他有 \(其他色彩.count) 种色彩")
```

**检查是否为空**

```swift
if 其他色彩.isEmpty {
    print("没有颜色，才是真正的色彩。")
} else {
    print("还是有几种颜色的。")
}
```

**插入和删除**

```swift
有的色彩.insert("绿")
if let 删除的色彩 = 有的色彩.remove("红") {
    print("\(删除的色彩) 已被删除")
} else {
    print("有的色彩里找不到 红色")
}
```

**并集与交集**

```
let 工作日: Set = [1, 2, 3, 4, 5]
let 休息日: Set = [6, 7]
工作日.union(休息日)
工作日.intersection(休息日)
```

[回到目录](#目录)

### 字典

#### 创建一个字典

```
// 创建空字典：
var 年纪的意义 = [String: String]()
年纪的意义["十八"] = "到了这个岁数，之前积累的各种成见就成了常识。"
```

```
// 以直接元素来创建字典
var 单词的含义 = ["共识": "当人们懒得继续思考时"]
// 根据直接元素类型来推断出字典类型为：[String: String]`
```

#### 字典操作

```swift
if 年纪的意义.isEmpty == false {
    print("至少有的年纪有些意义")
}

年纪的意义["一"] = "距离死亡更近了一年"

if let 十八岁的意义 = 年纪的意义["十八"] {
    print("十八岁的意义：\n\(十八岁的意义)")
}
```

#### 遍历一个字典

```swift
for (年纪, 意义) in 年纪的意义 {
    print("年纪 \(年纪) 的意义：\(意义)")
}
```

[回到目录](#目录)

## 闭包

无名函数：

```
{ (<参数表>) -> <返回值> in
    参数
}
```

```swift
let 罩杯 = ["A", "B", "C", "D", "E"]
let 最大罩杯 = 罩杯.sorted { (c1: String, c2: String) -> Bool in
    c1 > c2
    }.first!
let 最小罩杯 = 罩杯.sorted { (c1: String, c2: String) -> Bool in
    c1 < c2
    }.first!
print("最大罩杯是 \(最大罩杯), 最环保罩杯为 \(最小罩杯)")
```

### 从上下文推断参数类型

不声明参数类型

```swift
罩杯.sorted { (c1, c2) -> Bool in
    c1 > c2
}
```

不声明返回类型

```swift
罩杯.sorted { (c1, c2) in c1 > c2 }
```

简短参数名

```swift
罩杯.sorted { $0 > $1 }
```

操作符方法

```swift
罩杯.sorted(by: >)
```

- 闭包会_捕获_闭包定义处上下文中的常量和变量
- 闭包是引用类型

### 逃逸闭包

当一个闭包作为参数传入一个函数中，却在函数返回之后才被执行，该闭包便从函数中逃逸。
定义时要在参数名之前标注 `@escaping`

```swift
var 刑场: [() -> Void] = []

func 死刑缓期执行(囚犯闭包: @escaping () -> Void) {
    刑场.append(囚犯闭包)
}

func 死刑立刻执行(囚犯闭包: () -> Void) {
    囚犯闭包() // 立刻执行
}

死刑缓期执行 {
    print("夏天来了，秋天还会远吗？")
}

死刑立刻执行 {
    print("醉卧沙场君莫笑，古来征战几人回？")
}

// 输出：
// "醉卧沙场君莫笑，古来征战几人回？"
```

### 自动闭包

```swift
var 鱼肉 = ["鸡", "鸭", "鹅", "鱼"]
print(鱼肉.count) // 输出 "4"

let 刀俎 = { 鱼肉.remove(at: 0) }
print(鱼肉.count) // 输出 "4"

print("现在烹饪 \(刀俎())！")
// Prints "现在烹饪 鸡！"
print(鱼肉.count) // 输出 "3"

// 参数: () -> String
// 参数自动转换为闭包
func 享用(刀俎鱼肉: @autoclosure () -> String) {
    print("现在烹饪 \(刀俎鱼肉())!")
}

// 可以直接传入字符串
享用(刀俎鱼肉: "我")
// "我" 被转换为一个闭包，闭包返回"我"这个字符串
// 且只在用到时返回
```

[回到目录](#目录)

## 字符串与字符

- 字符串可以写成单行或多行
- 反斜线 (\) 可以用来把字符串断成多行以便于阅读，但最终的字符串值并不会包含断行
- 多行字符串第一行和最后一行可以用来做换行
- 对应三个单引号之后的格式缩进才有作用
- 特殊字符可以用反斜线来编码
- Unicode可以这么写：\u{<CodePoint>}
- 字符串是值类型（Value Type）

```swift
let 单行引用 = "There be light."
let 多行引用 = """

  绮萼随梦虹影畔，\
    紫薇弥香，\
    溪梅樱桃涧。\
  淑景乱花迷归雁，\
    足踏裙边春风面，\
    轻醉微雨红深浅。\
  薄暮疏钟，\
    共酌寒莫怨；\
  浮云西去愁肠断，\
    残阳北望长安远。

  """
```

输出：

```
绮萼随梦虹影畔，
  紫薇弥香，
  溪梅樱桃涧。
淑景乱花迷归雁，
  足踏裙边春风面，
  轻醉微雨红深浅。
薄暮疏钟，
  共酌寒莫怨；
浮云西去愁肠断，
  残阳北望长安远。
```

### 建立空字符串

```swift
var 空字符串 = ""
var 另一个空字符串 = String()
```

```swift
if 空字符串.isEmpty {
    print("很不幸必须用 isEmpty 来判断是否空字符串，而不能只看变量名字是\"空字符串\"。")
}
```

还可以这样：

```swift
空字符串 += "不再空虚"
```

### 字符串是字符的序列

```swift
for 字符 in "内有恶🐶" {
    print(字符)
}

let 八家姓: [Character] = ["赵", "钱", "孙", "李", "周", "吴", "郑", "王"]
var 八家姓字符串 = String(八家姓)
print(八家姓字符串)
// Prints "赵钱孙李周吴郑王"

八家姓字符串 += "。"
```

### Unicode

Unicode是一项包括字符集、编码方案等的业界标准，它解决了传统ASCII编码的局限性，覆盖了多数语言文字。
内部的编码依然是数字的形式，编码数字在范围 U+0000 到 U+D7FF inclusive，U+E000 到 U+10FFFF 之内被称作是Unicode标量（Unicode Scalar）。

### 扩展字形集簇

Swift里每个字符都以单个扩展字形集簇构成，一个“扩展字形集簇”是一个包含单个或多个Unicode标量的序列，合在一起产生的一个单独的有意义的字符。

```swift
let eAcute: Character = "\u{E9}"
// é

let combinedEAcute: Character = "\u{65}\u{301}"
// e 加上一撇  ́ (就是洋文咖啡Café里字母e上面的那个)
```

### 访问与改变字符串

因为Unicode里的字符可以由一个或多个数字来表示，任何关系到字符索引（index）的计算，包括计算字符串里包含多少个字符，都变得有点复杂。Swift的字符串里的字符不能以普通的整数而必须使用`String.Index`类型的索引。

```swift
var 咖啡 = "cafe"
咖啡.count // 4
咖啡 += "\u{301}"
咖啡.count // 4
```

```swift
let 科学 = "ABCDEFGHIJKMNPQRTVWXYZ"

print(科学[科学.startIndex])
// A

print(科学[科学.index(before: 科学.endIndex)])
// Z

print(科学[科学.index(after: 科学.startIndex)])
// B

let index7 = 科学.index(科学.startIndex, offsetBy: 7)
print(科学[index7])
// H
```

```swift
var 索引S: String.Index? = 科学.index(of: "S")
var 索引O: String.Index? = 科学.index(of: "O")
var 索引U: String.Index? = 科学.index(of: "U")
var 索引L: String.Index? = 科学.index(of: "L")

if (索引S == nil && 索引O == nil && 索引U == nil && 索引L == nil) {
    print("科学没有SOUL")
}
```

**插入**

```swift
var 句子 = "you understand"
句子.insert(contentsOf: "could ", at: 句子.startIndex)
句子.insert(contentsOf: "?", at: 句子.endIndex)
print(句子)
// 输出： "could you understand?"
```

**替换**

```swift
let range1 = 句子.range(of: "oul")!
句子.replaceSubrange(range1, with: "ulo")
let range2 = 句子.range(of: "nderstan")!
句子.replaceSubrange(range2, with: "redntsna")
print(句子)
// 输出： "culod you uredntsnad?"
```

**子字符串**

```swift
let 临床医学家 = "therapist"
let 字母R的索引 = 临床医学家.index(of: "r")!
let 第一个单词 = 临床医学家[..<字母R的索引]
let 第二个单词 = 临床医学家[字母R的索引...]
print("你可曾注意到临床医学家的英文单词 \"\(临床医学家)\" 是由另外两个单词 \"\(String(第一个单词))\"(此) 和 \"\(String(第二个单词))\"(强奸者) 组成?")
// 输出："你可曾注意到临床医学家的英文单词 "therapist" 是由另外两个单词 "the"(此) 和 "rapist"(强奸者) 组成?"
```

[回到目录](#目录)

## 枚举
> the average pencil is seven inches long, with just a half-inch eraser, in **case** you thought optimism was dead. -- Robert Brault
> （一根铅笔平均的长度为七英寸，末端的橡皮却只有半英寸，以防万一你认为乐观已经死亡。）

```
enum <枚举名> {
    <定义>
}
```

每个case可以是单独一行

```swift
enum 竖排星球 {
    case 水星
    case 金星
    case 地球
    case 火星
    case 木星
    case 土星
    case 天王星
    case 海王星
}
```

多个case也可以写在同一行

```swift
enum 横排星球 {
    case 水星, 金星, 地球, 火星, 木星, 土星, 天王星, 海王星
}
```

枚举类型可以被推断

```swift
enum 轮回 {
    case 天
    case 人
    case 阿修罗
    case 饿鬼
    case 地狱
    case 畜生
}

var 此生: 轮回
var 来世 = 轮回.人

此生 = .人
来世 = .天
```

### 开关匹配

```swift
switch 此生 {
case .阿修罗, .饿鬼, .地狱, .畜生:
    print("人身难得，东土难生，佛法难求，有此三者，善莫大焉。")
case .人:
    print("人心生一念，天地尽皆知。")
case .天:
    print("若离于爱恨，则无忧亦无惧，无人相，无我相，无寿者相，无众生相。")
}
```

记得 `switch` 必须覆盖所有可能的 `case`

```swift
switch 来世 {
case .天:
    print("三十三层离恨天")
default:
    print("难难难，道最玄。")
}
```

### 相关值

**例子**

定义一个出勤的枚举，
如果缺席，给出一个借口和真实的理由
定义三个分别从老师、经理以及自我的角度评价出勤的函数

```swift
enum 每日出勤 {
    case 出席
    case 缺席(借口: String, 真实原因: String)
}

func 老师评价(_ attendence: 每日出勤) {
    switch attendence {
    case .出席:
        print("继续努力学习，今天不流汗，明天就流泪。")
    case .缺席(_, let 真实原因):
        print("下午放学不要走，等家长来接，顺便谈谈 \(真实原因)")
    }
}

func 经理评价(_ attendence: 每日出勤) {
    switch attendence {
    case .出席:
        print("继续努力，今天工作不努力，明天努力找工作。")
    case .缺席(let 借口, _):
        print("\(借口) 似乎是个好理由")
    }
}

func 自我评价(_ attendence: 每日出勤) {
    switch attendence {
    case .出席:
        print("又是无聊的一天")
    case let .缺席(借口, 真实原因):
        print("我的借口是 \"\(借口)\" 其实谁都不知道实际上的原因是 \"\(真实原因)\"")
    }
}

let 杰克出勤表现: 每日出勤 = 每日出勤.缺席(借口: "闹钟坏了", 真实原因: "昨晚偶像剧看太晚了")
老师评价(杰克出勤表现)
// 输出：下午放学不要走，等家长来接，顺便谈谈 昨晚偶像剧看太晚了

let 好学生出勤表现: 每日出勤 = 每日出勤.出席
老师评价(好学生出勤表现)
// 输出：继续努力学习，今天不流汗，明天就流泪。

let 不满于现状的职员: 每日出勤 = 每日出勤.缺席(借口: "生病了", 真实原因: "去面试")
经理评价(不满于现状的职员)
// 输出：生病了 似乎是个好理由

自我评价(不满于现状的职员)
// 输出：我的借口是 "生病了" 其实谁都不知道实际上的原因是 "去面试"
```

### 原始值

隐性:

```swift
enum Month: Int {
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

print("九月的值是：\(Month.september.rawValue)")
// 输出："九月的值是：9"
```

```swift
enum 一些名字 : String {
    case michael
    case tom
    case jack
}

print("case tom 的字符串值是：\(一些名字.tom.rawValue)")
// 输出："case tom 的字符串值是：tom"
```

### 用原始值来初始化枚举的case

```swift
var 月份 = 7
if let month = Month(rawValue: 月份) {
    switch month {
    case .july:
        print("毕业季到了，分手季还会远吗？")
    default:
        print("一年的其他几个月。")
    }
} else {
    print("无法识别的月份。")
}
```

### 枚举递归

枚举的case关联值可以是自己本身的类型

```swift
enum 陷阱 {
    case 正确的出路
    indirect case 某条出路(陷阱)
}

let 永恒 = 陷阱.某条出路(陷阱.正确的出路)
let 爱情陷阱 = 陷阱.某条出路(永恒)

func 逃离(from 一个陷阱: 陷阱) {
    switch 一个陷阱 {
    case .正确的出路:
        print("找到了正确的出路。")
    case .某条出路(let 另一个陷阱):
        print("进入另一个陷阱。")
        逃离(from: 另一个陷阱)
    }
}

逃离(from: 爱情陷阱)
// 输出：
// 进入另一个陷阱。
// 进入另一个陷阱。
// 找到了正确的出路。
```

### Enum的一些用途

- enum里可以有方法（method），方法为每个case而存在，如果方法里需要根据`case`来进行一些操作，则必须考虑所有的`case`
- enum可以很好的表达一些等级、结构甚至流程

**一个藏袍**

表示不同季节的enum，并且可以将一个季节演变到下一个季节

```swift
enum 季节: String, CustomStringConvertible {

    case 春
    case 夏
    case 秋
    case 冬
    
    mutating func 下一个季节() {
        switch self {
        case .春:
            self = .夏
        case .夏:
            self = .秋
        case .秋:
            self = .冬
        case .冬:
            self = .春
        }
    }
    
    var description: String {
        return "现在是\(self.rawValue)"
    }
}

var 现在的季节 = 季节.春
print(现在的季节)
现在的季节.下一个季节()
print(现在的季节)
```

输出：
现在是春
现在是夏

**一个藏袍**

表示爱情的不同阶段和过度

```swift
enum 爱的阶段: String {
    case 相遇
    case 相恋
    case 婚姻
    case 习以为常
    case 厌倦
    case 陌路
    case 分离
    case 失落
}

extension 爱的阶段 {
    var 下一个阶段: 爱的阶段 {
        guard self != .失落 else {
            preconditionFailure("失落是最后阶段")
        }
        
        switch self {
        case .相遇:
            return .相恋
        case .相恋:
            return .婚姻
        case .婚姻:
            return .习以为常
        case .习以为常:
            return .厌倦
        case .厌倦:
            return .陌路
        case .陌路:
            return .分离
        case .分离:
            return .失落
        default:
            preconditionFailure()
        }
    }
    
    func 回忆() -> 爱的阶段 {
        guard self == .分离 else {
            preconditionFailure("爱过才知情重。")
        }
        return .失落
    }
}

extension 爱的阶段: CustomStringConvertible {
    var description: String {
        switch self {
        case .相遇, .相恋, .婚姻, .习以为常:
            return "You are the one"
        case .厌倦, .陌路, .分离:
            return "走着走着就散了，回忆都淡了。"
        case .失落:
            return "回头发现你不见了，突然我乱了。"
        }
    }
}

var 此阶段 = 爱的阶段.相遇
var 下阶段 = 此阶段.下一个阶段
print("\(此阶段.rawValue) 成了 \(下阶段.rawValue)")

此阶段 = 下阶段
下阶段 = 此阶段.下一个阶段

print("\(此阶段.rawValue) 成了 \(下阶段.rawValue)")

此阶段 = 下阶段
下阶段 = 此阶段.下一个阶段

print("\(此阶段.rawValue) 成了 \(下阶段.rawValue)")

此阶段 = 下阶段
下阶段 = 此阶段.下一个阶段

print("\(此阶段.rawValue) 成了 \(下阶段.rawValue)")

此阶段 = 下阶段
下阶段 = 此阶段.下一个阶段

print("\(此阶段.rawValue) 成了 \(下阶段.rawValue)")

此阶段 = 下阶段
下阶段 = 此阶段.下一个阶段

print("\(此阶段.rawValue) 成了 \(下阶段.rawValue)")

此阶段 = 下阶段
下阶段 = 此阶段.回忆()

print(此阶段)
print(下阶段)

```

输出：
//
相遇 成了 相恋
相恋 成了 婚姻
婚姻 成了 习以为常
习以为常 成了 厌倦
厌倦 成了 陌路
陌路 成了 分离
走着走着就散了，回忆都淡了。
回头发现你不见了，突然我乱了。

### 泛型参数枚举

枚举的关联值可以有泛型参数

**一个藏袍**
定义网络请求的返回数据

```swift
enum 网络请求<结果类, 错误类> {
    case 成功(结果类)
    case 失败(错误类)
}

let 请求1 = 网络请求<String, Int>.成功("valid response")
let 请求2 = 网络请求<String, Int>.失败(404)

func 打印(某请求: 网络请求<String, Int>) {
    switch 某请求 {
    case .成功(let 信息):
        print("成功响应得到信息：\(信息)")
    case .失败(let 错误代码):
        print("请求失败错误代码：\(错误代码)")
    }
}

打印(某请求: 请求1)
打印(某请求: 请求2)
```

[回到目录](#目录)

## 类与结构

定义一个类：

```swift
class 情花 { // 类名
<陈述>
}
```

类 常量:

```swift
情花一般开不长久
static let 一般是否长久 = false
```

存储属性

```swift
var 花名: String?
let 有刺 = true // 常量：情花总是有刺

// 推断类型的属性
var 能否持久 = 一般是否长久
var 看起来美: Bool // 变量
```

计算属性

```swift
var 味道好: Bool {
// 计算属性必须是变量
    return 看起来美 == false
// 味道好与看起来美相反
}
```

懒惰属性

```swift
// 懒惰属性只在用到时才计算，虽然最后()表示执行
lazy var 剪不断理还乱: Int = { [unowned self] in
    if let 花名 = self.花名 {
        return 花名.lengthOfBytes(using: .utf8)
    } else {
        return 123
    }
}()
```

初始化器

```swift
// 非或有或无的属性用之前必须初始化
init(看起来美: Bool, 花名: String? = nil) {
    self.看起来美 = 看起来美
    self.花名 = 花名
}
```

实例函数

```swift
func 打印描述() {
    情花.打印花语(关于: self)
}
```

类函数

```swift
// `final` 表示无法被子类重写
final func 显示名字() -> String {
    return self.花名 ?? self.默认名字()
}

func 默认名字() -> String {
    return "情"
}
```

```swift

// 实例没有被引用时会调用
deinit {
    print("\(self.显示名字()) 来如黄鹤去如晨风。")
}

static func 打印花语(关于 花: 情花) {
    let 显示名字 = 花.显示名字()
    print("花名 \(花.默认名字()) 花语：")

    if let 花名 = 花.花名 {
        print("\(花.默认名字()) 的名字叫 \"\(花名)\"")
    } else {
        print("\(花.默认名字()) 无名")
    }

    if 花.有刺 {
        print("\(显示名字) 长满了刺")
    }

    if 花.能否持久 {
        print("\(显示名字) 可以持久")
    } else {
        print("\(显示名字) \(情花.一般是否长久 ? "永远持续" : "不会持续太久")")
    }

    let look = 花.看起来美 ? "看起来美" : "看起来丑陋无比"
    let taste = 花.味道好 ? "吃起来好" : "吃起来很糟糕"

    if 花.看起来美 == 花.味道好 {
        print("\(显示名字) \(look) 并且 \(taste)")
    } else {
        print("\(显示名字) \(look) 但是 \(taste)")
    }
}
```

创建一些实例：

```swift
let 有些花 = 情花(看起来美: false)
有些花.打印描述()
let 有些恨 = 情花(看起来美: true, 花名: "恨")
有些恨.能否持久 = true
有些恨.打印描述()
```

`有些花` 输出：

```
花名 情 花语：
情 无名
情 长满了刺
情 不会持续太久
情 看起来丑陋无比 但是 吃起来好
```

`有些恨` 输出：

```
花名 情 花语：
情 的名字叫 "恨"
恨 长满了刺
恨 可以持久
恨 看起来美 但是 吃起来很糟糕
```

**结构**

```swift
struct 地址 {
    
    // 结构常量
    static let 格式 = "中国"
    
    var 门牌号: String
    var 街道名: String
    var 区名: String
    var 市名: String
    var 邮编: String
    var 国家: String
    
    var 完整地址: String {
        return "\(门牌号) \(街道名)，\(区名)，\(市名) \(邮编)，\(国家)"
    }
}
```

```swift
print("地址遵循 \(地址.格式) 格式")
```

```swift
// 缺省的所有属性构建器
let 某个地址 = 地址(门牌号: "369", 街道名: "青龙门大街", 区名: "东城区", 市名: "甘肃", 邮编: "2207", 国家: "明朝")
print(某个地址.完整地址)
```

### 继承

```swift
// 恨是情花的一种
class 恨: 情花 {
    init() {
        super.init(看起来美: false, 花名: "恨意")
        self.能否持久 = true
    }
    
    // 重载用 `override` 关键字
    override func 默认名字() -> String {
        return "恨"
    }
}

let 更多的恨 = 恨()
更多的恨.打印描述()
```

`更多的恨` 输出：

```
花名 恨 花语：
恨 的名字叫 "恨意"
恨意 长满了刺
恨意 可以持久
恨意 看起来丑陋无比 但是 吃起来好
```

### `required` 和 `convenience` 初始化方法

- `required` 确保子类依然实现这个初始化方法
  - `required init(name: String)`
- `convenience` 初始化方法必须直接或间接的调用非 `convenient` 的初始化方法
  - `convenience init()`
- 非`convenience`初始化方法被称为 *指定的* (designated)初始化方法
- 指定的初始化方法必须调用直接父类的指定初始化方法
- `convenience`初始化方法必须调用同一个类里的初始化方法
- `convenience`初始化方法必须最终调用到一个指定的初始化方法

### 识别操作符
检查两个常量或变量是否引用同一个对象实例
- 同样 (===)
- 不同样 (!==)

```swift
let 假花 = 有些花
print("有些花 是 假花？\(有些花 === 假花)")
```

### 清理 Deinitialization

```swift
var 一瞬即逝的花: 情花? = 情花(看起来美: true)
一瞬即逝的花 = nil
```

输出：

```
情 来如黄鹤去如晨风。
```

### 类与结构

*类*:

- 引用类型(reference type)，一般用来表示有身份特征的对象，如“学生”
- 存在“堆”内存，速度较慢
- 一般存在改变内部状态的逻辑
- 即使定义为`let`常量，内部状态依然可变

*结构*:

- 值类型(value type)，例如“地址”
- 存在“栈”内存，速度较快
- 简单的数据存储（不牵涉复杂逻辑）
- 定义为`let`常量时不可改变

[回到目录](#目录)

## 协议

### 定义

```swift
protocol 可以被救赎的 {
    
    // 方法:
    func 救赎()
    
    // 属性:
    var 与神的距离: UInt { get set }
    var 已被救赎: Bool { get }
    
    // 初始化方法
    init?(一开始与神的距离: UInt)
}
```

### 实现协议

```swift
class 世人: 可以被救赎的 {
    
    var 与神的距离: UInt
    
    // 非`final`类可以被继承重写抹掉，用`required`关键字确保实现协议里的初始化方法
    required init?(一开始与神的距离: UInt) {
        if 一开始与神的距离 == 0 {
            print("已被救赎，人心无存。")
            return nil
        }
        self.与神的距离 = 一开始与神的距离
    }
    
    func 救赎() {
        if 与神的距离 > 0 {
            与神的距离 -= 1
        }
    }
    
    var 已被救赎: Bool {
        return 与神的距离 == 0
    }
}
```

Swift不在乎你怎么实现协议，只要你实现了就行
实现协议里的`get`属性有几种方法：

- 一个存储属性常量
- 一个存储属性变量
- 一个只读计算属性
- 一个读写计算属性

### 实现多个协议

首先定义`恶念`协议：

```swift
protocol 恶念 {
    func 满足欲望()
}
```

### 用扩展来实现协议

让`世人`同时实现`恶念`

```swift
extension 世人: 恶念 {
    func 满足欲望() {
        self.与神的距离 += 1
    }
}
```

```swift
func 注解(of thing: 可以被救赎的 & 恶念) {
    print("有恶念却可以被救赎的事物")
    
    if thing.已被救赎 {
        print("神救赎了你")
    } else {
        print("与神的距离：\(thing.与神的距离)")
        thing.满足欲望()
        print("欲望满足后，与神的距离变成：\(thing.与神的距离)")
        thing.救赎()
        print("经过救赎，与神的距离变成：\(thing.与神的距离)")
    }
}

let 人们 = 世人(一开始与神的距离: 20)!
注解(of: 人们)

let distance = 人们.与神的距离
for _ in 1...distance {
    人们.救赎()
}

注解(of: 人们)
// Print: "神救赎了你"
```

[回到目录](#目录)

## 泛型

> It is __generally__ agreed that "Hello" is an appropriate greeting because if you entered a room and said "Goodbye," it could confuse a lot of people.
> -- Dolph Sharp, "I'm O.K., You're Not So Hot"
> （“你好”是一个被__广泛__接受的打招呼方式，因为如果你走进一个房间然后说“再见”，会让许多人不解，心想这孙子是谁啊？）

### 泛型函数 (Generic Function)

假设你需要一个函数来交换两个变量的值，却不想给每两个数据类型单独写一个函数，那么就可以用泛型，**它如同不同类型的父类型。**

```swift
func 互相交换值<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var firstNumber = 3
var secondNumber = 7
互相交换值(&firstNumber, &secondNumber)
// `firstNumber` 现在等于 7, `secondNumber` 现在等于 3

var 人间 = ""
var 地狱 = "充满恶魔"
互相交换值(&人间, &地狱)
// `地狱` 空了，而 `人间` 现在 "充满恶魔"
```

### 范型类型 (Generic Type)

用来表示“东西”的范型，“东西”可以放在袋子里并取出

```swift
struct 口袋<东西> {
    var 口袋里的东西 = [东西]()
    mutating func 放进去(_ 一个东西: 东西) {
        self.口袋里的东西.append(一个东西)
    }
    mutating func 拿出来() -> 东西 {
        return self.口袋里的东西.removeLast()
    }
}

var 中山装的口袋 = 口袋<String>();
中山装的口袋.放进去("立法权")
中山装的口袋.放进去("行政权")
中山装的口袋.放进去("司法权")
中山装的口袋.放进去("考试权")
中山装的口袋.放进去("弹劾权")
print(中山装的口袋.拿出来())
```

### 类型约束 (Type Constraints)

```swift
func 斗争<Z: 正义Protocol, X: 邪恶Protocol>(正义: Z, 邪恶: X)
```

为什么不可以这样：

```swift
func 斗争(正义: 正义Protocol, 邪恶: 邪恶Protocol)
```

因为编译器必须在__编译时__弄清具体什么类被用到了（而不能是带有Generic的类），如果`正义Protocol`或`邪恶Protocol`里用到了`associatedtype`或者指定了一些必须满足的约束条件，那么这么写就无法编译通过。

举个栗子，下面的代码是不能编译的：

```swift
func 是否存在(某对象: Equatable, 于 数组: [Equatable]) -> Bool {
    return 数组.contains(某对象)
}
```

而这样写就没事了：

```swift
func 是否存在<T: Equatable>(某对象: T, 于 数组: [T]) -> Bool {
    return 数组.contains(某对象)
}
```

### 关联类型 (Associated Type)

关联类型`associatedtype`有的时候很有用，就像占位符一样。
假设我们有一个非常泛型的`制造机`协议，它根据符合输入类型的参数，来产生输出类型的结果

```swift
protocol 制造机 {
    associatedtype 输入类型
    associatedtype 输出类型
    func 制造(输入: 输入类型) -> 输出类型
}
```

我们又建立了一个`可转换`协议：

```swift
protocol 可转换 {
    associatedtype 转换后的类型
    func 转换() -> 转换后的类型
}
```

### 带有约束的关联类型 (Associated Type with Constraints)

定义一个`婚姻介绍所`，它有一个`配偶供应`和`求偶需求`，二者各自都遵循`制造机`协议，前者提供`婚姻介绍所`的输入类型，后者使用`婚姻介绍所`的输出类型。

```swift
protocol 配偶供应 {
    associatedtype 配偶类型
    var 配偶: 配偶类型 { get }
}

protocol 求偶需求 {
    associatedtype 求偶类型
    func 求偶(某人: 求偶类型) -> String
}

protocol 婚姻介绍所: 制造机 {
    associatedtype 配偶: 配偶供应 where 配偶.配偶类型 == 输入类型
    associatedtype 求偶: 求偶需求 where 求偶.求偶类型 == 输出类型
    init(配偶: 配偶, 求偶: 求偶)
}

struct 介绍人: 配偶供应 {
    let 配偶: String
}

struct 求偶人: 求偶需求 {
    let name: String
    func 求偶(某人: String) -> String {
        return "遇到\(某人)"
    }
}

class 夕阳红婚介所: 婚姻介绍所 {
    
    let 配偶: String
    let 求偶: String
    
    required init(配偶: 介绍人, 求偶: 求偶人) {
        self.配偶 = 配偶.配偶
        self.求偶 = 求偶.求偶(某人: 配偶.配偶)
    }
    
    func 制造(输入: String) -> String {
        return "\(输入) 使得 \(self.求偶) 遇到 \(self.配偶)"
    }
}

let 左隔壁大妈 = 介绍人(配偶: "大妈本人")
let 右隔壁大爷 = 求偶人(name: "王大爷")
let 夕阳红 = 夕阳红婚介所(配偶: 左隔壁大妈, 求偶: 右隔壁大爷)
夕阳红.制造(输入: "孤独空虚寂寞冷")
```

### 复杂一些的栗子

遵循`制造机`协议，描述绿色植物的光合作用。

> There are some micro-organisms that exhibit characteristics of both plants and animals. When exposed to light they undergo __photosynthesis__; and when the lights go out, they turn into animals. But then again, don't we all?
> （有些微观生物同时具有植物和动物的特性，当有阳光的时候它们进行__光合作用__；而没有光的时候，它们就变成了禽兽。不过，我们不都是如此吗？）

```swift
protocol 光合作用产物 {
    init()
    func 发散()
}
```

遵循`制造机`协议

```swift
class 光合作用产生器<T: 可转换, P: 光合作用产物>: 制造机 where T.转换后的类型 == P {
    func 制造(输入: T) -> P {
        return 输入.转换()
    }
}

struct 二氧化碳<P: 光合作用产物>: 可转换 {
    func 转换() -> P {
        print("转换二氧化碳进行中……")
        return P()
    }
}

struct 氧气: 光合作用产物 {
    init() {}
    func 发散() {
        print("氧气不断发散中……")
    }
}
```

现在我们可以定义绿色植物了：

```swift
// 定义一个绿色植物，它的类型是`光合作用产生器`（也即遵循`制造机`协议），它的输入是`二氧化碳`（遵循`可转换`协议），可以转换为`氧气`
let 绿植 = 光合作用产生器<二氧化碳<氧气>, 氧气>()
绿植.制造(输入: 二氧化碳<氧气>()).发散()
// 输出：
// 转换二氧化碳进行中……
// 氧气不断发散中……
```

`光合作用产生器`可以被抽象为`通用产生器`，适用于所有遵循`可转换`协议的类型。(否则`光合作用产生器`需要`可转换`协议类型的`转换后的类型`遵循`光合作用产物`)

```swift
class 通用制造机<T: 可转换, O>: 制造机 where O == T.转换后的类型 {
    func 制造(输入: T) -> O {
        return 输入.转换()
    }
}
```

其实还可以更简洁：

```swift
class 简洁制造机<T: 可转换>: 制造机 {
    func 制造(输入: T) -> T.转换后的类型 {
        return 输入.转换()
    }
}
```

> 我们生活的地方 / 就像一个垃圾场 / 人们都像是虫子一样 / 在这里你争我抢 / 吃进的都是良心 / 拉出的全是思想
> "垃圾场" - 何勇

```swift
struct 良心: 可转换 {
    func 转换() -> String {
        return "思想"
    }
}

let 垃圾场 = 简洁制造机<良心>()
print(垃圾场.制造(输入: 良心()))
// 打印："思想"
```

### 带有where分句的泛型 (Generics with where Clause)

```swift
func 比较转换结果<T1: 可转换, T2: 可转换>(_ 转换物1: T1, _ 转换物2: T2) -> Bool where T1.转换后的类型 == T2.转换后的类型, T1.转换后的类型: Equatable {
    let 转换结果1 = 转换物1.转换()
    let 转换结果2 = 转换物2.转换()
    return 转换结果1 == 转换结果2
}
```

### 泛型扩展 (Extension with Generics)

给`Array`增加一个扩展，检查是否有真的`陈述`存在

```swift
struct 陈述: CustomStringConvertible {
    let 句子: String
    let 是真的吗: Bool
    var description: String {
        return "这是一个\(是真的吗 ? "真" : "假")的陈述。"
    }
}

let 陈述1 = 陈述(句子: "下一个陈述是真的", 是真的吗: false)
let 陈述2 = 陈述(句子: "上一个陈述是假的", 是真的吗: true)

let 好几条陈述 = [陈述1, 陈述2]

extension Array where Element == 陈述 {
    var 有真的陈述吗: Bool {
        return self.contains(where: { $0.是真的吗 })
    }
}

print("有真的陈述吗？\(好几条陈述.有真的陈述吗 ? "有" : "无")")
```

### 泛型下标 (Generic Subscript)

```swift
extension Array where Element == 陈述 {
    subscript<Indices: Sequence>(indices: Indices) -> [Element]
        where Indices.Iterator.Element == Int {
            var result = [Element]()
            for index in indices {
                result.append(self[index])
            }
            return result
    }
}

let 部分陈述 = 好几条陈述[[1, 0]]
print(部分陈述)
```

[回到目录](#目录)

## 访问控制

一个模块（module）是一个独立的代码单元，可以被其他模块用`import`来导入

### 语法

```swift
public class 公共澡堂 {}
internal class 内部更衣室 {}
fileprivate class 男淋浴房 {}
private class 私人衣物箱 {}

public var 公众评价 = "极差"
internal let 内部评价 = "很好"
fileprivate func 文件私有函数() {}
private func 私有功能室() {}
```

### 访问控制等级

- 定义为 `open` 和 `public` 的实体可以被定义它们的模块里的任何代码使用，其他引用定义模块的模块代码也可以使用。一般用作框架(framework)的公共接口。
- `internal` 实体只能在被定义的模块里使用
- `file-private` 实体只能在定义它的源文件里使用。
- `private` 实体只能在定义它的类、结构内部，以及同一源文件里的扩展里使用
- 默认的访问控制等级是 `internal`

*`open` 对比 `public`*

- `public` 类和成员只能在定义它们的模块里被继承或重写
- `open` 类和成员也可以在其他引用它们的模块里被继承和重写

实体不能以比自己访问控制更严的实体来定义

例如：一个 `open` 的属性定义在一个 `private` 类里，或者一个 `public` 函数的参数是个 `private` 的类型，这就仿佛说你不需要购买本产品就能获得大奖，详情请见产品包装袋里。

### 单元测试目标

单元测试可以访问任何内部的实体，只需要在`import`实体的模块时加上`@testable`的前缀，并且编译那个模块时把testing打开。

### 自定义类型

一个类型的访问控制等级会影响它成员的默认访问控制等级

- `private` 或 `fileprivate` 类型 -> `private` 或 `fileprivate` 成员
- `internal` 或 `public` 类型 -> `internal` 成员
- `public` 类型默认 `internal` 成员，以保证公开的API类型不会失误暴露出内部的细节

### 其他类型

下面这段文字看起来挺恐怖的，如果你很懒并且觉得自己理解能力很强的话可以跳过这个列表而看其后的 **简单逻辑**

- **元组（Tuple）**的访问控制等级是其元素中等级最严的那个
- **函数类型**的访问等级是它的参数和返回值类型最严的访问控制等级，如果这并不是你想要的那么函数定义时必须特别注明
- **枚举**里每个`case`的访问控制等级跟枚举本身一样
- **枚举**用到的**原始值(raw value)**以及**关联值**的类型的访问控制等级必须高过枚举本身
- **内嵌类型** 的访问控制等级跟类型成员的访问控制等级规则一直，事实上内嵌类型本身也是类型成员的一种
- **子类**的访问控制等级不能比父类高，然而，重载的类成员可以有比父类成员更高的访问控制等级
- **常量**，**变量**或**属性**的访问控制等级不能比自身的类型更公开
- 常量、变量、属性、下标的**getters** 和 **setters**具有跟各自常量、变量、属性、下标同样的访问控制等级
- 你可以给**setter**一个比**getter**更低（更严）的访问控制等级：`fileprivate(set)`, `private(set)` or `internal(set)` 在 `var` 或 `subscript` 之前
- 自定义 **初始化方法**可以有跟类型一样或者更严的访问控制等级
- **required** 初始化方法必须跟类型有同样的访问控制等级
- **默认初始化方法**的访问控制等级跟它所在的类型一致，除非是`public`类型，默认初始方法的访问控制等级为`internal`
- 结构的**默认成员初始方法**的访问控制等级是结构里存储属性中最低的访问控制等级，`public`结构初始方法默认的访问控制等级为`internal`，除非另行指定
- **协议（protocol）** 里的需求有跟协议同样的访问控制等级
- 一个类型可以遵循一个访问控制等级比自己低的**协议**
- 这句话跟访问控制等级无关，只是在这里试验你是否认真看，当你看到这一条时你应该充满自信的相信自己还是个认真的人
- **扩展**里的类型成员跟扩展的类型本身的成员默认访问控制等级一样
- **扩展**可以有专门的访问控制修饰符，例如：`private extension`
- **类型别名（type alias）**可以有跟类型同样或限制更多的访问控制等级

**简单逻辑**

- 一个木条水桶的容量取决于最短的那个木条，即使最长的长到了天上
- 一个飞机上有一名乘客去过传染病疫区且身体不适，那么整个飞机的人都得体检，即便没去过疫区甚至下飞机前用消毒水洗澡还喝了两瓶白酒精

[回到目录](#目录)

## 操作符进阶

### 位操作

> 1和0看起来就是那么正确，它们各自为对方而存在：1，一个确信的竖直线；0，一个表示什么都没有，虚无的符号。 - Sadie Plant, _zeros + ones_

**位反 NOT**

```swift
let 初始字位: UInt8 = 0b00001111
let 位反 = ~初始字位 // 11110000
```

**位和 AND**

```swift
let 部分真相: UInt8 = 0b11111000
let 遗漏真相: UInt8 = 0b00111001
let 完整真相 = 部分真相 & 遗漏真相 // 00111000
```

**位或 OR**

```swift
let 上牙: UInt8 = 0b01010101
let 下牙: UInt8 = 0b10101010
let 咬合 = 上牙 | 下牙 // 11111111
```

**位异或 XOR**

```swift
let 男生女生: UInt8 = 0b00010100
let 女生男生: UInt8 = 0b00000101
let 下一代 = 男生女生 ^ 女生男生
00010001
```

**位移 shift**

**无符号整数**:

1. 现有的字位会向左或向右移动指定的位
2. 移动后超过整数存储范围的字位被舍弃
3. 多出来的位置被0填充

**有符号整数**: 有符号整数向右位移时，采用无符号整数相同的规则，但左边空缺位以符号位填补。

**溢出操作符**

```swift
var 无符号八位整数 = UInt8.max // 255
// 无符号八位整数 += 1 会导致错误
无符号八位整数 = 无符号八位整数 &+ 1 // 0
```

- 溢出和 (`&+`)
- 溢出减 (`&-`)
- 溢出乘 (`&*`)

### 优先与关联

```swift
2 + 3 % 4 * 5 // 17
2 + ((3 % 4) * 5) // 17
```

### 操作符方法

类与结构可以通过操作符重载来实现定制操作符

*例子*

宇宙中有两种存在形式，物质与景深。 定义一个`特性`结构
包含物质与精神，定制这个结构的操作符。

```swift
struct 特性 {
    var 精神 = false
    var 物质 = false
}

infix operator &|
infix operator |&
prefix operator ...

extension 特性 {
    
    static func && (左: 特性, 右: 特性) -> 特性 {
        return 特性(精神: 左.精神 && 右.精神, 物质: 左.物质 && 右.物质)
    }
    
    static func || (左: 特性, 右: 特性) -> 特性 {
        return 特性(精神: 左.精神 || 右.精神, 物质: 左.物质 || 右.物质)
    }
    
    static func &| (左: 特性, 右: 特性) -> 特性 {
        return 特性(精神: 左.精神 && 右.精神, 物质: 左.物质 || 右.物质)
    }
    
    static func |& (左: 特性, 右: 特性) -> 特性 {
        return 特性(精神: 左.精神 || 右.精神, 物质: 左.物质 && 右.物质)
    }
    
    static prefix func ... (c: 特性) -> String {
        switch (c.精神, c.物质) {
        case (true, false):
            return "没有物质的精神"
        case (false, true):
            return "没有灵魂的物质"
        case (false, false):
            return "四大皆空的虚无"
        case (true, true):
            return "物质与精神同在"
        }
    }
}

let 灵魂 = 特性(精神: true, 物质: false)
let 肉身 = 特性(精神: false, 物质: true)

let 常人 = 灵魂 || 肉身
let 恶魔 = 灵魂 &| 肉身
let 神明 = 灵魂 |& 肉身

print("常人：\(...常人)")
print("恶魔：\(...恶魔)")
print("神明：\(...神明)")
```

[回到目录](#目录)

## 模式

_模式_ 对应单独值或联合值的结构，例如(1, 2)是一个由逗号分开的两个元素，可以被(x, y)模式匹配

### 通配模式

```swift
let 重要的事情 = "不要为黄油应该抹在面包的哪一面而纠结 - 两面会被你同时吃掉。"
for _ in 1...3 {
    // 重要的事情说三遍
    print(重要的事情)
}
```

### 标识符模式

标识符模式是变量或常量本身，跟任何允许的值匹配

```swift
let 有的人 = 250
```

### 值绑定模式

将匹配的值绑定给变量或常量

```swift
let 三戒 = ("不听", "不看", "不说")
switch 三戒 {
case let (一戒, "不看", _):
    // 匹配第二个元素为"不看"，第三个元素无所谓，第一个元素赋值给"一戒"
    print("第一戒是 \(一戒)")
default:
    break
}
```

### 元组模式

逗号分隔的一个或多个模式

```swift
let (好消息, 坏消息): (Int, Int) = (2, 3)
```

```swift
let 每天的好坏消息 = [(1, 0), (3, 2), (5, 7)]
for (好消息, _) in 每天的好坏消息 {
    print("这天的好消息是：\(好消息)")
}
```

只有一个元素的元组有没有括号都可以

```swift
let 某人年龄 = 30
let (某人的智商) = -1
let (某人的情商): Int = -3
```

### 或有或无（Optional）模式

或有或无模式匹配的值包裹在`some(Wrapped)`里
是`Optional<Wrapped>`枚举的一个case

```swift
let 皇帝身上的衣服: Int? = nil
if case .some(let 衣服) = 皇帝身上的衣服 {
    print(衣服)
} else {
    print("小孩：皇帝没有穿衣服！")
}

if case let 衣服? = 皇帝身上的衣服 {
    print(衣服)
} else {
    print("小孩：皇帝没有穿衣服！")
}
```

### 类型转换模式

```
is <类型>
<模式> as <类型>
```

### 表达式模式

表达式的值，只在 `switch` 开关的 `case` 标签里出现

```swift
let 星际尘埃 = (102, 57, 81)
switch 星际尘埃 {
case (0, 0, 0):
    print("尘埃就在原点")
case (-10...10, -10...10, -10...10):
    print("尘埃在原点附近")
default:
    print("尘埃跟原点有一定距离")
}
```

可以重载操作符 `~=` 来提供定制的表达式匹配行为

```swift
func ~=(模式: String, 值: Int) -> Bool {
    return 模式 == "\(值)"
}

switch 星际尘埃 {
case ("0", "0", "0"):
    print("星际尘埃在原点处")
default:
    print("星际尘埃已离开原点")
}
```

[回到目录](#目录)

## 错误处理

如果你了解Java，Swift里的错误处理就是Java里的 `try...catch...` 和 `throw` 那套异常处理机制。
Swift里的错误是遵循了 `Error` 协议的类型的实例，
遵循 `Error` 协议表示这个类型的实例可以用作错误处理。

一般用枚举来表示一系列有关系的错误。

```
func 抛出错误的函数() throws -> String
func 不抛出错误的函数() -> String
```

### do-catch 处理错误

```
do {
    try <表达式>
    <陈述>
} catch <模式1> {
    <陈述>
} catch <模式2> where <条件> {
    <陈述>
}
```

**例子**

佛家认为人有七苦：生、老、病、死、爱别离、怨憎会、求不得，
把每种苦表现为`Error`，定义一个可以抛出这些错误的函数，再写一段代码调用此函数并捕获错误。

```swift
enum 人生之苦: Error {
    case 生(描述: String)
    case 老(描述: String)
    case 病(描述: String)
    case 死(描述: String)
    case 爱别离(描述: String)
    case 怨憎会(描述: String)
    case 求不得(描述: String)
}

enum 生命 {
    case 人, 神
}

func 生命的骰子(for life: 生命) throws -> String {
    guard life != .神 else {
        return "人心无存"
    }
    
    let sorrows: [人生之苦] = [.生(描述: "人生而有罪。"),
                                   .老(描述: "廉颇老矣，尚能饭否？"),
                                   .病(描述: "君有疾在凑理，不治将恐深。"),
                                   .死(描述: "人生自古谁无死，留取丹心照汗青。"),
                                   .爱别离(描述: "人有悲欢离合，月有阴晴圆缺，此事古难全。"),
                                   .怨憎会(描述: "若离于爱恨，则无忧亦无惧。无人相，无我相，无寿者相，无众生相。"),
                                   .求不得(描述: "怜我世人，忧患实多。")]
    
    let number = arc4random_uniform(UInt32(sorrows.count + 1))
    if number < sorrows.count {
        throw sorrows[Int(number)]
    }
    
    return "最后还有一样留在了潘多拉的盒子里的叫做希望。"
}

do {
    let diceResult = try 生命的骰子(for: .人)
    print("骰子的结果：\(diceResult)")
} catch 人生之苦.生(let msg) {
    print("生之苦：\(msg)")
} catch 人生之苦.老(let msg) {
    print("老之苦：\(msg)")
} catch 人生之苦.病(let msg) {
    print("病之苦：\(msg)")
} catch 人生之苦.死(let msg) {
    print("死之苦：\(msg)")
} catch 人生之苦.爱别离(let msg) {
    print("爱别离苦：\(msg)")
} catch 人生之苦.怨憎会(let msg) {
    print("怨憎会苦：\(msg)")
} catch 人生之苦.求不得(let msg) {
    print("求不得苦：\(msg)")
} catch _ {
    print("人生时有意外。")
}
```

### 把错误转换为或有或无（Optional）的值

```swift
if let 某人生 = try? 生命的骰子(for: .人) {
    print("某人的一生：\(某人生)")
} else {
    print("某人的一生出了错。")
}
```

### 防止错误扩散

有时候你知道你做的事情没毛病

```swift
let 神圣的生命 = try! 生命的骰子(for: .神)
print("何为神？\(神圣的生命)")
```

### 用`defer`来收拾残局

`defer`的代码会在当前的执行范围结束后执行，以相反与 `defer` 定义的顺序；
我猜这是遵循了清理应该从最近到最远的顺序，
就好像打扫卫生一般先清理高处再清理低处；
又好像从一楼上到三楼，如果要后退的话你必须先从三楼下到二楼，再从二楼下到一楼。

```
func 打印实验手册() {
    print("Velilind的实验法则：")
    print("第一步：如果测试结果难以重现，只做一次测试。")
    defer {
        print("清理第一步")
    }
    print("第二步：如果测试结果数据需要一个直线连接关系，那么就只取样两次。")
    defer {
        print("清理第二步")
    }
}

打印实验手册()

// 输出:
// Velilind的实验法则：
// 第一步：如果测试结果难以重现，只做一次测试。
// 第二步：如果测试结果数据需要一个直线连接关系，那么就只取样两次。
// 清理第二步
// 清理第一步
```

[回到目录](#目录)

## 编码与解码

### 协议

*Encodable*

```swift
func encode(to: Encoder) throws
```

*Decodable*

```swift
init(from decoder: Decoder) throws
```

*Codable*

```swift
typealias Codable = Encodable & Decodable
```

### 自动编码

遵循`Codable`并确保所有存储属性也都`Codable`

*例子*

a fool with a tool (is still a fool). 一个有工具的傻子依然是一个傻子。

```swift
struct 傻子: Codable {
    var 号码: String
    var 姓名: String
    var 工具: 工具
    
    // 可以给参与编码的属性重命名
    enum CodingKeys: String, CodingKey {
        case 号码 = "identifier"
        case 姓名
        case 工具
    }
}

struct 工具: Codable {
    var 名称: String
}
```

### 自定义类型编码

```swift
var tool = 工具(名称: "经济改良")
var fool = 傻子(号码: "001", 姓名: "晚清", 工具: tool)

let jsonEncoder = JSONEncoder()
let jsonData = try! jsonEncoder.encode(fool)
let jsonString = String(data: jsonData, encoding: .utf8)!
print(jsonString)

let jsonDecoder = JSONDecoder()
fool = try! jsonDecoder.decode(傻子.self, from: jsonData)
```

- `CodingKeys` 是内嵌在类型里的枚举
- 遵循 `CodingKey` 协议
- 需要用 `String` 作为原始值
- 包含所有属性，包括不需要重命名的
- 自动被创建，需要重命名属性时才需要写出

### 限制

- `扩展（extension）`无法实现`Codable`
- 必须用具体类来编码和解码

[回到目录](#目录)

## 内存安全

- **弱引用**不会改变对象的**引用计数**，定义为或有或无（Optional），在对象的引用计数为0的时候变成`nil`。
- **非拥有引用（unowned reference**跟弱引用`weak`类似，他们假定引用总是有一个值，因此不能定义为或有或无（Optional）。

### 捕获列表 Capture list

**捕获列表（Capture List）** 是一个包含被闭包捕获的变量的数组

**例子**

口袋妖怪来如风去入云，在那一瞬间我们要抓住皮卡丘

```swift
var 精灵 = "皮卡丘"
var 闭包 = { print("捉住 \(精灵)") }
精灵 = "超音蝠"
闭包()
// 输出："捉住 超音蝠"

精灵 = "皮卡丘"
闭包 = { [精灵] in print("捉住 \(精灵)") }
精灵 = "超音蝠"
闭包()
// 输出："捉住 皮卡丘"
```

对于引用类型，捕获列表里捕获的是对当前对象的引用

### unowned self 无法拥有的自我

```swift
class 书籍 {
    
    var 名称 = "某书"
    
    lazy var 圣贤读书: () -> String = {
        [unowned self] in
        return "\(self.名称)：阅读让我们学到美和真理，使我们的生活更美好。"
    }
    
    lazy var 凡人读书: () -> String = {
        [unowned self] in
        return "\(self.名称)：书中自有颜如玉，书中自有黄金屋。"
    }
}

let 一本书 = 书籍()
print(一本书.圣贤读书())
print(一本书.凡人读书())
```

### strong weak 模式

当 `self` 可能成为 `nil` 的时候

```swift
extension 书籍 {
    func 检查书虫() {
        DispatchQueue.main.async {
            [weak self] in
            guard let strongSelf = self else {
                print("这本书已然不在。")
                return
            }
            let 有虫 = strongSelf.名称.contains("书虫")
            if 有虫 {
                print("这本书已生虫。")
            }
        }
    }
}
```

[回到目录](#目录)

