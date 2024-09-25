//
//  EnemyBag.swift
//  RPG
//
//  Created by Maxim Svidrak on 24.09.24.
//

class EnemyBag {
    var healingAllEnemy: Int
    var plusPowerOnAllEnemy: Int
    
    init(healingAllEnemy: Int, plusPowerOnAllEnemy: Int) {
            self.healingAllEnemy = healingAllEnemy
            self.plusPowerOnAllEnemy = plusPowerOnAllEnemy
        }
    
    func healAllEnemies(enemies: [Enemy]) {
        if healingAllEnemy > 0 {
            for enemy in enemies {
                enemy.HP += 40
                print("🩸 \(enemy.name) has been healed for 40 HP! Current HP: \(enemy.HP) HP! 💀")
            }
            healingAllEnemy -= 1
            print("💊 All enemies have been healed! Remaining healing potions: \(healingAllEnemy) 🩸")
        } else {
            print("🚫 No healing potions left for the enemies! 💔")
        }
    }
    
    func boostAttackForAllEnemies(enemies: [Enemy]) {
        if plusPowerOnAllEnemy > 0 {
            for enemy in enemies {
                let oldAttack = enemy.attack
                enemy.attack = Int(Double(enemy.attack) * 1.2) // Увеличиваем атаку на 20%
                print("⚔️ \(enemy.name) has gained power! Attack increased from \(oldAttack) to \(enemy.attack)! 💥")
            }
            plusPowerOnAllEnemy -= 1
            print("💪 All enemies have received power boost! Remaining strength potions: \(plusPowerOnAllEnemy) ⚔️")
        } else {
            print("🚫 No power potions left for the enemies! 💔")
        }
    }
}
