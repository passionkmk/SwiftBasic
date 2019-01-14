import Foundation

//----------------------------------------------
// 1. 옵셔널 체이닝
class Room {
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
}

class Building {
    var name: String
    var room: Room?
    
    init(name: String) {
        self.name = name
    }
}

struct Address {
    var provience: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
}

class Person {
    var name: String
    var address: Address?
    
    init(name: String) {
        self.name = name
    }
}

let minku: Person = Person(name: "Minku")

let optionalChaining: Int? = minku.address?.building?.room?.number // 옵셔널 체이닝

if let optionalBinding: Int? = minku.address?.building?.room?.number {
    print(optionalBinding)
}


//----------------------------------------------------
// 2. 빠른종료
func getNumber() {
    guard let number = minku.address?.building?.room?.number else {
        return
    }
}

