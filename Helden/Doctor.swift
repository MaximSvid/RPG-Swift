//
//  Doctor.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class Doctor: Hero {
    var strengthVaccine: Bool
    
    
    init(name: String, HP: Int, attack: Int, isLive: Bool,strengthVaccine: Bool ) {
        self.strengthVaccine = strengthVaccine
        super.init(name: name, HP: HP, maxHP: HP, attack: attack, isLive: isLive)
    }
    
    //Angriffsverringerungsfunktion um 30
//    func reduceIncomingDamage() -> Int {
//        let incomingDamage = 50
//        let reducedDamage = incomingDamage - 30
//        print("\(name) has shield, damage reduced by 30")
//        return reducedDamage
//    }
    
    func healAllHeroes(heroes: [Hero]) {
        let recoveryAmount = 40
        for hero in heroes {
            hero.HP += recoveryAmount
            print("💖 \(name) channels their energy to heal \(hero.name) for \(recoveryAmount) HP! \(hero.name) now stands strong with \(hero.HP) HP.")
            print("-----------------------------------------------------")
        }
    }
    
    func doctorAttack(opponent: Enemy)  {
        let damage = attack
        opponent.HP -= damage
        print("💥 A powerful blow from the Doctor strikes \(opponent.name), inflicting \(damage) damage! \(opponent.name) now stands with \(opponent.HP) HP.")
        print("-----------------------------------------------------")
    }
    
    // Случайная атака доктора
    func randomDoctorAction(enemies: [Enemy], heroes: [Hero], bag: HeroesBag) {
        // Массив действий для союзников (героев)
        let heroActions: [(Hero) -> Void] = [
            { (hero: Hero) in self.healAllHeroes(heroes: heroes) }, // Лечим всех героев
            { (hero: Hero) in self.useBag(opponent: enemies.randomElement()!, bag: bag, heroes: heroes) }// Используем сумку на союзнике
        ]
        
        // Массив действий для врагов (атак)
        let enemyActions: [(Enemy) -> Void] = [
            { (enemy: Enemy) in self.doctorAttack(opponent: enemy) } // Атака на врага
        ]
        
        // Решаем, атаковать врага или применить действие к герою
        let isHeroAction = Bool.random() // Случайный выбор между героем и врагом

        if isHeroAction, let randomHero = heroes.filter({ $0.HP > 0 }).randomElement() {
            let randomHeroAction = heroActions.randomElement()! // Случайное действие на герое
            randomHeroAction(randomHero) // Применяем действие к герою
        } else if let randomEnemy = enemies.filter({ $0.HP > 0 }).randomElement() {
            let randomEnemyAction = enemyActions.randomElement()! // Случайная атака на врага
            randomEnemyAction(randomEnemy) // Применяем атаку к врагу
        }
    }
    
    
    func chooseAttackDoctor(opponent: Enemy, bag: HeroesBag, heroes: [Hero]) {
        print("\n🩺 \(name) is preparing to attack! Choose an action:")
        print("[1] 💊 Heal all Heroes")
        print("[2] ⚔️ Attack with Medical Skills")
        
        // Проверяем наличие зелий в рюкзаке перед добавлением опции использования зелий
        if bag.healing > 0 || bag.power > 0 {
            print("[3] 🎒 Use Bag")
        }
        
        if let choice = readLine() {
            switch choice {
            case "1":
                healAllHeroes(heroes: heroes)
            case "2":
                doctorAttack(opponent: opponent)
            case "3":
                if bag.healing > 0 || bag.power > 0 {
                    useBag(opponent: opponent, bag: bag, heroes: heroes)
                } else {
                    print("🚫 No potions available to use!")
                    chooseAttackDoctor(opponent: opponent, bag: bag, heroes: heroes) // Повторный вызов для нового выбора
                }
            default:
                print("🚫 Invalid choice. Please choose again.")
                chooseAttackDoctor(opponent: opponent, bag: bag, heroes: heroes) // Повторный вызов для нового выбора
            }
        }
    }
    
    func useBag(opponent: Enemy, bag: HeroesBag, heroes: [Hero]) {
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
            chooseAttackDoctor(opponent: opponent, bag: bag, heroes: heroes)
            return
        }
        
        if let choice = readLine() {
            switch choice {
            case "1":
                if bag.healing > 0 {
                    bag.useHealing(hero: self)
                } else {
                    print("🚫 No healing potions available!")
                    useBag(opponent: opponent, bag: bag, heroes: heroes) // Повторный вызов для нового выбора
                }
            case "2":
                if bag.power > 0 {
                    bag.usePower(hero: self)
                } else {
                    print("🚫 No strength potions available!")
                    useBag(opponent: opponent, bag: bag, heroes: heroes) // Повторный вызов для нового выбора
                }
            default:
                print("🚫 Invalid choice. Please choose again.")
                useBag(opponent: opponent, bag: bag, heroes: heroes) // Повторный вызов для нового выбора
            }
        }
    }
    
}
