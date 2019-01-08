import Foundation

//--------------------------------
// 1. 옵셔널의 형태

func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue { // 옵셔널이 열거형인 형태
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }
}

var myName: String? = "yagom"
checkOptionalValue(value: myName)

myName = nil
checkOptionalValue(value: myName)
