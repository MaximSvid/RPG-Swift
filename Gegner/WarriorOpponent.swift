//
//  WarriorOpponent.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class WarriorOpponent: Enemy {
    
    override init(name: String, HP: Int, attack: Int, isLive: Bool) {
        super.init(name: name, HP: HP, attack: attack, isLive: isLive)
    }
    
    override func attckWithWeapon(hero: Hero) {
        super.attckWithWeapon(hero: hero)
    }
    
    //?
    func dangerousOpponentAttack(heroes: [Hero])  {
        let damage = attack
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
    
    func randomWarriorOpponentAttack (heroes: [Hero]) {
        // Список всех возможных атак
        let attacks: [(Hero) -> Void] = [
            { (hero: Hero) in self.attckWithWeapon(hero: hero) },  // Обычная атака оружием
            { (hero: Hero) in self.dangerousOpponentAttack(heroes: heroes) }, // Опасная атака
        ]
        // Случайный выбор героя и атаки
        if let randomHero = heroes.filter({ (hero: Hero) in hero.HP > 0 }).randomElement() {
            let randomAttack = attacks.randomElement()! // Выбираем случайную атаку
            randomAttack(randomHero) // Применяем выбранную атаку к герою
        }
    }
}


