//
//  DoctorOpponent.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class DoctorOpponent: Enemy {
    
    init(name: String, HP: Int, attack: Int, isLive: Bool) {
        super.init(name: name, HP: HP, attack: attack, isLive: Bool)
    }
    
    // Метод восстановительной атаки
        func healingAttack(target: Hero) {
            let healingAmount = 45
            target.HP += healingAmount
            print("\(name) heals \(target.name) for \(healingAmount) HP. \(target.name) now has \(target.HP) HP.")
        }
}

