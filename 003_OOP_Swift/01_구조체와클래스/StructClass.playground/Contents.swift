import Foundation

//------------------------------------------------------
// 1. 구조체

struct BasicInfomation {
    var name: String
    var age: Int
}

var minkuInfo: BasicInfomation = BasicInfomation(name: "Minku", age: 99)
minkuInfo.age = 100
minkuInfo.name = "Seba"

let sebaInfo: BasicInfomation = BasicInfomation(name: "Seba", age: 99)
//sebaInfo.age = 200
//sebaInfo.name = ""  // let으로 선언하여 변경 불가


//-------------------------------------------------------
// 2. 클래스

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    deinit {
        print("Person 클래스의 인스턴스사 소멸됩니다.")
    }
}

var minku: Person = Person()
minku.height = 123.4
minku.weight = 123.4

let jenny: Person = Person()
jenny.height = 123.4
jenny.weight = 123.4    // 클래스는 참조 타입이므로 let으로 선언해도 변경이 가능하다.

var nobody: Person? = Person()
nobody = nil // 소멸되면서 deinit이 호출됨
