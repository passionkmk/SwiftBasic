import UIKit

func doSomething() {
    print("Do Something")
}

func doAnotherthing() {
    print("Do Anotherthing")
}

func excute(tasks: [() -> Void]) {
    for task in tasks {
        task()
    }
}

excute(tasks: [doSomething, doAnotherthing])


func sum(first: Int) -> ((Int) -> Int) {
    return {second in first + second}
}

print(sum(first: 5)(5))


