// Playground - noun: a place where people can play

import UIKit

// MARK: Swift Playground

// MARK: -

// MARK: Var vs let
var myVariable = 123
let myConstantVariable = 123


#if os(NOPE)
    myVariable += 5
    
    // (ERROR: can't change a constant variable)
    myConstantVariable += 2
    
#endif


#if os(NOPE)
    
    let someConstant : Int
    // ERROR: constants must contain values when they're declared
    
#endif

#if os(NOPE)
    
    var someVariable : Int
    someVariable += 2
    // ERROR: someVariable doesn't have a value, so can't add 2 to it
    someVariable = 2
    someVariable += 2
    // WORKS, because someVariable has a value to add to
    
#endif


// MARK: Types and casting

// Implicit type of integer
var anInteger = 2


anInteger += 3

anInteger += Int(0.2)

var aFloat = 0.0

aFloat += 0.2

aFloat += 1

#if os(NOPE)
    
    // ERROR: Can't add a string to an integer
    anInteger += "Yes"
    
#endif

#if os(NOPE)
    
    // ERROR: Can't directly convert between types
    let aString = anInteger
    
#endif

// Types can be converted

let aString = String(anInteger)
// = "2"

// MARK: Explicit typing

// Explicit type of integer
let anExplicitInteger : Int = 2

// MARK: Optionals

// Optional integer, allowed to be nil
var anOptionalInteger : Int? = nil
anOptionalInteger = 42


#if os(NOPE)
    
    // Non-optional (regular), NOT allowed to be nil
    var aNonOptionalInteger = 42
    
    aNonOptionalInteger = nil
    // ERROR: only optional values can be nil
    
#endif


if anOptionalInteger != nil {
    println("It has a value!")
} else {
    println("It has no value!")
}



// Optional types must be unwrapped using !
anOptionalInteger = 2
1 + anOptionalInteger! // = 3

anOptionalInteger = nil
// 1 + anOptionalInteger!
// CRASH: anOptionalInteger = nil, can't use nil data



// Optionals can also be declared unwrapped; this means you don't have to unwrap them later, but is unsafe

var unwrappedOptionalInteger : Int!
unwrappedOptionalInteger = 1
1 + unwrappedOptionalInteger // = 2


// MARK: Tuples

var aTuple = (1, "Yes")


// MARK: Arrays


// Array of integers
let arrayOfIntegers : [Int] = [1,2,3]



// Type of array is implied
let implicitArrayOfIntegers = [1,2,3]



// Can also create an empty array, but you have to provide the type
var anotherArray = [Int]()


// Arrays can be immutable, like all other types

let immutableArray = [42,24]


// Adding values to arrays

var myArray = [1,2,3]
myArray.append(4)
// = [1,2,3,4]


// Getting the number of items in an array

myArray.count
// = 4


// Inserting values in arrays

myArray.insert(5, atIndex: 0)
// = [5,1,2,3,4]
// END

// Removing items from arrays

myArray.removeAtIndex(4)
// = [5,1,2,3]


// Reversing an array

myArray.reverse()
// = [3,2,1,5]


// MARK: Dictionaries

// Creating a dictionary of string keys and string values

var crew = [
    "Captain": "Jean-Luc Picard",
    "First Officer": "William Riker",
    "Second Officer": "Data"
];


// Retrieving values from a dictionary

crew["Captain"]
// = "Jean-Luc Picard"


// Setting values in a dictionary

crew["Intern"] = "Wesley Crusher"


// Dictionaries can contain any type

// This dictionary uses integers for both keys and values
var aNumberDictionary = [1: 2]
aNumberDictionary[21] = 23


// MARK: If
// Flow control (loops, if)


if 1+1 == 2 {
    "The math checks out"
}


// MARK: For-in with collections

var loopingArray = [1,2,3,4,5]
var loopSum = 0
for number in loopingArray {
    loopSum += number
}
loopSum // = 15

// MARK: For-in with ranges

var firstCounter = 0
for index in 1 ..< 10 {
    firstCounter++
}
// Loops 9 times

"Looped \(firstCounter) times"

var secondCounter = 0
for index in 1 ... 10 { // note the three dots, not two
    secondCounter++
}
// Loops 10 times

"Looped \(secondCounter) times"

// MARK: For-condition-increment loop

var sum = 0
for var i = 0; i < 3; i++ {
    sum += 1
}
sum // = 3


// MARK: While loop

var countDown = 5
while countDown > 0 {
    countDown--
}
countDown // = 0


// MARK: Do-while loop

var countUp = 0
do {
    countUp++
} while countUp < 5
countUp // = 5


// MARK: If-let to unwrap conditions

var conditionalString : String? = "a string"

if let theString = conditionalString? {
    "The string is \(theString)"
} else {
    "The string is nil"
}


// MARK: Switches

// Switching on an integer

let integerSwitch = 3

switch integerSwitch {
case 0:
    "It's 0"
case 1:
    "It's 1"
case 2:
    "It's 2"
default: // note: default is mandatory if not all cases are covered (or can be covered)
    "It's something else"
}


// MARK: Switching on a string

let stringSwitch = "Hello"

switch stringSwitch {
case "Hello":
    "A greeting"
case "Goodbye":
    "A farewell"
default:
    "Something else"
}


// MARK: Switching on a tuple

let tupleSwitch = ("Yes", 123)

switch tupleSwitch {
case ("Yes", 123):
    "Tuple contains 'Yes' and '123'"
case ("Yes", _):
    "Tuple contains 'Yes' and something else"
default:
    break
}


// MARK: Switching on a range

var someNumber = 15

switch someNumber {
case 0...10:
    "Number is between 0 and 10"
case 11...20:
    "Number is between 11 and 20"
default:
    "Number is something else"
}
