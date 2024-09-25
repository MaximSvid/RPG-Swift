//
//  DoctorOpponent.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class DoctorOpponent: Enemy {
    var superAttackUsed: Int = 3 // Свойство для отслеживания, была ли выполнена супер атака
    
    
    override init(name: String, HP: Int, attack: Int, isLive: Bool) {
        super.init(name: name, HP: HP, attack: attack, isLive: isLive)
    }
    
    // Супер сильная атака (можно выполнить только один раз за игру)
    func superAttack(target: Hero) {
        if superAttackUsed > 0 {
            let superDamage = attack * 5
            target.HP -= superDamage
            superAttackUsed -= 1 // Уменьшаем количество доступных супер атак
            
            print("""
            ⚡️ \(name) использует Супер Атаку на \(target.name)! ⚡️
            Урон: \(superDamage)
            \(target.name) теперь имеет \(target.HP) HP.
            """)
        } else {
            print("""
            ❌ \(name) больше не может использовать Супер Атаку, так как все попытки исчерпаны! ❌
            """)
        }
    }
    
    
    override func attckWithWeapon(hero: Hero) {
        super.attckWithWeapon(hero: hero)
    }
    
    func healAllOpponents(opponents: [Enemy]) {
        let recoveryAmount = 30
        for opponent in opponents {
            opponent.HP += recoveryAmount // Исправлено, чтобы правильно увеличивать HP
            print("\(name) heals \(opponent.name) for \(recoveryAmount) HP, now \(opponent.name) has \(opponent.HP) HP.")
        }
    }
    
    func randomDoctorOpponentAttack(heroes: [Hero], opponents: [Enemy]) {
        // Список всех возможных атак
        let attacks: [(Hero) -> Void] = [
            { (hero: Hero) in
                if self.superAttackUsed > 0 {
                    self.superAttack(target: hero) // Супер атака на героя
                } else {
                    print("\(self.name) не может использовать супер атаку, так как все супер атаки уже использованы!")
                    self.attckWithWeapon(hero: hero) // Выполняем обычную атаку
                }
            },
            { (hero: Hero) in self.attckWithWeapon(hero: hero) } // Обычная атака с оружием
        ]
        
        // Случайный выбор героя для атаки
        if let randomHero = heroes.filter({ $0.HP > 0 }).randomElement() {
            for _ in 1...2 { // Две случайные атаки
                let randomAttack = attacks.randomElement()! // Выбираем случайную атаку
                randomAttack(randomHero) // Применяем выбранную атаку к герою
            }
        }
        
        // Исцеление всех противников, если это необходимо
        if opponents.count > 0 {
            healAllOpponents(opponents: opponents) // Исцеление всех противников
        }
    }
}

