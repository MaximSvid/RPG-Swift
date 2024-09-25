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
    
    func checkIfAlive() {
           if HP <= 0 {
               isLive = false
//               print("💔 Alas, \(name) has fallen. They are no longer among the living.")
           }
       }
    
    //protocol
    func attckWithWeapon (hero: Hero) {
        let damage = 35
        var attack = hero.HP - damage
        print("💫 \(name) launches a fierce attack on \(hero.name), causing \(damage) damage. \(hero.name) has \(hero.HP) HP left.")
    }
    
    
    //функция атаки на всех героев
    func attackOnAllHeroes(heroes: [Hero]) {
        let damage = 50
        for hero in heroes {
            hero.HP -= damage
            print("🔥 \(name) launches a fierce attack on \(hero.name), inflicting \(damage) damage. \(hero.name) is left with \(hero.HP) health!")
        }
    }
    
    //метод лечения
    func treatment(enemy: Enemy)  {
        var treatment = enemy.HP * 2
        print("🌱 \(enemy.name) utilized a healing treatment to regain vitality!")
    }
    
    //attack on all Heroes (50%)
    func dangerousAttackOnAllHeroes(heroes: [Hero])  {
        let damage = 120
        for hero in heroes {
            let success = Bool.random() // true or false
            if success {
                hero.HP -= damage
                print("🔥 \(hero.name) was struck by a fierce blow, losing \(damage) health points. \(hero.name) now stands at \(hero.HP) HP.")
            } else {
                print("💨 \(hero.name) skillfully evaded the dangerous attack, sustaining no damage!")
            }
        }
    }
}

