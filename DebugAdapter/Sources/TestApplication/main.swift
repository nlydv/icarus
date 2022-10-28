import Foundation
import Dispatch

import func Darwin.fputs
import var Darwin.stderr

class MyClass {
    var names = ["John", "Jane", "Joan"]
    var numbers = [12, 13e12, 11.2]
    var isTrue = true
    var isFalse = false
    
    enum MyError: Error {
        case foobar
    }
    
    func doThing() {
        let foo = 12
        let bar = "foo"
        let bin = [12, 14, 18]
        
        print("Doing the thing!")
        do {
            throw MyError.foobar
        }
        catch {
            fputs("Failed to do the thing!\n", stderr);
        }
    }
}

print("Starting up!")

let myObj = MyClass()
myObj.doThing()

print("Finished!")
