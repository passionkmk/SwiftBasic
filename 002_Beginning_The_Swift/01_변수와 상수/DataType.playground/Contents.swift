import Foundation

//--------------------------
// typealias

typealias MyInt = Int
typealias YourInt = Int
typealias MyDouble = Double

let age: MyInt = 100
var year: YourInt = 2080

year = age // 같은 Int 타입이기 떄문에 같은 취급

let month: Int = 7
let percentage: MyDouble = 99.9

//--------------------------
// tuple

var person: (String, Int, Double) = ("yagom", 100, 182.5)

print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")

person.1 = 99
person.2 = 178.5

print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")

var person2: (name: String, age: Int, height: Double) = ("mingu", 33, 175.0)

print("이름: \(person2.name), 나이: \(person2.age), 신장: \(person2.height)")

typealias personTuple = (name: String, age: Int, height: Double) // typealias로 사용을 많이 함


//----------------------------
// set

var names: Set<String> = []

var name: Set<String> = ["yagom", "chulsoo", "younghee", "yagom"] // 대괄호를 사용하므로 Array와 헷갈리지 않도록 주의 해야한다.

print(type(of: name))
print(name.isEmpty)
print(name.count) // 중복이 허용되지 않으므로 yagom은 하나

