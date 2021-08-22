import Foundation

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var 영희: Customer?
영희 = Customer(name: "영희")
영희!.card = CreditCard(number: 1234_5678_9012_3456, customer: 영희!)
영희 = nil


