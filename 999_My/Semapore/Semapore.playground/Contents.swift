import Foundation

// value - 한번에 공유자원을 사용할수 있는 스레드의 수
//let semaphore = DispatchSemaphore(value: 1)
//
//DispatchQueue.global().async {
//    print("Kid 1 - wait")
//    semaphore.wait()
//    print("Kid 1 - wait finished")
//    sleep(1)
//    semaphore.signal()
//    print("Kid 1 - done with iPad")
//}
//
//DispatchQueue.global().async {
//    print("Kid 2 - wait")
//    semaphore.wait()
//    print("Kid 2 - wait finished")
//    sleep(1) // Kid 1 playing with iPad
//    semaphore.signal()
//    print("Kid 2 - done with iPad")
//}
//
//DispatchQueue.global().async {
//    print("Kid 3 - wait")
//    semaphore.wait()
//    print("Kid 3 - wait finished")
//    sleep(1) // Kid 1 playing with iPad
//    semaphore.signal()
//    print("Kid 3 - done with iPad")
//}

//    1 (our initial value)
//    0 (kid 1 wait, since value >= 0, kid 1 can play the iPad)
//    -1 (kid 2 wait, since value < 0, it enters threads queue)
//    -2 (kid 3 wait, since value < 0, it enters thread queue)
//    -1 (kid 1 signal, last value < 0, wake up kid 2 and pop it from queue)
//    0 (kid 2 signal, last value < 0, wake up kid 3 and pop it from queue)
//    1 (kid 3 signal, last value >= 0, no threads are waiting to be awaken)


let queue = DispatchQueue(label: "com.gcd.myQueue", attributes: .concurrent)
let _semaphore = DispatchSemaphore(value: 3)
for i in 0 ..< 15 {
    queue.async {
        let songNumber = i + 1
        _semaphore.wait()
        print("Downloading song", songNumber)
        sleep(2) // Download take ~2 sec each
        print("Downloaded song", songNumber)
        _semaphore.signal()
    }
}

//    3 (our initial value)
//    2 (song 1 wait, since value >= 0, start song download)
//    1 (song 2 wait, since value >= 0, start song download)
//    0 (song 3 wait, since value >= 0, start song download)
//    -1 (song 4 wait, since value < 0, add to queue)
//    -2 (song 5 wait, since value < 0, add to queue)
//    Repeats for all songs, it will take us to counter value of -12
//    -12 (song 15 wait, sing value < 0, add to queue)
//    -11 (song 1 signal, since last value < 0, wake first song in queue)
//    -10 (song 2 signal, since last value < 0, wake first song in queue)
//    You can continue this yourself in order to be sure you got the idea…
