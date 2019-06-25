//: Playground - noun: a place where people can play

import UIKit

struct Planet {
    var name: String
    var distanceFromSun: Double
}

let planets = [
    Planet(name: "Mercury", distanceFromSun: 0.387),
    Planet(name: "Venus", distanceFromSun: 0.722),
    Planet(name: "Earth", distanceFromSun: 1.0),
    Planet(name: "Mars", distanceFromSun: 1.52),
    Planet(name: "Jupiter", distanceFromSun: 5.20),
    Planet(name: "Saturn", distanceFromSun: 9.58),
    Planet(name: "Uranus", distanceFromSun: 19.2),
    Planet(name: "Neptune", distanceFromSun: 30.1)
]

let result1 = planets.map { $0.name }
result1
let result2 = planets.reduce(0) { $0 + $1.distanceFromSun }
result2

let cast = ["Vivien", "Marlon", "Kim", "Karl"]
let lowercaseNames = cast.map { $0.lowercased() }
lowercaseNames