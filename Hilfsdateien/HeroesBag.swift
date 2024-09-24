//
//  Inventory.swift
//  RPG
//
//  Created by Maxim Svidrak on 24.09.24.
//

class HeroesBag {
    var healing:Int = 4
    var power: Int = 2
    
    init(healing: Int, power: Int) {
        self.healing = healing
        self.power = power
    }
    func useHealing(hero: Hero) {
           if healing > 0 {
               hero.HP *= 2 // Увеличиваем здоровье в 2 раза
               healing -= 1
               print("✨ \(hero.name) used a healing potion! Health has doubled to \(hero.HP) HP! 🌟")
               print("🧪 Remaining healing potions: \(healing)")
           } else {
               print("💔 Oh no! \(hero.name) has no healing potions left! 🚫")
           }
       }
       
       func usePower(hero: Hero) {
           if power > 0 {
               hero.attack = Int(Double(hero.attack) * 1.5) // Увеличиваем атаку на 50%
               power -= 1
               print("⚡ \(hero.name) used a strength potion! Attack increased to \(hero.attack)! 💪")
               print("🧪 Remaining strength potions: \(power)")
           } else {
               print("💔 Oh no! \(hero.name) has no strength potions left! 🚫")
           }
       }}
