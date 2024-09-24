//
//  ArcherOpponent.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class ArcherOpponent: Enemy {
    
    
    override init(name: String, HP: Int, attack: Int, isLive: Bool) {
        super.init(name: name, HP: HP, attack: attack, isLive: isLive)
    }
    
    //protocol
    override func attckWithWeapon(hero: Hero) {
        super.attckWithWeapon(hero: hero)
    }
    
    
    //атака на всех противников
     func attackOnHeroes (heroes: [Hero]) {
         let damage = attack
        for hero in heroes {
            hero.HP -= damage
            print("\(name) attacked \(hero.name) and did \(damage) damage to him. \(hero.name) has \(hero.HP) health left.")
        }
    }
    
    func sharpArrowOpponent (hero: Hero) {
        let damage = attack * 2
        hero.HP -= damage
        print("\(hero.name) was hit by a sharp arrow, taking \(damage) damage. \(hero.name) now has \(hero.HP) HP left.")
        
    }
    
    
    //?
//    func iceArrow(target: Hero)  {
//        let damage = 30
//        isFreeze = true
//        
//    }
    
    
}

