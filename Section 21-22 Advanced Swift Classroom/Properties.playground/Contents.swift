import Foundation

//stored properties
let pizzaInInches: Int = 14
let numberOfSlicesStatic: Int = 6
var numberOfPeople: Int = 12
let slicesPerPerson: Int = 4

print(numberOfSlicesStatic)

//computed properties
var numberOfSlices: Int {
  return pizzaInInches - 4
}

var numberOfPizza: Int {
  //getter
  get {
    let numberOfPeopleFedPerPizza = numberOfSlices / numberOfSlicesStatic
    return numberOfPeople / numberOfPeopleFedPerPizza
  }
  //setter
  set {
    let totalSlices = numberOfSlices * newValue
    numberOfPeople = totalSlices / slicesPerPerson
  }
}

numberOfPizza = 7

print(numberOfPeople)

let winter = -5
var temperature: Int {
  get {
    return winter + 2
  }
  set {
    let windWinter = temperature - newValue
    temperature = windWinter
  }
}

print(temperature)


var test: Int = 5 {
  willSet {
    print(newValue)
//    print(oldValue)
  }
  didSet {
//    print(newValue)
    print(oldValue)
  }
}

test = 4
