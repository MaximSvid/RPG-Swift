//
//  Gegner.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class Enemy: AttackOnHeroes {
    var name: String
        var HP: Int
        var attack: Int
        var isLive: Bool = true
    
    init(name: String, HP: Int, attack: Int, isLive: Bool) {
        self.name = name
        self.HP = HP
        self.attack = attack
        self.isLive = isLive
    }
    
    //protocol
    func attckWithWeapon (hero: Hero) {
        let damage = 35
        var attack = hero.HP - damage
        print("\(name) attacked \(hero.name) and did \(damage) damage to him. \(hero.name) has \(hero.HP) health left.")
    }
    
    
    //функция атаки на всех героев
    func attackOnAllHeroes(heroes: [Hero]) {
        let damage = 50
        for hero in heroes {
            hero.HP -= damage
            print("\(name) attacked \(hero.name) and did \(damage) damage to him. \(hero.name) has \(hero.HP) health left.")
        }
    }
    
    //метод лечения
    func treatment(enemy: Enemy)  {
        var treatment = enemy.HP * 2
        print("\(enemy.name) used the treatment.")
    }
    
    //attack on all Heroes (50%)
    func dangerousAttackOnAllHeroes(heroes: [Hero])  {
        let damage = 120
        for hero in heroes {
            let success = Bool.random() // true or false
            if success {
                hero.HP -= damage
                print("\(hero.name) was hit by a dangerous attack, taking \(damage) damage. \(hero.name) now has \(hero.HP) HP left.")
            } else {
                print("\(hero.name) dodged the dangerous attack and took no damage.")
            }
        }
    }
}

