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
