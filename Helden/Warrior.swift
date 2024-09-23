//
//  Krieger.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class Warrior: Hero {
    var dualAttack: Int
    
    
    init(name: String, HP: Int, attack: Int, isLive: Bool, twoAttack: Int) {
        self.dualAttack = dualAttack
        super.init(name: name, HP: HP, attack: attack, isLive: Bool)
    }
    
    func warriorAttack (opponent: Enemy) {
        let damage = 50
        var attack = opponent.HP - damage
        print("\(name) attacked \(opponent.name) and did \(damage) damage to him. \(opponent.name) has \(opponent.HP) health left.")
    }
    
    func dualWarriorAttck (opponent: Enemy) {
        let damage = 50 * 2
        var attack = opponent.HP - damage
        print("\(name) attacked with dual attack \(opponent.name) and did \(damage) damage to him. \(opponent.name) has \(opponent.HP) health left.")
    }
    
    func dangerousAttack(opponent: Enemy)  {
        let damage = 150
        let success = Bool.random() // true or false
        
        if success {
                opponent.HP -= damage
                print("\(opponent.name) was hit by a dangerous attack, taking \(damage) damage. \(opponent.name) now has \(opponent.HP) HP left.")
            } else {
                print("\(opponent.name) dodged the dangerous attack and took no damage.")
            }
        
    }
    
}

