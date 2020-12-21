import Foundation

var width: Float = 1.5
var height: Float = 2.3

var bucketsOfPaintYauhen: Float {
  return width * height / 1.5
}

print(bucketsOfPaintYauhen)

var bucketsOfPaint: Int {
  get {
    let area = width * height
    let areaCeoveredPerBucket: Float = 1.5
    let numberOfBuckets = area / areaCeoveredPerBucket
    let roundedBuckets = ceilf(numberOfBuckets)
    return Int(roundedBuckets)
  }
  set {
    let areaCeoveredPerBucket: Float = 1.5
    let area = Int(areaCeoveredPerBucket * Float(newValue))
    
  }
}
bucketsOfPaint = 4
//print(bucketsOfPaint)
