//
//  Archer.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//
class Archer: Hero {
    var shadow: Int = 2
    
    init(name: String, HP: Int, attack: Int, isLive: Bool, shadow: Int) {
        self.shadow = shadow
        super.init(name: name, HP: HP, attack: attack, isLive: isLive)
    }
    
    //test
    func archerInShadow() -> Bool {
        // Возвращаем состояние shadow
        return shadow > 0
    }
    //test
    func takeDamage(incomingAttack: Int) -> Int {
        // Если лучник в тени, игнорируем атаку
        if archerInShadow() {
            print("\(name) is in shadow and dodges the attack!")
            return 0 // Возвращаем 0 урона
        } else {
            // Если не в тени, наносим урон
            print("\(name) takes \(incomingAttack) damage.")
            HP -= incomingAttack
            return incomingAttack
        }
    }
    
    
    //атака на всех противников
    override func attackAllEnemies(enemies: [Enemy]) {
        super.attackAllEnemies(enemies: enemies)
    }
    
    
    func sharpArrow(opponent: Enemy) { // Изменено на opponent
        let damage = attack
        opponent.HP -= damage // Используем opponent вместо opponents
        print("\(opponent.name) was hit by a sharp arrow, taking \(damage) damage. \(opponent.name) now has \(opponent.HP) HP left.")
    }
    
    func chooseAttackArcher(opponent: Enemy, enemies: [Enemy], bag: HeroesBag) {
        print("\n🏹 \(name) is preparing to attack! Choose an action:") 
        print("[1] 🌪️ Rain of Arrows on All Enemies")
        print("[2] 🏹 Sharp Arrow")
        print("[3] 🌑 Archer in Shadow")
        
        // Проверяем наличие зелий в рюкзаке перед добавлением опции использования зелий
        if bag.healing > 0 || bag.power > 0 {
            print("[4] 🎒 Use Bag")
        }
        
        if let choice = readLine() {
            switch choice {
            case "1":
                attackAllEnemies(enemies: enemies) // Теперь вы передаете массив enemies
            case "2":
                sharpArrow(opponent: opponent)
            case "3":
                if archerInShadow() { // Здесь вы просто проверяете условие
                    print("\(name) is in shadow and prepares for a dangerous attack!")
                    // Логика для опасной атаки
                } else {
                    print("\(name) cannot perform a dangerous attack because not in shadow.")
                }
            case "4":
                if bag.healing > 0 || bag.power > 0 {
                    useBag(opponent: opponent, enemies: enemies, bag: bag)
                } else {
                    print("🚫 No potions available to use!")
                    chooseAttackArcher(opponent: opponent, enemies: enemies, bag: bag) // Передача enemies
                }
            default:
                print("🚫 Invalid choice. Please choose again.")
                chooseAttackArcher(opponent: opponent, enemies: enemies, bag: bag) // Передача enemies
            }
        }
    }
    
    func useBag(opponent: Enemy, enemies: [Enemy], bag: HeroesBag) {
        print("\n🎒 Choose an item to use:")
        
        if bag.healing > 0 {
            print("[1] 💊 Use Healing Potion")
        }
        
        if bag.power > 0 {
            print("[2] ⚡ Use Strength Potion")
        }
        
        // Если оба зелья закончились
        if bag.healing == 0 && bag.power == 0 {
            print("🚫 No potions available to use!")
            // Возврат к выбору атаки
            chooseAttackArcher(opponent: opponent, enemies: enemies, bag: bag)
            return
        }
        
        if let choice = readLine() {
            switch choice {
            case "1":
                if bag.healing > 0 {
                    bag.useHealing(hero: self)
                } else {
                    print("🚫 No healing potions available!")
                    useBag(opponent: opponent, enemies: enemies, bag: bag) // Повторный вызов для нового выбора
                }
            case "2":
                if bag.power > 0 {
                    bag.usePower(hero: self)
                } else {
                    print("🚫 No strength potions available!")
                    useBag(opponent: opponent, enemies: enemies, bag: bag) // Повторный вызов для нового выбора
                }
            default:
                print("🚫 Invalid choice. Please choose again.")
                useBag(opponent: opponent, enemies: enemies, bag: bag) // Повторный вызов для нового выбора
            }
        }
    }
}
