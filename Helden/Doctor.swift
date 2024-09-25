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
        super.init(name: name, HP: HP, attack: attack, isLive: isLive)
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
            print("\(name) heals \(hero.name) for \(recoveryAmount) HP, now \(hero.name) has \(hero.HP) HP.")
        }
    }
    
    func doctorAttack(opponent: Enemy)  {
        let damage = attack
        opponent.HP -= damage
        print("\(opponent.name) was struck by the Doctor, taking \(damage) damage. \(opponent.name) now has \(opponent.HP) HP remaining.")

    }
    
    func randomDoctorAttack(enemies: [Enemy], heroes: [Hero]) {
        // Список возможных атак
        let attacks: [(Enemy) -> Void] = [
            { (enemy: Enemy) in self.healAllHeroes(heroes: heroes) },
            { (enemy: Enemy) in self.doctorAttack(opponent: enemy) },
        ]
        
        // Выбираем случайного врага и атаку
        if let randomEnemy = enemies.filter({ $0.HP > 0 }).randomElement() {
            let randomAttack = attacks.randomElement()! // Случайная атака
            randomAttack(randomEnemy) // Применяем атаку к случайному врагу
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
