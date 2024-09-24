//
//  ArcherOpponent.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class ArcherOpponent: Enemy {
    var isFreeze: Bool = false
    
    init(name: String, HP: Int, attack: Int, isLive: Bool, isFreeze: Bool) {
        self.isFreeze = isFreeze
        super.init(name: name, HP: HP, attack: attack, isLive: isLive)
    }
    
    //атака на всех противников
    override func attackOnAllHeroes (heroes: [Hero]) {
        let damage = 50
        for hero in heroes {
            hero.HP -= damage
            print("\(name) attacked \(hero.name) and did \(damage) damage to him. \(hero.name) has \(hero.HP) health left.")
        }
    }
    
    func sharpArrowOpponent (hero: Hero) {
        let damage = 70
        hero.HP -= damage
        print("\(hero.name) was hit by a sharp arrow, taking \(damage) damage. \(hero.name) now has \(hero.HP) HP left.")
        
    }
    
    
    //?
    func iceArrow(target: Hero)  {
        let damage = 30
        isFreeze = true
        
    }
    
    
}

