import Foundation

class Animal {
  var name: String
  init(n: String) {
    name = n
  }
}

class Human: Animal {
  func code() {
    print("Typing away...")
  }
}

class Fish: Animal {
  func breathUnderWater() {
    print("Breathing under water.")
  }
}

let yauhen = Human(n: "Yauhen")
let postman = Human(n: "Hvedar")
let snapper = Fish(n: "YoYo")

//type of neighbours is Animal
let neighbours = [yauhen, postman, snapper]
let neigbour = neighbours[0]

// is for type checking
if neighbours[1] is Human {
  print("Hey, i'm a human")
}

if neighbours[2] is Human {
  print("hey, i'm a mermaid")
}

func findYoYo(from animals: [Animal]) {
  for animal in animals {
    if animal is Fish {
      print(animal.name)
      let fish = animal as! Fish //forced downcast
      fish.breathUnderWater()
      let animalFish = fish as Animal // Upcast
    }
  }
}
findYoYo(from: neighbours)

//let fish = neighbours[1] as! Fish - produce error
let fish2 = neighbours[1] as? Fish
fish2?.breathUnderWater()

// safe downcast
if let fish = neighbours[1] as? Fish {
  fish.breathUnderWater()
} else {
  print("casting has failed")
}

let bebe = Human(n: "bebe")
let dada = Human(n: "dada")
let shchupak = Fish(n: "Nightscale")
let num = 13

//Any for all objects, AnyObject - for objects from classes, NSObject - for object from Foundation
let newNeighbours: [Any] = [bebe, dada, shchupak, num]

