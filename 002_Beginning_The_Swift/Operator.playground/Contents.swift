import Foundation

//-------------------------------------
// 1. 전위 연산자

prefix operator **

prefix func **(value: Int) -> Int {
    return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive

print(sqrtMinusFive)

prefix func !(value: String) -> Bool { // !는 사용하고 있으나 String으로 중복정의(Overloading)한 것이다.
    return value.isEmpty
}

var stringValue: String = "yagom"
var isEmptyString: Bool = !stringValue

print(isEmptyString)


//--------------------------------------
// 2. 후위 연산자

postfix operator **

postfix func **(value: Int) -> Int {
    return value + 10
}

let five: Int = 5
let fivePlusTen: Int = five**

print(fivePlusTen)

let sqrtFivePlusTen: Int = **five**
print(sqrtFivePlusTen) // (10 + 5) * (10 + 5) == 225


//---------------------------------------
// 3. 중위 연산자

infix operator ** : MultiplicationPrecedence

func **(lhs: String, rhs: String) -> Bool {
    return lhs.contains(rhs)
}

let helloYagom: String = "Hello yagom"
let yagom: String = "yagom"
let isContainsYagom: Bool = helloYagom ** yagom

class Car {
    var modelYear: Int?
    var modelName: String?
    
    static func ==(lhs: Car, rhs: Car) -> Bool {
        return lhs.modelName == rhs.modelName
    }
}

struct SmartPhone {
    var company: String?
    var model: String?
    
    static func ==(lhs: SmartPhone, rhs: SmartPhone) -> Bool {
        return lhs.model == rhs.model
    }
}


let myCar = Car()
myCar.modelName = "S"

let yourCar = Car()
yourCar.modelName = "S"

var myPhone = SmartPhone()
myPhone.model = "Xs"

var yourPhone = SmartPhone()
myPhone.model = "6+"

print(myCar == yourCar)
print(myPhone == yourPhone)








