import UIKit

class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
    var car: Car?
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Car {
    let model: String
    init(model: String) {
        self.model = model
    }
    var owner: Person?
    
    deinit {
        print("Car \(model) is being deinitialized")
    }
}

var 철수: Person?
var 테슬라S: Car?

철수 = Person(name: "철수")
테슬라S = Car(model: "테슬라S")

철수!.car = 테슬라S
테슬라S!.owner = 철수

철수 = nil
테슬라S = nil
