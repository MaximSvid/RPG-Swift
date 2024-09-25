//
//  Helden.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class Hero: AttackOnEnemy {
    var name: String
    var HP: Int
    var attack: Int
    var maxHP: Int
    var isLive: Bool = true
    var state: HeroState = .healthy
    
    init(name: String, HP: Int, maxHP: Int, attack: Int, isLive: Bool) {
        self.name = name
        self.HP = HP
        self.maxHP = maxHP
        self.attack = attack
        self.isLive = isLive
    }
    
    func attackAllEnemies(enemies: [Enemy]) {
        let damage = 50
        for enemy in enemies {
            enemy.HP -= damage
            print("⚔️ \(name) attacked \(enemy.name) and dealt \(damage) damage! 💥 \(enemy.name) has \(enemy.HP) health remaining.")        }
    }
    
    
    // Проверка жизни
    func checkIfAlive() {
        if HP <= 0 {
            isLive = false
            state = .knochedOut  // Устанавливаем состояние в "выбитый"
            print("💔 \(name) is dead and out of the game. State: \(state.description) ⚔️⚔️⚔️")
        } else {
            let healthPercentage = (Double(HP) / Double(maxHP)) * 100  // Вычисляем процент здоровья
            
            if healthPercentage > 50 {
                state = .healthy  // Устанавливаем состояние в "здоров"
                print("✨ \(name) is healthy with \(HP) HP remaining. State: \(state.description) 🌿🌿🌿")
            } else {
                state = .wounded  // Устанавливаем состояние в "ранен"
                print("⚠️ \(name) is wounded with \(HP) HP remaining. State: \(state.description) 🩹🩹🩹")
            }
        }
    }
}
    
