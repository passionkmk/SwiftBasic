import Foundation

//----------------------------------------
// 1. 가변 매개변수와 입출력 변수

func sayHelloToFriends(me: String, friends names: String...) -> String {
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend)!" + " "
    }
    
    result += "I m " + me + "!"
    return result
}

print(sayHelloToFriends(me: "Min Ku", friends: "Johansson", "Jay", "Wizplan"))
print(sayHelloToFriends(me: "Min Ku"))



var numbers: [Int] = [1, 2, 3]

func nonReferenceParameter(_ arr: [Int]) {
    var copieArr: [Int] = arr
    copieArr[1] = 1
}

func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers[1])

referenceParameter(&numbers)
print(numbers[1])


//-------------------------------------------
// 2. 데이터 타입으로서의 함수

typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: CalculateTwoInts = addTwoInts
print(mathFunction(2, 5))

mathFunction = multiplyTwoInts
print(mathFunction(2, 5))

// 매개변수로 사용
func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

// 반환값으로 사용
func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
    return toAdd ? addTwoInts : multiplyTwoInts
}
printMathResult(chooseMathFunction(true), 3, 5)


//----------------------------------------------
// 3. 중첩 함수

typealias MoveFunc = (Int) -> Int

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currentPosition: Int) -> Int {
        return currentPosition + 1
    }
    
    func goLeft(_ currentPosition: Int) -> Int {
        return currentPosition - 1
    }
    
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = -4

let moveToZero: MoveFunc = functionForMove(position > 0)
print("원점으로 갑시다.")

while position != 0 {
    print("\(position)...")
    position = moveToZero(position)
}


//--------------------------------------------------
// 4. 종료되지 않는 함수

func crashAndBurn() -> Never {
    fatalError("Something very, very bad happened")
}

//crashAndBurn()


//---------------------------------------------------
// 5. 반환 값을 무시할 수 있는 함수

func say(_ something: String) -> String {
    print(something)
    return something
}

@discardableResult func discardableResultSay(_ something: String) -> String {
    print(something)
    return something
}

// 반환값을 사용하지 않았으므로 컴파일러가 경고 할수 있음
say("hello")

// @discardableResult 키워드를 사용하였으므로 컴파일러가 경고 하지 않음
discardableResultSay("hello")
