import Foundation

//-----------------------------------------
// 1. 인스턴스 메서드
class LevelClass {
    // 현재 레벨을 저장하는 저장 프로퍼티
    var level: Int = 0 {
        didSet {
            print("Level \(level)")
        }
    }
    
    // 레벨이 올랐을 때 호출할 메서드
    func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    // 레벨이 감소했을 때 호출할 메서드
    func levelDown() {
        print("Level Down!")
        level -= 1
        if level < 0 {
             reset()
        }
    }
    
    // 특정 레벨로 이동할 때
    func levelJump(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    // 레벨을 초기화할 때 호출할 메서드
    func reset() {
        print("Reset!")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.levelUp()
levelClassInstance.levelDown()
levelClassInstance.levelDown()
levelClassInstance.levelJump(to: 3)


class Level {
    var level: Int = 0
    func reset() {
//        self = Level() // 오류 클래스는 self에 참조를 변경 할수 없음
    }
}

struct LevelStruct {
    var level: Int = 0
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func reset() {
        print("Reset!")
        self = LevelStruct()
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()
levelStructInstance.reset()
print(levelStructInstance.level)

enum OnOffSwitch {
    case on, off
    mutating func nextState() {
        self = self == .on ? .off : .on
    }
}

var toggle: OnOffSwitch = .off
toggle.nextState()
print(toggle)


//--------------------------------------------------------
// 2. 타입 메서드

class AClass {
    static func staticTypeMethod() {
        print("AClass staticTypeMethod")
    }
    
    class func classTypeMethod() {
        print("AClass classTypeMethod")
    }
}

class BClass: AClass {
//    static 메서드는 override가 불가함
//    override static func staticTypeMethod() {
//        print("AClass staticTypeMethod")
//    }
    
    override class func classTypeMethod() {
        print("BClass classTypeMethod")
    }
}

AClass.staticTypeMethod()
AClass.classTypeMethod()
BClass.staticTypeMethod()
BClass.classTypeMethod()


// 시스템 음량은 항상 유일한 값이 되어야 함
struct SystemVolume {
    
    // 타입 프로퍼티를 사용하면 언에나 유일함 값이 됨
    static var volume: Int = 5
    
    // 타입 프로퍼티를 클래스 내부에서 제어하려면 타입메서드로 선언하여 self로 호출할수 있다.
    static func mute() {
        self.volume = 0  // SystemVolume.volume = 0과 동일한 표현
    }
}

// 네비게이션 역할은 여러 인스턴스가 할수 있음
class Navigation {
    
    // 인스턴스 마다 음량을 따로 설정할 수 있음
    var volume: Int = 5
    
    // 길 안내 음성 재생
    func guideWay() {
        // 네비게이션 외 다른 음량 재생원 음소거
        SystemVolume.mute()
    }
    
    // 길 안내 음성 종료
    func finishGuideWay() {
        // 기존 재생원 음량 복구
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10

let myNavi: Navigation = Navigation()
myNavi.guideWay()
print(SystemVolume.volume)

myNavi.finishGuideWay()
print(SystemVolume.volume)
