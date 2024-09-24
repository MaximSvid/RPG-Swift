//
//  DoctorOpponent.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class DoctorOpponent: Enemy {
    var superAttackUsed: Bool = false // Свойство для отслеживания, была ли выполнена супер атака
    
    
    init(name: String, HP: Int, attack: Int, isLive: Bool) {
        super.init(name: name, HP: HP, attack: attack, isLive: Bool)
    }
    
    // Супер сильная атака (можно выполнить только один раз за игру)
    func superAttack(target: Hero) {
        if !superAttackUsed {
            let superDamage = 200
            target.HP -= superDamage
            superAttackUsed = true // Устанавливаем флаг, что супер атака была использована
            print("\(name) uses a powerful super attack on \(target.name), dealing \(superDamage) damage! \(target.name) now has \(target.HP) HP left.")
        } else {
            print("\(name) has already used the super attack and cannot use it again.")
        }
    }
    
    // Метод восстановительной атаки
    func healingAttack(target: Hero) {
        let healingAmount = 45
        target.HP += healingAmount
        print("\(name) heals \(target.name) for \(healingAmount) HP. \(target.name) now has \(target.HP) HP.")
    }
    
    func healAllOpponent(opponents: [Enemy]) {
        let recoveryAmount = 30
        for opponent in opponents {
            opponent.HP +=recoveryAmount
            print("\(name) heals \(opponent.name) for \(recoveryAmount) HP, now \(opponent.name) has \(opponent.HP) HP.")
        }
    }
}

