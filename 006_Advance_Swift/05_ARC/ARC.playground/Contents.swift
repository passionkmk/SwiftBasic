import UIKit

//---------------------------------------------
// 1. 강한참조

class TestClass1 {
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
}

var testClass1: TestClass1? = TestClass1() // ARC count: 1
testClass1 = nil // ARC count: 0


// Retain Cycle의 발생
class TestClass2 {
    var testClass: TestClass2? = nil
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
}

var testClass2_1: TestClass2? = TestClass2() // 2_1 ARC count: 1
var testClass2_2: TestClass2? = TestClass2() // 2_2 ARC count: 1
testClass2_1?.testClass = testClass2_2 // 2_1 ARC count: 2
testClass2_2?.testClass = testClass2_1 // 2_2 ARC count: 2

testClass2_1 = nil // 2_1 ARC count: 1
testClass2_2 = nil // 2_2 ARC count: 1 deinit이 호출되지 않음


//---------------------------------------------------
// 2. 약한참조

class TestClass3 {
    weak var testClass: TestClass3? = nil
    init() {
        print("init")
    }
    deinit {
        print("deinit")
    }
}

var testClass3_1: TestClass3? = TestClass3() // 3_1 ARC count: 1
var testClass3_2: TestClass3? = TestClass3() // 3_2 ARC count: 1
testClass3_1?.testClass = testClass3_2 // 3_1 ARC count: 1 + 0 weak이므로 count가 증가하지 않음
testClass3_2?.testClass = testClass3_1 // 3_2 ARC count: 1 + 0

testClass3_1 = nil // 3_1 ARC count: 1
testClass3_2 = nil // 3_2 ARC count: 1 deinit이 호출됨


//-----------------------------------------------------
// 4. 1) Delegate
protocol ChildClassProtocol: class {
    
}

class ChildClass {
    weak var delegate: ChildClassProtocol? // weak로 선언해주면 편안..
}

class ParentClass: ChildClassProtocol {
    let childClass: ChildClass = ChildClass()
    func prepareChildClass() {
        childClass.delegate = self // 호출한 클래스에서 자기자신을 대리인으로 위임하기 떄문에 강한참조순환 일어난다.
    }
}


//-------------------------------------------------------
// 4. 2) Closure

class ClosureClass {
    var aBlock: (() -> ())? = nil
    let aConstraint: Int = 5
    init() {
        print("closure init")
        aBlock = { [weak self] in // capture list 사용
            print(self?.aConstraint)
        }
    }
    
    deinit {
        print("closure deinit")
    }
}

var closureClass: ClosureClass? = ClosureClass()
closureClass = nil
