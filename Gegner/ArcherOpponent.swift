//
//  ArcherOpponent.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class ArcherOpponent: Enemy {
    
    
    override init(name: String, HP: Int, attack: Int, isLive: Bool) {
        super.init(name: name, HP: HP, attack: attack, isLive: isLive)
    }
    
    //protocol
    override func attckWithWeapon(hero: Hero) {
        super.attckWithWeapon(hero: hero)
    }
    
    
    //атака на всех противников
    func attackOnHeroes (heroes: [Hero]) {
        let damage = attack
        for hero in heroes {
            hero.HP -= damage
            print("🎯 \(name) launched a powerful strike against \(hero.name), dealing \(damage) damage! \(hero.name) now has \(hero.HP) HP remaining.".archerOpponentBorder())
        }
        print("-----------------------------------------------------")
    }
    
    func sharpArrowOpponent (hero: Hero) {
        let damage = attack * 2
        hero.HP -= damage
        print("🏹 \(hero.name) was struck by a sharp arrow, suffering \(damage) damage. They now have \(hero.HP) HP remaining.".archerOpponentBorder())
        print("-----------------------------------------------------")
        
    }
    
    func randomArcherOpponentAttack (heroes: [Hero]) {
        // Список всех возможных атак
        let attacks: [(Hero) -> Void] = [
            { (hero: Hero) in self.attckWithWeapon(hero: hero) },  // Обычная атака оружием
            { (hero: Hero) in self.attackOnHeroes(heroes: heroes) }, // Опасная атака
            { (hero: Hero) in self.sharpArrowOpponent(hero: hero) }, // Опасная атака
        ]
        // Случайный выбор героя и атаки
        if let randomHero = heroes.filter({ (hero: Hero) in hero.HP > 0 }).randomElement() {
            let randomAttack = attacks.randomElement()! // Выбираем случайную атаку
            randomAttack(randomHero) // Применяем выбранную атаку к герою
        }
    }
    
    func chooseAttackArcherOpponent(hero: Hero, heroes: [Hero], bag: EnemyBag) {
        print("\n🔪 \(name) is preparing to attack! Choose an action:".archerOpponentBorder())
        print("[1] ⚔️ Basic Attack")
        print("[2] 🎯 Sharp Arrow Attack")
        print("[3] ⚔️ Attack on All Heroes")
        
        // Проверяем наличие зелий в рюкзаке перед добавлением опции использования зелий
        if bag.healingAllEnemy > 0 || bag.plusPowerOnAllEnemy > 0 {
            print("[4] 🎒 Use Bag")
        }
        
        if let choice = readLine() {
            switch choice {
            case "1":
                attckWithWeapon(hero: hero)
            case "2":
                sharpArrowOpponent(hero: hero)
            case "3":
                attackOnHeroes(heroes: heroes)
            case "4":
                useBag(bag: bag) // Убираем opponent, чтобы использовать bag только
            default:
                print("🚫 Invalid choice. Please choose again.")
                chooseAttackArcherOpponent(hero: hero, heroes: heroes, bag: bag) // Повторный вызов для нового выбора
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

