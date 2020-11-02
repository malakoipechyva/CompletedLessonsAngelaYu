
let myOptional: String?
myOptional = nil

//1. force unwrap
let crushText = myOptional!

//2. check for nil value
if myOptional != nil {
  let text1 = myOptional
} else {
  print("found a nil")
}

// 3. optional binding
if let safeOptional = myOptional {
  let text = safeOptional
  let text2 = text
  print(text2)
} else {
  print("foind a nil")
}
// 4.nil coalescing operator
let text3 = myOptional ?? "letters"

//5. Optional chainig

struct OptionalStruct {
  let test1: String = "words"
  func testFunc() {
    print("letters")
  }
}

let test: OptionalStruct?
test = nil

print(test?.test1)
test?.testFunc()

