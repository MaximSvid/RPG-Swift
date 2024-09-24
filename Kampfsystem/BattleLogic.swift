//
//  BattleLogic.swift
//  RPG
//
//  Created by Maxim Svidrak on 24.09.24.
//

class BattleLogic {
    var heroWarrior = Warrior (name: "King Artur", HP: 200, attack: 35, isLive: true, twoAttack: 3)
    var heroArcher = Archer (name: "Falconer", HP: 130, attack: 30, isLive: true, shadow: false)
    var heroDoctor = Doctor (name: "Tim", HP: 100, attack: 50, isLive: true, strengthVaccine: false)
    
    var enemyWarrior = WarriorOpponent(name: "Goliaf", HP: 250, attack: 50, isLive: true)
    var enemyArcher = ArcherOpponent(name: "Shooter", HP: 150, attack: 25, isLive: true)
    var enemyDortor = DoctorOpponent(name: "Mariarti", HP: 70, attack: 40, isLive: true)
    
    var heroArray: [Hero] = []
    var enemyArray: [Enemy] = []
    
    init () {
        heroArray = [heroWarrior, heroArcher, heroDoctor]
        enemyArray = [enemyWarrior, enemyArcher, enemyDortor]
    }
    
    func playRound () {
        let heroesBag = HeroesBag(healing: 4, power: 2) // Инициализация сумки с 4 зельями лечения и 2 зельями силы
        var roundNumber: Int = 1
        startGameMessage()
        print("-----------------------------------------------------")
        chooseTeam()
        print("-----------------------------------------------------")
        
        while(!endGameCheck()) {
            
            print("\n✨ Round \(roundNumber) Begins! ✨")
            print("-----------------------------------------------------")
            
            characterStatus()
            
            heroesAttack(bag: heroesBag)
            
//            1exit(0)
        }
    }
    
    func endGameCheck() -> Bool {
        // Check if hero or enemy array is empty
        if heroArray.isEmpty || enemyArray.isEmpty {
            print("💥 Game Over: One of the lists is empty. The battle has ended!")
            return true
        }
        
        // Check if all heroes are dead
        let allHeroesDead = heroArray.allSatisfy { $0.HP <= 0 }
        // Check if all enemies are dead
        let allEnemiesDead = enemyArray.allSatisfy { $0.HP <= 0 }
        
        // If all heroes or all enemies are dead
        if allHeroesDead {
            print("⚔️ Game Over: All heroes have fallen in battle. The realm is lost! ⚔️")
            return true
        } else if allEnemiesDead {
            print("🏆 Game Over: All enemies have been defeated! Victory is ours! 🎉")
            return true
        }
        
        // If none of the conditions are met, the game continues
        return false
    }
    
    func characterStatus () {
        print("\nHeroes' status:")
        for hero in heroArray {
            if hero.HP > 0 {
                print("\(hero.name) has \(hero.HP) HP remaining.")
            }
        }
        
        print("\nEnemies' status:")
        for enemy in enemyArray {
            if enemy.HP > 0 {
                print("\(enemy.name) has \(enemy.HP) HP remaining.")
            }
            
        }
        print("")  // Пустая строка для удобства чтения
    }
    
    func startGameMessage() {
        print("""
        ⚔️ Welcome to the Battle Arena! ⚔️
        Today, legendary heroes will face deadly enemies in an epic fight for survival!
        
        🎖️ Our Heroes 🎖️
        🛡️ Warrior: King Arthur, with \(heroWarrior.HP) HP and \(heroWarrior.attack) attack power.
        🏹 Archer: Falconer, with \(heroArcher.HP) HP, sharp arrows, and shadow stealth.
        💉 Doctor: Tim, with \(heroDoctor.HP) HP, ready to heal and shield the team from damage.
        
        ⚔️ The Enemies ⚔️
        🛡️ Enemy Warrior: Goliath, towering with \(enemyWarrior.HP) HP and a brutal attack of \(enemyWarrior.attack).
        🏹 Enemy Archer: Shooter, lurking with \(enemyArcher.HP) HP, armed with deadly precision.
        💉 Enemy Doctor: Mariarti, with \(enemyDortor.HP) HP, will stop at nothing to keep his evil allies alive.
        
        Let the battle begin! Who will prevail? ⚔️🔥
        """)
    }
    
    func chooseTeam() {
        print("🌟 Choose Your Team 🌟")
        print("1. ⚔️ Heroes")
        print("2. 💪 Enemies")
        print("Please enter the number of your choice:")
        
        if let choice = readLine() {
            switch choice {
            case "1":
                print("🎉 You have chosen the Heroes team! 🎉")
                print("Here are your brave heroes:")
                for hero in heroArray {
                    print("💪 \(hero.name) - HP: \(hero.HP) 🛡️")
                }
            case "2":
                print("👾 You have chosen the Enemies team! 👾")
                print("Beware of these foes:")
                for enemy in enemyArray {
                    print("⚔️ \(enemy.name) - HP: \(enemy.HP) ⚔️")
                }
            default:
                print("❌ Invalid choice. Please select 1 for Heroes or 2 for Enemies. ❌")
                chooseTeam() // Запросить выбор снова
            }
        }
    }
    
    func heroesAttack(bag: HeroesBag) {
        for hero in heroArray {
            if hero.HP > 0 {
                // Фильтруем врагов, оставляя только тех, у кого HP больше 0
                let aliveEnemies = enemyArray.filter { $0.HP > 0 }
                
                // Проверяем, есть ли живые враги
                if let opponent = aliveEnemies.randomElement() {
                    // Проверяем, является ли герой воином
                    if let warrior = hero as? Warrior {
                        // Вызываем метод атаки для выбранного врага
                        warrior.chooseAttackWarrior(opponent: opponent, bag: bag) // Используем экземпляр bag
                    }
                }
            }
        }
    }
    
}
