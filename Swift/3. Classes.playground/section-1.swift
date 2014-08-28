// Playground - noun: a place where people can play

import UIKit

// MARK: Classes

// Classes define the 'blueprint' for an object
class Vehicle {
    
    var colour: String?
    var maxSpeed = 80
        
    func description() -> String {
        return "A \(self.colour) vehicle"
    }
    
    func travel() {
        println("Travelling at \(maxSpeed) kph")
    }
}

var redVehicle = Vehicle()
redVehicle.colour = "Red"
redVehicle.maxSpeed = 90
redVehicle.travel() // prints "Travelling at 90 kph"
redVehicle.description() // = "A Red vehicle"

// MARK: Inheritance

// Classes can inherit from other classes


class Car: Vehicle {
    // Inherited classes can override functions
    override func description() -> String  {
        var description = super.description()
        return description + ", which is a car"
    }
}

// MARK: Initialisers

// Classes have a special 'init' function
class Motorcycle : Vehicle {
    var manufacturer : String
    
    override func description() -> String  {
        return "A \(colour) \(manufacturer) bike"
    }
    
    // By the end of the init function, all variables that are not optional must have a value
    init(manufacturer: String = "No-Name Brand™")  {
        self.manufacturer = manufacturer
        
        // The superclass' init function must be called after all properties defined in this subclass have a value
        super.init()
        
        self.colour = "Blue"
        
    }
    
    // 'convenience' init functions let you set up default values, and must call the main init method first
    convenience init (colour : String) {
        self.init()
        self.colour = colour
    }
}

var firstBike = Motorcycle(manufacturer: "Yamaha")
firstBike.description() // = "A Blue Yamaha bike"

var secondBike = Motorcycle(colour: "Red")
secondBike.description() // = "A Red No-Name Brand™ bike"

// MARK: Properties

// Properties can be simple stored variables
class SimplePropertyExample {
    var number: Int = 0
}
var test1 = SimplePropertyExample()
test1.number = 2

// MARK: Computed properties

// Properties can be computed
class Rectangle {
    var width: Double = 0.0
    var height: Double = 0.0
    var area : Double {
        // computed getter
        get {
            return width * height
        }
        
        // computed setter
        set {
            // Assume equal dimensions (ie a square)
            width = sqrt(newValue)
            height = sqrt(newValue)
        }
    }
}

var rect = Rectangle()
rect.width = 3.0
rect.height = 4.5
rect.area // = 13.5
rect.area = 9 // width & height now both 3.0

// MARK: Property observers

// You can run code when a property changes
class PropertyObserverExample {
    var number : Int = 0 {
        willSet(newNumber) {
            println("About to change to \(newNumber)")
        }
        didSet(oldNumber) {
            println("Just changed from \(oldNumber) to \(self.number)!")
        }
    }
}

var observer = PropertyObserverExample()
observer.number = 4
// prints "About to change to 4", then "Just changed from 0 to 5!"

// MARK: Lazy properties

// Properties can be made 'lazy': they aren't set up until they're first called

class SomeExpensiveClass {
    init(id : Int) {
        println("Expensive class \(id) created!")
    }
}

class LazyPropertyExample {
    var expensiveClass1 = SomeExpensiveClass(id: 1)
    // note that we're actually constructing a class,
    // but it's labelled as lazy
    lazy var expensiveClass2 = SomeExpensiveClass(id: 2)
    
    
    init() {
        println("First class created!")
    }
}

var lazyExample = LazyPropertyExample() // prints "Expensive class 1 created", then "First class created!"
lazyExample.expensiveClass1 // prints nothing, it's already created
lazyExample.expensiveClass2 // prints "Expensive class 2 created!"


// MARK: Protocols

// Protocols are lists of methods and properties that classes can contain


protocol Blinking {
    
    // This property must be (at least) gettable
    var isBlinking : Bool { get }
    
    // This property must be gettable and settable
    var blinkSpeed: Double { get set }
    
    // This function must exist, but what it does is up to the implementor
    func startBlinking(blinkSpeed: Double) -> Void
}

class Light : Blinking {
    var isBlinking: Bool = false
    
    var blinkSpeed : Double = 0.0
    
    func startBlinking(blinkSpeed : Double) {
        println("I am now blinking")
        isBlinking = true
        self.blinkSpeed = blinkSpeed
    }
}

var aBlinkingThing : Blinking?
// can be ANY object that has the Blinking protocol

aBlinkingThing = Light()
aBlinkingThing!.startBlinking(4.0) // prints "I am now blinking"
aBlinkingThing!.blinkSpeed // = 4.0

// MARK: Extensions

// Types can be extended to include new properties and methods

extension Int {
    var doubled : Int {
        return self * 2
    }
    func multiplyWith(anotherNumber: Int) -> Int {
        return self * anotherNumber
    }
}

2.doubled // = 4
4.multiplyWith(32) // = 128


// Types can also be made to conform to a protocol
extension Int : Blinking {
    var isBlinking : Bool {
        return false;
    }
    
    var blinkSpeed : Double {
        get {
            return 0.0;
        }
        set {
            // Do nothing
        }
    }
    
    func startBlinking(blinkSpeed : Double) {
        println("I am the integer \(self). I do not blink.")
    }
}
2.isBlinking // = false
2.startBlinking(2.0) // prints "I am the integer 2. I do not blink."

// MARK: Access control

// This class is visible to everyone

public class AccessControl {
    
    // Accessible to this module only
    // 'internal' here is the default and can be omitted
    internal var internalProperty = 123
        
    // Accessible to everyone
    public var publicProperty = 123
        
    // Only accessible in this source file
    private var privateProperty = 123
        
    // The setter is private, so other files can't modify it
    private(set) var privateSetterProperty = 123
}


// MARK: Interoperating with Objective-C

// Creating Objective-C objects
var view = UIView(frame: CGRect(x: 0,y: 0,width: 100,height: 100))

// Working with Objective-C properties
view.bounds

// Calling Objective-C methods
view.pointInside(CGPoint(x: 20, y: 20), withEvent:nil) // = true

// MARK: Modules

import AVFoundation

