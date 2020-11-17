let fruits = ["Apple", "pear", "Orange"]
let contacts = ["Adam": 123123124, "James": 565675656, "Amy": 79878978979870]
let word = "shchuchynshchyna"
let halfOpenRange = 1..<5
let closedRange = 1...5

for frut in fruits {
  print(frut)
}

for person in contacts {
  print("----- \(person.key)")
}

for letter in word {
  print(letter)
}

for _ in halfOpenRange {
  print("Loop os running")
}

let x = 10
var y = 5
while x > y {
  y += 1
  print(y)
}
