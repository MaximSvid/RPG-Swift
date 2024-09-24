//
//  WarriorOpponent.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class WarriorOpponent: Enemy {
    
    init(name: String, HP: Int, attack: Int, isLive: Bool) {
        super.init(name: name, HP: HP, attack: attack, isLive: Bool)
    }
    
    func warriorOpponentAttack (hero: Hero) {
        let damage = 40
        var attack = opponent.HP - damage
        print("\(name) attacked \(hero.name) and did \(damage) damage to him. \(hero.name) has \(hero.HP) health left.")
    }
    
    //?
    func dangerousOpponentAttack(heroes: [Hero])  {
        let damage = 60
        let singleAttackTarget = heroes.randomElement() // Select a random hero for the attack
        let hitAll = Int.random(in: 1...100) <= 20 // 20% chance to attack all heroes
        
        // Attack a single hero
        if let oneHero = singleAttackTarget {
            oneHero.HP -= damage
            print("\(oneHero.name) was hit by the dangerous attack and took \(damage) damage. \(oneHero.name) now has \(oneHero.HP) HP left.")
        }
        
        // 20% chance to attack all heroes
        if hitAll {
            print("The dangerous attack hits all heroes!")
            for hero in heroes {
                hero.HP -= damage
                print("\(hero.name) took \(damage) damage. \(hero.name) now has \(hero.HP) HP left.")
            }
        }
    }
}

