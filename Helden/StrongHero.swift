//
//  StrongHero.swift
//  RPG
//
//  Created by Maxim Svidrak on 27.09.24.
//

class StrongHero: Hero {
    var callTheBoss: Bool = false
    
    init(name: String, HP: Int, maxHP: Int, attack: Int, isLive: Bool, callTheBoss: Bool) {
        self.callTheBoss = callTheBoss
        super.init(name: name, HP: HP, maxHP: maxHP, attack: attack, isLive: isLive)
    }
    
    func joinToBattle() {
        if !callTheBoss {
            callTheBoss = true
            print("\(name) has joined the battle!")
        }
    }
    
    func sneakAttack(target: Enemy, enemies: [Enemy], heroes: [Hero]) {
        let baseDamage = attack // Базовый урон
        
        print("🎯 \(name) attacks \(target.name) with a sneaky strike! ⚔️")
        
        // Наносим урон основной цели
        target.HP -= baseDamage
        print("💥 \(target.name) takes \(baseDamage) damage! Remaining HP: \(target.HP)")
        
        // 30% вероятность
        let chance = Int.random(in: 1...100)
        if chance <= 30 {
            print("✨ A mystical force awakens! \(name)'s strike affects all enemies and heals the team! 🌟")
            let areaDamage = 30 // Урон по всем врагам
            // Атакуем всех врагов
            for enemy in enemies {
                enemy.HP -= areaDamage
                print("💥 \(enemy.name) takes \(areaDamage) damage! Remaining HP: \(enemy.HP)💥")
                
            }
            
            // Лечим всех героев
            for hero in heroes {
                let health = 30
                hero.HP += health
                print("❤️ \(hero.name) gains \(health) HP! Current HP: \(hero.HP)❤️")
            }
        } else {
            print("🎯 The attack only affects \(target.name).")
        }
    }
    
    
    
    func inflictWoundAttack (target: Enemy) {
        let damage = 20
        var countRound = 3
        
        if !target.isHospital  {
            target.isHospital = true
            target.HP -= damage
            countRound -= 1
            print("💥 \(target.name) is wounded! They lose \(damage) HP. Remaining HP: \(target.HP).💥")
            print("⏳ The wound will last for 3 rounds.⏳")
            
            if countRound == 0 {
                target.isHospital = false
                print("✅ \(target.name) has recovered from the wound.✅")            }
            print()
        } else {
            target.HP -= damage
            print("💥 \(target.name) is still wounded! They lose \(damage) HP. Remaining HP: \(target.HP).")        }
    }
    
    override func attackAllEnemies(enemies: [Enemy]) {
        super.attackAllEnemies(enemies: enemies)
    }
    
    func randomStrongHeroAction(enemies: [Enemy], heroes: [Hero], bag: HeroesBag, enemy: Enemy) {
        // Массив действий для союзников (героев)
        let heroActions: [(Enemy) -> Void] = [
            { (enemy: Enemy) in self.sneakAttack(target: enemy, enemies: enemies ,heroes: heroes) }, // Лечим всех героев
            
            { (enemy: Enemy) in self.inflictWoundAttack(target: enemy) },
             
        ]
        
        // Решаем, атаковать врага или применить действие к герою
        let isHeroAction = Bool.random() // Случайный выбор между героем и врагом

        if isHeroAction, let randomHero = heroes.filter({ $0.HP > 0 }).randomElement() {
            let randomHeroAction = heroActions.randomElement()!
        } else if let randomEnemy = enemies.filter({ $0.HP > 0 }).randomElement() {
            let randomEnemyAction = heroActions.randomElement()! // Случайная атака на врага
            randomEnemyAction(randomEnemy) // Применяем атаку к врагу
        }
    }
    
    func chooseAttackStrongHero(target: Enemy, targets: [Enemy], heroes: [Hero]) {
        print("\n🔪 \(name) is preparing to attack! Choose an action:".warriorBorder())
        print("[1] ⚔️ Sneak Attack")
        print("[2] ⚔️ Inflict Wound Attack")
        print("[3] ⚔️ Normal Attack")
        
        if let choice = readLine() {
            switch choice {
            case "1":
                sneakAttack(target: target, enemies: targets, heroes: heroes)
            case "2":
                inflictWoundAttack(target: target)
            case "3":
                attackAllEnemies(enemies: targets)
            default:
                print("🚫 Invalid choice. Please choose again.")
                chooseAttackStrongHero(target: target, targets: targets, heroes: heroes)
            }
            
        } else {
            print("🚫 No potions available to use!")
            chooseAttackStrongHero(target: target, targets: targets, heroes: heroes) // Повторный вызов для нового выбора
        }
        
    }
}





