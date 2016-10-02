//: Playground - noun: a place where people can play

import UIKit

/** Constants and mutable variables */

let constantString = "hello"
let constantInt = 123
let constantDouble = 12.0
let constantFloat = 8.0 // difference: double has 2x bits as a float
let cgFloat: CGFloat = 1.0  // CGFLoat: wrapper for obj-C: option-click to see type/more info
let constantTrueBool:Bool = false

var mutableInt = 1
mutableInt = 2

var mutableString = "hello"
mutableString = "hi"

let firstNumber = 1
let secondNumber = 2
print(firstNumber < 2)

/** ARRAYS */
let intArray = [1, 2, 3] // types must be the same within array
let doubleArray:[Double] = [2.0, 2.0, 2.0]
let stringArray = ["hi", "bye"]
let objectArray = [UILabel(), UILabel(), UILabel()]

var arrayWeCanAppendTo = [1, 2, 3]
arrayWeCanAppendTo.append(4)

var anyObjectArray:[Any] = [1, "hi", UILabel()] // declare any: anything can go in array
var emptyArray = [Int]() //initializing empty int array

/** DICTIONARIES */
let constantDictionary = ["hi":"bye", "hello":"world"] // type: String:String
let stringDictionary = ["hi":3, "bye": 4]
let jsonDictionary:[String:Any] = ["hi":[1,2,3], "hello": 3, "dictionary":["hi":"bye"]] // as [String : Any]

constantDictionary["hi"]
constantDictionary["dictionary"]

var mutableDictionary = ["hi":"bye", "hello":"world"]
mutableDictionary["hi"] = "hi there"
mutableDictionary["hi"]
mutableDictionary.removeValue(forKey: "hi")
mutableDictionary["hi"]

/** TUPLES */
let tuple1 = (1, UIButton(), "hi") // anything can go in a tuple
tuple1.0

/** OPTIONALS */
var optionalInt: Int? = nil // optionals: checks before you use it esp. when nil values
optionalInt = 1

/** IMPLICITLY UNWRAPPED OPTIONAL */
var implicitlyUnwrappedOptional: Int! = nil // don't care if it can be nil, use it anyways
// can't assign nil to a regular value
// when in doubt, use question mark

var regularInt:Int? = nil

// check if optionalint unwrapped
if let unwrappedOptionalInt = optionalInt {
    print(1 + unwrappedOptionalInt) // UnwrappedOptionalInt is no longer optional int
}

let x: Int? = nil
let y: Int = 2
if let unwrappedX = x {
    unwrappedX + y
}

/** FUNCTIONS */
func aFunction(anInt: Int, aString: String) -> Int {
    // returns an int
    return 3
}

func aFunctionThatReturnsStuff() -> String {
    // function names are very specific, can be very long + explain exactly what the function does
    // because of autocomplete
    return "hi"
}

func aFunctionThatDoesntHaveArgumentLabels(_ anInt: Int, aString: String){
}

aFunctionThatReturnsStuff()
aFunctionThatDoesntHaveArgumentLabels(3, aString: "hello") // underscore doesn't label the variable
aFunction(anInt: 3, aString: "cooL")

func negate(number: Int) -> Int? {
    if number > 0 {
        return number * -1
    }
    else if number < 0 {
        return number
    }
    return nil
}

let number = -1
let result = negate(number: number)
if let unwrappedResult = result {
    unwrappedResult
}

/** CLASSES */
class Person {
    
    var name: String
    var gender: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
    }
    
    func description() -> String {
        return "Hi, my name is \(name)"
    }
    
}

let celine = Person(name: "Celine", gender: "Female")
celine.name
celine.gender
celine.description()

class Dan: Person {
    // inherits from person class
    
    var courses:[String] = [String]()
    
    init() {
        super.init(name: "Dan", gender: "male")
    }
    
    func sayHello(){
        print("DAAMN DANIEL")
    }
}

let daniel = Dan()
daniel.name
daniel.sayHello()
daniel.description()
daniel.courses
daniel.courses.append("AppDev")
daniel.courses.append("CS3110")

/** FOR LOOPS */
for course in daniel.courses {
    print(course)
}

