import UIKit

var str = "Hello, playground"

//bubblesort

var array = [2,2,3,4,1,6,0,-1]

var length = array.count

for i in 0..<length {
    
    for j in 0..<(length - i - 1) {
        
        if array[j] > array [j + 1] {
            
            let t = array [j + 1]
            
            array[j + 1] = array [j]
            
            array [j] = t
            
        }
    }
}
print(array)

// инкапсюляция
class Animal {
    private var weight = 1000
    private var force = 100
    
    init() {
        
    }
    
    init(weight: Int , force: Int) {
        self.weight = weight
        self.force = force
    }
    var useWeight: Int {
        get {
            return weight
        }
        set {
            weight = newValue
        }
    }
    var useForce : Int {
        get {
            return force
        }
        set {
            force = newValue
        }
    }
}
var cat = Animal()
cat.useWeight
cat.useForce
cat.useWeight = 10
cat.useForce = 1028

//Полиморфизм
class Car {
    func drive() {
        print("I'm on the highway to hell")
    }
}
class SuperCar:Car {
    override func drive() {
        print("I'm on the highway to hell on Supercar")
    }
    
}
func drive(car: Car) {
    car.drive()
}
drive(car: Car())
drive(car: SuperCar())
//Наследование
class Bat {
    var fly: Bool = true
    func voice() -> String {
        return "Visp"
    }
}
class Batman : Bat {
    override func voice() -> String {
        return "Where is the trigger?"
    }
}
var bat = Bat()
var batMan = Batman()
batMan.fly = false
bat.voice()
batMan.voice()
bat.fly


// Stack
class Stack {
    var stackArray = [Int]()
    func push(int :Int) {
        self.stackArray.append(int)
    }
    func pop() -> Int? {
        if self.stackArray.last != nil {
            let t = self.stackArray.last!
            self.stackArray.removeLast()
            return t
        } else {
            return nil
        }
    }
}
var stack = Stack()
stack.push(int: 10)
stack.pop()
stack.push(int: 11)
stack.push(int: 3213)
stack.push(int: 222)
stack.pop()
stack.push(int: 1)
