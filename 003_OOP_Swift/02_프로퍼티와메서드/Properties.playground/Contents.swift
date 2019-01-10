import Foundation


//------------------------------------------
// 1. 저장 프로퍼티

struct CoordinatePoint {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
}

// 기본적인 이니셜라이져가 있음
let minkuPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

class Position {
    var point: CoordinatePoint
    let name: String // 상수 프로퍼티
    
    // 기본값이 없으면 이니셜라이져를 해주어야함
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

let minkuPosition: Position = Position(name: "minKu", currentPoint: minkuPoint)


//----------------------------------------------
// 2. 지연 저장 프로퍼티

struct CoordinatePointL {
    var x: Int = 0
    var y: Int = 0
}

class PositionL {
    lazy var point: CoordinatePointL = CoordinatePointL()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let minkuPositionL: PositionL = PositionL(name: "Minku")

// 이 코드를 통해 point 프로퍼티로 처음 접근 할때
// point 프로퍼티의 CoordinatePointL이 생성
print(minkuPositionL.point)

