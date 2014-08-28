// Playground - noun: a place where people can play

import UIKit

// MARK: -

// MARK: Functions

// Defining a function with no parameters and no return
func firstFunction() {
    println("Hello!")
}
firstFunction()

// MARK: Functions with returns

// Defining a function that returns a value
func secondFunction() -> Int {
    return 123
}
secondFunction()

// MARK: Functions with parameters

// Defining a function that takes parameters
func thirdFunction(firstValue: Int, secondValue: Int) -> Int {
    return firstValue + secondValue
}
thirdFunction(1, 2)

// MARK: Functions returning tuple

// Functions can return multiple values, using a tuple
func fourthFunction(firstValue: Int, secondValue: Int) -> (doubled: Int, quadrupled: Int) {
    return (firstValue * 2, secondValue * 4)
}
fourthFunction(2, 4)

// If a returned tuple has named components (which is optional), you can refer
// to those components by name:
// Accessing by number:
fourthFunction(2, 4).1 // = 16
// Same thing but with names:
fourthFunction(2, 4).quadrupled // = 16

// MARK: External parameter names

// Function parameters can be given names
func addNumbers(firstNumber num1 : Int, toSecondNumber num2: Int) -> Int {
    return num1 + num2
}

addNumbers(firstNumber: 2, toSecondNumber: 3) // = 5

// You can shorthand this by adding a #
func multiplyNumbers(#firstNumber: Int, #multiplier: Int) -> Int {
    return firstNumber * multiplier
}
multiplyNumbers(firstNumber: 2, multiplier: 3) // = 6

// MARK: Default values

// Function parameters can have default values, as long as they're at the end
func multiplyNumbers2 (firstNumber: Int, multiplier: Int = 2) -> Int {
    return firstNumber * multiplier;
}
// Parameters with default values can be omitted
multiplyNumbers2(2) // = 4

// MARK: Variable parameters

// Functions can receive a variable number of parameters
func sumNumbers(numbers: Int...) -> Int {
    // in this function, 'numbers' is an array of Ints
    var total = 0
    for number in numbers {
        total += number
    }
    return total
}
sumNumbers(2,3,4,5) // = 14

// MARK: inout parameters

// Functions can change the value of variables that get passed to them using 'inout'
func swapValues(inout firstValue: Int, inout secondValue: Int) {
    let tempValue = firstValue
    firstValue = secondValue
    secondValue = tempValue
}

var swap1 = 2
var swap2 = 3
swapValues(&swap1, &swap2)
swap1 // = 3
swap2 // = 2


// MARK: Closures and Function Types

// Functions can be stored in variables
var numbersFunc: (Int, Int) -> Int;
// numbersFunc can now store any function that takes two ints and returns an int
numbersFunc = addNumbers
numbersFunc(2, 3) // = 5

// MARK: Functions as parameters

// Functions can receive other functions as parameters
func timesThree(number: Int) -> Int {
    return number * 3
}

func doSomethingToNumber(aNumber: Int, thingToDo: (Int)->Int) -> Int {
    // call the function 'thingToDo' using 'aNumber', and return the result
    return thingToDo(aNumber);
}

doSomethingToNumber(4, timesThree) // = 12

// MARK: Returning functions from functions

// Functions can return other functions
func createAdder(numberToAdd: Int) -> (Int) -> Int {
    func adder(number: Int) -> Int {
        return number + numberToAdd
    }
    return adder
}
var addTwo = createAdder(2)
addTwo(2) // = 4

// MARK: Capturing values in internal functions

// Functions can 'capture' values
func createIncrementor(incrementAmount: Int) -> () -> Int { // <1>
    var amount = 0 // <2>
    func incrementor() -> Int { // <3>
        amount += incrementAmount // <4>
        return amount
    }
    return incrementor // <5>
}

var incrementByTen = createIncrementor(10) // <6>
incrementByTen() // = 10 <7>
incrementByTen() // = 20

var incrementByFifteen = createIncrementor(15) // <8>
incrementByFifteen() // = 15 <9>

// MARK: Closures

// You can write short, anonymous functions called 'closures'
var numbers = [2,1,56,32,120,13]

var numbersSorted = sorted(numbers, { (n1: Int, n2: Int) -> Bool in
    // Sort so that small numbers go before large numbers
    return n2 > n1
}) // = [1, 2, 13, 32, 56, 120]

// The types of parameters and the return type can be inferred
var numbersSortedReverse = sorted(numbers, {n1, n2 in
    return n1 > n2
}) // = [120, 56, 32, 13, 2, 1]

// If you don't care about the names of the parameters, use $0, $1, etc
// Also, if there's only a single line of code in the closure you can omit the 'return'
var numbersSortedAgain = sorted(numbers, {
    $1 > $0
}) // = [1, 2, 13, 32, 56, 120]

// If the last parameter of a function is a closure, you can put the braces outside the parentheses
var numbersSortedReversedAgain = sorted(numbers) {
    $0 > $1
} // = [120, 56, 32, 13, 2, 1]

// Closures can be stored in variables and used like functions
var comparator = {(a: Int, b:Int) in a < b}
comparator(1,2) // = true

var sortingInline = [2, 5, 98, 2, 13]
sort(&sortingInline)
sortingInline // = [2, 2, 5, 13, 98]

