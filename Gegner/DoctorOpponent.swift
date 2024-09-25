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
                ⚡️ \(name) is using Super Attack on \(target.name)! ⚡️
                Damage: \(superDamage)
                \(target.name) now has \(target.HP) HP.
                """)
        } else {
            print("""
                ❌ \(name) can no longer use Super Attack, as all attempts have been exhausted! ❌
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
                    print("⚡️ \(self.name) cannot use the super attack, as all super attacks have already been exhausted! ❌")
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
    
    func chooseAttackDoctorOpponent(hero: Hero, heroes: [Hero], opponents: [Enemy], bag: EnemyBag) {
        print("\n🔪 \(name) is preparing to attack! Choose an action:")
        print("[1] ⚔️ Basic Attack")
        print("[2] ⚡️ Super Attack (available \(superAttackUsed) times)")
        print("[3] 💉 Heal All") // Option to heal all opponents
        
        // Check for potions in the bag before adding the option to use items
        if bag.healingAllEnemy > 0 || bag.plusPowerOnAllEnemy > 0 {
            print("[4] 🎒 Use Bag")
        }
        
        if let choice = readLine() {
            switch choice {
            case "1":
                print("⚔️ \(name) uses Basic Attack on \(hero.name)!")
                attckWithWeapon(hero: hero)
            case "2":
                print("⚡️ \(name) chooses Super Attack on \(hero.name)!")
                superAttack(target: hero)
            case "3":
                print("💉 \(name) chooses to heal all opponents!")
                healAllOpponents(opponents: opponents) // Heal all opponents
            case "4":
                useBag(bag: bag) // Using the bag
            default:
                print("🚫 Invalid choice. Please choose again.")
                chooseAttackDoctorOpponent(hero: hero, heroes: heroes, opponents: opponents, bag: bag) // Repeat call for a new choice
            }
        }
    }
        
        // Использование предметов из рюкзака
        func useBag(bag: EnemyBag) {
            print("\n🎒 Choose an item to use:")
            
            if bag.healingAllEnemy > 0 {
                print("[1] 💊 Use Healing Potion")
            }
            
            if bag.plusPowerOnAllEnemy > 0 {
                print("[2] ⚡ Use Strength Potion")
            }
            
            // Если оба зелья закончились
            if bag.healingAllEnemy == 0 && bag.plusPowerOnAllEnemy == 0 {
                print("🚫 No potions available to use!")
                return // Завершаем использование зелья, если их нет
            }
            
            if let choice = readLine() {
                switch choice {
                case "1":
                    if bag.healingAllEnemy > 0 {
                        bag.healAllEnemies(enemies: [self]) // Передаем текущего противника для лечения
                    } else {
                        print("🚫 No healing potions available!")
                        useBag(bag: bag) // Повторный вызов для нового выбора
                    }
                case "2":
                    if bag.plusPowerOnAllEnemy > 0 {
                        bag.boostAttackForAllEnemies(enemies: [self]) // Передаем текущего противника для усиления
                    } else {
                        print("🚫 No strength potions available!")
                        useBag(bag: bag) // Повторный вызов для нового выбора
                    }
                default:
                    print("🚫 Invalid choice. Please choose again.")
                    useBag(bag: bag) // Повторный вызов для нового выбора
                }
            }
        }
}

