//
//  StructWeapen.swift
//  RPG
//
//  Created by Maxim Svidrak on 24.09.24.
//

struct Weapon {
    
    let name: String
        let damage: Int
        let usageFrequency: Int
    
    func doubleAttack ()  {
        let doubleDamage = Int(Double(damage) * 2.2) // Increase damage by 120%
        print("\(name) deals \(doubleDamage) damage! (Critical Hit!)")
    }
    
    //?? Метод для специальной атаки
        func specialAttack() {
            let stunChance = Int.random(in: 1...100) // Вероятность оглушения
            let isStunned = stunChance <= 30 // 30% шанс оглушения
            let damageDealt = Int(Double(damage) * 1.5) // Увеличенный урон для специальной атаки
            print("\(name) performs a special attack, dealing \(damageDealt) damage!")
            if isStunned {
                print("The opponent is stunned!")
            } else {
                print("The opponent is not stunned.")
            }
        }
    
    
    
    
    
    enum WeaponType {
        case sword
        case bow
        case staff
        case axe
    }
    
    
    
}
