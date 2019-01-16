import Foundation

//----------------------------------------
// 1. 이니셜라이져

class SomeClass {
    init() {
        // 초기화 할때 필요한 코드
    }
}

struct SomeStruct {
    init() {
        // 초기화 할때 필요한 코드
    }
}

enum SomeEnum {
    case someCase
    init() {
        // 열거형은 초기화할 때 반드시 case중 하나가 되어야 함
        self = .someCase
    }
}

// 1. 1) 프로퍼티 기본값
struct Area {
    var squareMeter: Double
    init() {
        squareMeter = 0.0
    }
}

let room: Area = Area()
print(room.squareMeter)

// 1. 2) 이니셜라이져 매개변수
struct Area1 {
    var squarMeter: Double
    
    init(fromPy py: Double) {
        squarMeter = py * 3.3058
    }
}
