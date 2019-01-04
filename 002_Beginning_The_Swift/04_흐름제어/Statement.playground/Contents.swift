import Foundation

//-----------------------
// 2. switch

let value: Int = 5

switch value {
case 0:
    print("value == zero")
case 1...10:
    print("value == 1~10")
    fallthrough // break가 아닌 바로 아래로 넘어감
case Int.min..<0, 101..<Int.max:
    print("value < 0 or value > 100")
    break
default:
    print("10 < value <= 100")
}

typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("Minku", 99)

switch tupleValue {
case ("Minku", 50):
    print("정확히 맞췄습니다!")
case ("Minku", let age):
    print("이름만 맞췄습니다. 나이는 \(age)입니다.")
case (let name, 99):
    print("나이만 맞췄습니다. 이름은 \(name)입니다.")
default:
    print("누굴 찾나요?")
}

let 직급: String = "사원"
let 연차: Int = 1
let 인턴인가: Bool = false

switch 직급 {
case "사원" where 인턴인가 == true :
    print("인턴입니다.")
case "사원" where 연차 < 2 && 인턴인가 == false :
    print("신입사원입니다.")
case "사원" where 연차 > 5 :
    print("연식 좀 된 사원입니다.")
case "사원":
    print("사원입니다.")
case "대리":
    print("대리입니다.")
default:
    print("사장입니까?")
}


//-------------------------------
// 5. repeat-while


//var names: [String]


//-------------------------------
// 6. 구문이름

var numbers: [Int] = [3, 2342, 6, 3252]

numbersLoop: for num in numbers {
    if num > 5 || num < 1 {
        continue numbersLoop
    }
    
    var count: Int = 0
    
    printLoop: while true {
        print(num)
        count += 1
        
        if count == num {
            break printLoop
        }
        
        removeLoop: while true {
            if numbers.first != num {
                break numbersLoop
            }
            numbers.removeFirst()
        }
    }
}
