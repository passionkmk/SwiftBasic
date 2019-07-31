import Foundation

// sync로 설정하게 되면 글로벌 큐가 끝나기 전까지 수행되지않음 다음작업이 먼저 수행후 다음수행
DispatchQueue.global(qos: .unspecified).sync {
    for i in 1...5 {
        print(i)
    }
    print("==================")
}

for i in 100...105 {
    print(i)
}

// Custom Queue 디폴트값은 Serial
let myQueue = DispatchQueue(label: "myQueue")

myQueue.sync {
    for i in 1...5 {
        print(i)
    }
    print("==================")
}
for i in 100...105 {
    print(i)
}

// Custom Queue concurrent
let myQueueConcurrent = DispatchQueue(label: "myQueueConcurrent", attributes: .concurrent)


// 글로벌 queue는 concurrent 하니까 동시에 수행된다 sync아닌 async이므로
DispatchQueue.global().async {
    for i in 1...5 {
        print("\(i)🐶")
    }
    print("==================")
}

DispatchQueue.global().async {
    for i in 200...205 {
        print("\(i)😍")
    }
    print("==================")
}

for i in 100...105 {
    print("\(i)👻")
}

// 하지만 마이큐는 기본적으로 serial하므로 차례로 실행된다 (개먼저 나오고 그다음)
myQueue.async {
    for i in 1...5 {
        print("\(i)🐶")
    }
    print("==================")
}

myQueue.async {
    for i in 200...205 {
        print("\(i)😍")
    }
    print("==================")
}

for i in 100...105 {
    print("\(i)👻")
}
