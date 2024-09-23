//
//  Archer.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//
class Archer: Hero {
    var shadow: Bool
    
    init(name: String, HP: Int, attack: Int, isLive: Bool, shadow: Bool) {
        self.shadow = shadow
        super.init(name: name, HP: HP, attack: attack, isLive: Bool)
    }
    
    //test
    func archerInShadow() -> Bool {
        // Возвращаем состояние shadow
        return shadow
    }
    //test
    func takeDamage(incomingAttack: Int) -> Int {
        // Если лучник в тени, игнорируем атаку
        if archerInShadow() {
            print("\(name) is in shadow and dodges the attack!")
            return 0 // Возвращаем 0 урона
        } else {
            // Если не в тени, наносим урон
            print("\(name) takes \(incomingAttack) damage.")
            HP -= incomingAttack
            return incomingAttack
        }
    }
    
    
    //атака на всех противников
    func attackOnAllOpponent (opponents: [Enemy]) {
        let damage = 40
        for opponent in opponents {
            opponent.HP -= damage
            print("\(name) attacked \(opponent.name) and did \(damage) damage to him. \(opponent.name) has \(opponent.HP) health left.")
        }
    }
    
    func sharpArrow (opponents: Enemy) {
        let damage = 60
        opponents.HP -= damage
        print("\(opponent.name) was hit by a sharp arrow, taking \(damage) damage. \(opponent.name) now has \(opponent.HP) HP left.")
        
    }
}
