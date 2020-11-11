import UIKit

func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) ->Int {
  return operation(n1, n2)
}
calculator(n1: 2, n2: 3, operation: add)

func add(no1: Int, no2: Int) ->Int {
  return no1 + no2
}

calculator(n1: 2, n2: 3) { (no1, no2) -> Int in
  no1 * no2
}

calculator(n1: 2, n2: 3,operation: {$0 * $1})
calculator(n1: 2, n2: 3) {$0 * $1}


let array = [1, 2, 3, 4, 5, 6]
array.map{$0 + 1}
print(array.map({ (n1) in
  n1 + 1
}))
print(array.map{$0 + 1})

let changedArray = array.map { (n1) in
  "\(n1)"
}
print(changedArray)

