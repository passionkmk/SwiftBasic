import Foundation

class Person { // 아무클래스도 상속받지 않는 기반 클래스
    var name: String = ""
    var age: Int = 0
    
    var introduction: String {
        return "이름: \(name). 나이: \(age)"
    }
    
    func speak() {
        print("가나다라마바사")
    }
}

//---------------------------------------------
// 1. 상속

class Student: Person {
    var grade: String = "F"
    
    func study() {
        print("Study Hard....")
    }
}

class UniversityStudent: Student { // 상속받은 클래스를를 재상속 할수있음
    var major: String = ""
}

let university: UniversityStudent = UniversityStudent()
print(university.name)


//----------------------------------------------
// 2. 재정의

