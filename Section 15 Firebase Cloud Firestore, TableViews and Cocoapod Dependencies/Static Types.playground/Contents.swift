import Foundation

struct MyStruct {
  let instanceProperty = "ABC"
  static let typeProperty = "123"
  
  func instanceMethod() {
    
  }
  static func typeMethod() {
    
  }
}
    
MyStruct.typeMethod()
print(MyStruct.typeProperty)

let myStruct = MyStruct()
print(myStruct.instanceProperty)
myStruct.instanceMethod()
