//
//  Krieger.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class Warrior: Hero {
    var dualAttack: Int
    var callHeroBoss: Bool = false
    var boss: StrongHero?
    
    
    init(name: String, HP: Int, attack: Int, isLive: Bool, twoAttack: Int, boss: StrongHero?) {
        self.dualAttack = twoAttack
        self.boss = boss
        super.init(name: name, HP: HP,maxHP: HP, attack: attack, isLive: isLive)
    }
    
    func callTheStongHero (heroArray: inout [Hero]) {
        if !callHeroBoss == true {
            callHeroBoss = true
            
            if let strongHero = boss {
                print("⚔️ \(name) calls upon the mighty boss \(strongHero.name) to join the battle! 💪")
                strongHero.joinToBattle()
                print("🎖️ \(strongHero.name) has been added to the team!🎖️")
                
                heroArray.append(strongHero)
                print("👥 Current heroes in the team: \(heroArray.map { $0.name })")
            }
        }
    }
    
    func warriorAttack (opponent: Enemy) {
        let damage = attack
        _ = opponent.HP - damage
        print("⚔️ \(name) launched an attack on \(opponent.name) and inflicted \(damage) damage! 💥 \(opponent.name) now has \(opponent.HP) health remaining.".warriorBorder())
        print("-----------------------------------------------------")
    }
    
    func dualWarriorAttck (opponent: Enemy) {
        let damage = attack * 2
        _ = opponent.HP - damage
        print("⚔️ \(name) unleashed a powerful dual attack on \(opponent.name), dealing a devastating \(damage) damage! 💥 \(opponent.name) now has \(opponent.HP) health remaining.".warriorBorder())
        print("-----------------------------------------------------")
    }
    
    func dangerousAttack(opponent: Enemy)  {
        let damage = attack * 4
        let success = Bool.random() // true or false
        
        if success {
            opponent.HP -= damage
            print("🔥 \(opponent.name) was struck by a fierce blow, suffering \(damage) damage! 🌪️ \(opponent.name) now has \(opponent.HP) HP remaining to fight another day!".warriorBorder())
            print("-----------------------------------------------------")
        } else {
            print("⚡️ \(opponent.name) skillfully dodged the perilous attack, escaping unscathed!".warriorBorder())
            print("-----------------------------------------------------")
        }
    }
    //protocol in super class Hero
    override func attackAllEnemies(enemies: [Enemy]) {
        super.attackAllEnemies(enemies: enemies)
    }
    
    func randomWarriorAttack(enemies: [Enemy]) {
        // Список возможных атак
        let attacks: [(Enemy) -> Void] = [
            { (enemy: Enemy) in self.warriorAttack(opponent: enemy) },
            { (enemy: Enemy) in self.dualWarriorAttck(opponent: enemy) },
            { (enemy: Enemy) in self.dangerousAttack(opponent: enemy) }
        ]
        
        // Выбираем случайного врага и атаку
        if let randomEnemy = enemies.filter({ $0.HP > 0 }).randomElement() {
            let randomAttack = attacks.randomElement()! // Случайная атака
            randomAttack(randomEnemy) // Применяем атаку к случайному врагу
        }
    }
    
    
    func chooseAttackWarrior(opponent: Enemy, bag: HeroesBag,heroArray: inout [Hero]) {
        print("\n🔪 \(name) is preparing to attack! Choose an action:".warriorBorder())
        print("[1] ⚔️ Basic Attack")
        print("[2] ⚔️ Dual Attack")
        print("[3] ⚔️ Dangerous Attack")
        
        if callHeroBoss == false {
            print("[4] ⚔️ Call Strong Hero")
        }
        
        
        // Проверяем наличие зелий в рюкзаке перед добавлением опции использования зелий
        if bag.healing > 0 || bag.power > 0 {
            print("[5] 🎒 Use Bag")
        }
        
        if let choice = readLine() {
            switch choice {
            case "1":
                warriorAttack(opponent: opponent)
            case "2":
                dualWarriorAttck(opponent: opponent)
            case "3":
                dangerousAttack(opponent: opponent)
            case "4":
                callTheStongHero(heroArray: &heroArray)
            case "5":
                if bag.healing > 0 || bag.power > 0 {
                    useBag(opponent: opponent, bag: bag, heroArray: &heroArray)
                } else {
                    print("🚫 No potions available to use!")
                    chooseAttackWarrior(opponent: opponent, bag: bag, heroArray: &heroArray) // Повторный вызов для нового выбора
                }
            default:
                print("🚫 Invalid choice. Please choose again.")
                chooseAttackWarrior(opponent: opponent, bag: bag, heroArray: &heroArray) // Повторный вызов для нового выбора
            }
        }
    }
    
    func useBag(opponent: Enemy, bag: HeroesBag, heroArray: inout [Hero]) {
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
            chooseAttackWarrior(opponent: opponent, bag: bag, heroArray: &heroArray)
            return
        }
        
        if let choice = readLine() {
            switch choice {
            case "1":
                if bag.healing > 0 {
                    bag.useHealing(hero: self)
                } else {
                    print("🚫 No healing potions available!")
                    useBag(opponent: opponent, bag: bag, heroArray: &heroArray) // Повторный вызов для нового выбора
                }
            case "2":
                if bag.power > 0 {
                    bag.usePower(hero: self)
                } else {
                    print("🚫 No strength potions available!")
                    useBag(opponent: opponent, bag: bag, heroArray: &heroArray) // Повторный вызов для нового выбора
                }
            default:
                print("🚫 Invalid choice. Please choose again.")
                useBag(opponent: opponent, bag: bag, heroArray: &heroArray) // Повторный вызов для нового выбора
            }
        }
    }
    
    
    
    
    
}

