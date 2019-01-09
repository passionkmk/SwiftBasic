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
        print("Person 클래스의 인스턴스가 소멸됩니다.")
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


//---------------------------------------------------------
// 3. 구조체 클래스 차이

struct Infomation {
    let name: String
    var age: Int
}

var min: Infomation = Infomation(name: "MinKu", age: 99)
min.age = 100

// min의 값을 복사하여 할당
var friend: Infomation = min

print(min.age)
print(friend.age)

friend.age = 999

print(min.age)
print(friend.age)

var minP: Person = Person()
var friendP: Person = minP // minP의 참조를 할당

print(minP.height)
print(friendP.height)

friendP.height = 185.5

print(minP.height) // friendP는 minP를 참조하였으므로 값이 변동됨
print(friendP.height) // 위와 값이 같으므로 참조하는곳의 값이 같음

func changeInfo(_ info: Infomation) {
    var copiedInfo: Infomation = info
    copiedInfo.age = 1
}

func changePerson(_ info: Person) {
    info.height = 155.3
}

changeInfo(min) // 값만 복사되어 전달되기때문에 영향을 미치지않음
print(min.age)

changePerson(minP) // 참조가 전달되었으므로 값이 바뀜
print(minP.height)

print(minP === friendP) // 참조가 같은지 확인하는 === 연산자 식별연산자
