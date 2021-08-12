import UIKit

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var student1: Person?
var student2: Person?
var student3: Person?
//print(student1)
//print(student2)
//print(student3)

student1 = Person(name: "철수")
//student1 = nil

student2 = student1
student3 = student1

print(Unmanaged.passUnretained(student1!).toOpaque())
print(Unmanaged.passUnretained(student2!).toOpaque())
print(Unmanaged.passUnretained(student3!).toOpaque())

student1 = nil
student2 = nil
student3 = nil
