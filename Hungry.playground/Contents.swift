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
    var leftspoon: Spoon
    var rightspoon: Spoon
    
    init(leftspoon: Spoon, rightspoon: Spoon) {
        self.leftspoon = leftspoon
        self.rightspoon = rightspoon
    }
    
    func think() {
        leftspoon.pickUp()
        rightspoon.pickUp()
    }
    
    func eat() {
        usleep(1000)
        leftspoon.putDown()
        rightspoon.putDown()
    }
    
    func run() {
        while true {
            think()
            eat()
        }
    }
}

//var spoons: [Spoon] = []
let spoon0 = Spoon()
let spoon1 = Spoon()
let spoon2 = Spoon()
let spoon3 = Spoon()
let spoon4 = Spoon()

var developers: [Developer] = []
let developer0 = Developer(leftspoon: spoon0, rightspoon: spoon1)
let developer1 = Developer(leftspoon: spoon1, rightspoon: spoon2)
let developer2 = Developer(leftspoon: spoon2, rightspoon: spoon3)
let developer3 = Developer(leftspoon: spoon3, rightspoon: spoon4)
let developer4 = Developer(leftspoon: spoon4, rightspoon: spoon0)

developers.append(developer0)
developers.append(developer1)
developers.append(developer2)
developers.append(developer3)
developers.append(developer4)

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}
