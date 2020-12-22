//
//  AFile.swift
//  SwiftAccessLevels
//
//  Created by Angela Yu on 14/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class AClass {
    
    //Global variables, also called class properties.
    private var aPrivateProperty = "private property"
    
    fileprivate var aFilePrivateProperty = "fileprivate property"
    
    var anInternalProperty = "internal property"
    
    func methodA () {
        
        var aLocalVariable = "local variable"
        
        //Step 1. Try to print aLocalVariable Here
//        print("\(aLocalVariable) printed from methodA in AClass") - Possible
        
        //Step 3. Try to print aPrivateProperty Here
//      print("\(aPrivateProperty) printed from methodA in AClass") - Possible
        
        //Step 6. Try to print aFilePrivateProperty Here
//      print("\(aFilePrivateProperty) printed from methodA in AClass") - Possible
        
        //Step 9. Try to print anInternalProperty Here
//      print("\(anInternalProperty) printed from method in AnoterClassInTheSameFIle") - Possible
    }
    
    func methodB () {
        
        //Step 2. Try to print aLocalVariable Here
//      print("\(aLocalVariable) printed from methodB in AClass") - Not Possible
        //Step 4. Try to print aPrivateProperty Here
//      print("\(aPrivateProperty) printed from methodB in AClass") - Possible
    }
    
}

class AnotherClassInTheSameFile {

    init() {
        
        //Step 5. Try to print aPrivateProperty Here
//      print("\(aPrivateProperty) printed from method in AnotherClassin the same File") - Not Possible
        
        //Step 7. Try to print aFilePrivateProperty Here
//      print("\(aFilePrivateProperty) printed from method in AnoterClassInTheSameFIle") - Possible
    }
}
