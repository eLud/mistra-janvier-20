import UIKit //framework graphique iOS

// var pour variable
var str = "Hello, playground"
str = "Hello World"

// let pour constante
let firstName = "Ludovic"
var age = 33
age = 34
age = 35

age = Int(33.4)

var height: Float = 1.83

let presentation = "Je m'appelle \(firstName) et j'ai \(age) ans"
print(presentation)



//: # Structures

struct Cat {
    let name: String
    var age: Int

    func eat(_ food: String, at hour: Int) {
        print("Je mangerais \(food) à \(hour)h")
    }
}

class Animal {
    let name: String
    var age: Int

    // Constructeur / initialiseur
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    init() {
        name = "Médor"
        age = 0
    }

    func eat(_ food: String, at hour: Int) {
        print("Je mangerais \(food) à \(hour)h")
    }
}
class Dog: Animal {
    var color: String = "Brown"
}


var monChat = Cat(name: "Félix", age: 3)
var deuxiemeChat = monChat

deuxiemeChat.age = 4
monChat.age

monChat.eat("Croquette", at: 3)

var monChien = Dog(name: "Médor", age: 5)
var deuxiemeChien = monChien

deuxiemeChien.age = 6
monChien.age

struct Contact {


}



var test = ["A", "B", "C"]
test.append("D")
test.index(after: 2)
test.index(before: 2)

let tabVide: [[String]] = []
let tabVide2 = [String]()
let tabVide3 = Array<Array<String>>()

let dicoVide: [String:Int] = [:]
let dicoVide2 = [String:Int]()
var dicoVide3 = Dictionary<String, Int>()

test = []

let anyArray = ["Hello", 45, 98.9, true] as [Any]


var cities = Set<String>()
cities.insert("Paris")
cities.insert("Marseille")
let isInserted = cities.insert("Paris")

cities.count


struct Point {
    var x: Float
    var y: Float
}

struct Size {
    var width: Float
    var height: Float
}

struct Rect {
    var origin: Point
    var size: Size

    //Computed property
    var center: Point {
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }

        set {
            let originX = newValue.x - size.width / 2
            let originY = newValue.y - size.height / 2
            origin = Point(x: originX, y: originY)
        }
    }
}

var carré = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
carré.origin
carré.center
carré.center = Point(x: 10, y: 10)

carré.origin


guard cities.isEmpty == false else {
    fatalError()
}

print("Cities n'est pas vide")


let capitales = ["France" : "Paris", "USA" : "Washington", "Canada" : "Ottawa"]

let capFrance: String? = capitales["France"]
print(capFrance)

let capAllemagne: Optional<String> = capitales["Allemagne"]
print(capFrance)

//Unwrapping

// Force unwrap (!) : crash si optional == nil
//print(capFrance!)
//print(capAllemagne!)

//Optional binding : teste l'optional, et deballe si possible
if let capFrance = capitales["Allemagne"] {
    print(capFrance)
} else {
    print("Je ne connais pas cette capitale")
}

guard let capCanada = capitales["Canada"] else { fatalError() }
capCanada

// Nil coalescing operator (??) / valeur par défaut
let capUSA = capitales["USA"] ?? "Je ne sais pas"
