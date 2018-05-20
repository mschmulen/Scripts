#!/usr/bin/swift

import Foundation 

class Hello { 
    func hello(_ name:String) { 
        print("hello \(name)") 
    } 
} 

let hello = Hello()
hello.hello( "matt")

print("done")