import UIKit

class Spoon {
    
    let lock = NSLock()
    
    func pickUp() {
        lock.lock()
    }
    
    func putDown() {
        lock.unlock()
    }
}


class Developer {
    let name: String
    var leftspoon: Spoon
    var rightspoon: Spoon
    
    init(name: String, leftspoon: Spoon, rightspoon: Spoon) {
        self.name = name
        self.leftspoon = leftspoon
        self.rightspoon = rightspoon
    }
    
    func think() {
        leftspoon.pickUp()
        rightspoon.pickUp()
    }
    
    func eat() {
        print("\(self.name) starts eating")
        usleep(1_000_000)
        print("\(self.name) finished eating")
        rightspoon.putDown()
        leftspoon.putDown()
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
    
//    func run() {
//        think()
//        eat()
//    }
}

//var spoons: [Spoon] = []
let spoon0 = Spoon()
let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()

var developers: [Developer] = []
let developer0 = Developer(name: "developer0", leftspoon: spoon0, rightspoon: spoon1)
let developer1 = Developer(name: "developer1", leftspoon: spoon1, rightspoon: spoon2)
let developer2 = Developer(name: "developer2", leftspoon: spoon2, rightspoon: spoon3)
let developer3 = Developer(name: "developer3", leftspoon: spoon3, rightspoon: spoon4)
let developer4 = Developer(name: "developer4", leftspoon: spoon4, rightspoon: spoon0)

developers.append(developer0)
developers.append(developer1)
developers.append(developer2)
developers.append(developer3)
developers.append(developer4)

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
