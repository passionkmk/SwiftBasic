import Foundation

//----------------------------
// 1. 기본 열거형

enum School {
    case primary    // 유치원
    case elementary // 초등
    case middle     // 중등
    case high       // 고등
    case college    // 대학
    case university // 대학교
    case graduate   // 대학원
}

enum SchoolOneLine {
    case primary, element, middle, high, college, university, graduate
}

var highestEducationLevel: School = .university
highestEducationLevel = .college


//-----------------------------
// 2. Raw Value

enum SchoolForString: String {
    case primary = "유치원"
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let level: SchoolForString = .university
print(level.rawValue)

enum SchoolForStringAuto: String {
    case primary = "유치원"
    case elementary = "초등"
    case middle = "중등"
    case high = "고등"
    case college
    case university
    case graduate
}

let name: SchoolForStringAuto = .college
print(name.rawValue)

let high = SchoolForString(rawValue: "고등")
let company = SchoolForString(rawValue: "회사")


//---------------------------------
// 3. 연관 값

enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = MainDish.pasta(taste: "크림")
dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dinner = .chicken(withSauce: true)
dinner = .rice

enum PastaTaste {
    case cream, tomato
}

enum PizzaDough {
    case cheeseCrust, thin, original
}

enum PizzaTopping {
    case pepperoni, cheese, bacon
}

enum MainDishList {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSource: Bool)
    case rice
}

var newDinner: MainDishList = .pasta(taste: .tomato)
newDinner = .pizza(dough: .cheeseCrust, topping: .pepperoni)

//----------------------------------
// 4. 순환 열거형

enum ArithmeticExpressionIndividual {
    case number(Int)
    indirect case addition(ArithmeticExpressionIndividual, ArithmeticExpressionIndividual)
    indirect case multiplication(ArithmeticExpressionIndividual, ArithmeticExpressionIndividual)
}

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, .number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}
// 이진 트리등의 순환 알고리즘을 구현하는데 유용

let result: Int = evaluate(final)
print(result)
