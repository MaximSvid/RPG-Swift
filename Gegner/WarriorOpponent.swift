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
            print("💣 \(oneHero.name) was caught off guard by a dangerous blow, taking \(damage) damage! \(oneHero.name) now has \(oneHero.HP) HP remaining.".warriorOpponentBorder())
            print("-----------------------------------------------------")
        }
        
        // 20% chance to attack all heroes
        if hitAll {
            print("⚔️ A menacing attack strikes all heroes in its path!".warriorOpponentBorder())
            print("-----------------------------------------------------")
            for hero in heroes {
                hero.HP -= damage
                print("🥴 \(hero.name) received a hit, losing \(damage) health! Current HP: \(hero.HP).".warriorOpponentBorder())            }
        }
        print("-----------------------------------------------------")
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
    
    
    func chooseAttackWarriorOpponent(hero: Hero, heroes: [Hero], bag: EnemyBag) {
        print("\n🔪 \(name) is preparing to attack! Choose an action:".warriorOpponentBorder())
        print("[1] ⚔️ Basic Attack")
        print("[2] ⚔️ Dangerous Attack")
        
        // Проверяем наличие зелий в рюкзаке перед добавлением опции использования зелий
        if bag.healingAllEnemy > 0 || bag.plusPowerOnAllEnemy > 0 {
            print("[3] 🎒 Use Bag")
        }
        
        if let choice = readLine() {
            switch choice {
            case "1":
                attckWithWeapon(hero: hero)
            case "2":
                dangerousOpponentAttack(heroes: heroes)
            case "3":
                useBag(bag: bag) // Убираем opponent, чтобы использовать bag только
            default:
                print("🚫 Invalid choice. Please choose again.")
                chooseAttackWarriorOpponent(hero: hero, heroes: heroes, bag: bag) // Повторный вызов для нового выбора
            }
        }
    }
    
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


