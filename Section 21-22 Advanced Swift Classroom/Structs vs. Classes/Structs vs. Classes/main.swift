//
//  main.swift
//  Structs vs. Classes
//
//  Created by malakoipechyva on 24.12.20.
//

import Foundation

var hero = ClassHero(name: "Iron Man", universe: "Marvel")

var anotherMarvelHero = hero
anotherMarvelHero.name = "The Hulk"

print("hero name = \(hero.name)")
print("anotherMarvelHero name = \(anotherMarvelHero.name)")

