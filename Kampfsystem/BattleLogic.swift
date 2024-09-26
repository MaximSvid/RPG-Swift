//
//  BattleLogic.swift
//  RPG
//
//  Created by Maxim Svidrak on 24.09.24.
//

class BattleLogic {
    var heroWarrior = Warrior (name: "King Artur", HP: 200, attack: 35, isLive: true, twoAttack: 3)
    var heroArcher = Archer (name: "Falconer", HP: 130, attack: 30, isLive: true, shadow: 2)
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
    
    let heroesBag = HeroesBag(healing: 4, power: 2) // Инициализация сумки с 4 зельями лечения и
    let enemyBag = EnemyBag(healingAllEnemy: 1, plusPowerOnAllEnemy: 1) // Инициализация сумки с 4 зельями лечения и 2 зельями силы
    
    func playRound () {
        //hallo
        
        var roundNumber: Int = 1
        startGameMessage()
        print("-----------------------------------------------------")
        let isHeroTeam = chooseTeam() // Получаем выбор пользователя (1 или 2)
        print("-----------------------------------------------------")
        
        while(!endGameCheck()) {
            
            print("\n✨ Round \(roundNumber) Begins! ✨")
            print("-----------------------------------------------------")
            
            characterStatus()
            
            
            if isHeroTeam { // Если выбраны герои
                heroesAttack(bag: heroesBag)
                randomOpponentAttack()
            } else { // Если выбраны враги
                opponentAttack(bag: enemyBag)
                randomHeroesAttack()
            }

            
            checkAllCharactersAfterRound(heroes: &heroArray, enemies: &enemyArray)
            
            roundNumber += 1
            
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
    
    func characterStatus() {
        print("\n🌟 Heroes' Status 🌟")
        for hero in heroArray {
            if hero.HP > 0 {
                print("✨ \(hero.name) has \(hero.HP) HP remaining.")
            } else {
                print("💔 \(hero.name) is defeated.")
            }
        }
        
        print("\n👾 Enemies' Status 👾")
        for enemy in enemyArray {
            if enemy.HP > 0 {
                print("🔥 \(enemy.name) has \(enemy.HP) HP remaining.")
            } else {
                print("⚔️ \(enemy.name) is defeated.")
            }
        }
        
        print("-----------------------------------------------------")  // Разделительная линия для удобства чтения
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
    
    func chooseTeam() -> Bool {
        print("🌟 Choose Your Team 🌟")
        print("1. ⚔️ Heroes")
        print("2. 💪 Enemies")
        print("Please enter the number of your choice:")
        
        
        while true { // Запускаем цикл для повторного ввода в случае ошибки
            if let choice = readLine() {
                switch choice {
                case "1":
                    print("🎉 You have chosen the Heroes team! 🎉")
                    print("-----------------------------------------------------")
                    print("Here are your brave heroes:")
                    for hero in heroArray {
                        print("💪 \(hero.name) - HP: \(hero.HP) 🛡️")
                    }
                    return true // Возвращаем true для выбора команды героев
                case "2":
                    print("👾 You have chosen the Enemies team! 👾")
                    print("-----------------------------------------------------")
                    print("Beware of these foes:")
                    for enemy in enemyArray {
                        print("⚔️ \(enemy.name) - HP: \(enemy.HP) ⚔️")
                    }
                    return false // Возвращаем false для выбора команды врагов
                default:
                    print("❌ Invalid choice. Please select 1 for Heroes or 2 for Enemies. ❌")
                    print("-----------------------------------------------------")
                    // Продолжаем цикл, чтобы запросить выбор снова
                }
            }
        }
    }
    
    func heroesAttack(bag: HeroesBag) {
        for hero in heroArray {
            if hero.HP > 0 {
                // Фильтруем врагов, оставляя только тех, у кого HP больше 0
                let aliveEnemies = enemyArray.filter { enemy in enemy.HP > 0 }
                
                // Проверяем, есть ли живые враги
                if let opponent = aliveEnemies.randomElement() {
                    // Проверяем тип героя
                    if let warrior = hero as? Warrior {
                        // Вызываем метод атаки для выбранного врага
                        warrior.chooseAttackWarrior(opponent: opponent, bag: bag)
                    } else if let archer = hero as? Archer {
                        archer.chooseAttackArcher(opponent: opponent, enemies: enemyArray, bag: bag)
                    } else if let doctor = hero as? Doctor {
                        doctor.chooseAttackDoctor(opponent: opponent, bag: bag, heroes: heroArray)
                    }
                }
            }
        }
    }
    
    func opponentAttack (bag: EnemyBag) {
        for enemy in enemyArray {
            if enemy.HP > 0 {
                let aliveHero = heroArray.filter{ hero in hero.HP > 0 }
                if let hero = aliveHero.randomElement() {
                    if let warriorOpponent = enemy as? WarriorOpponent {
                        warriorOpponent.chooseAttackWarriorOpponent(hero: hero, heroes: heroArray, bag: bag)
                    } else if let archerOpponent = enemy as? ArcherOpponent {
                        archerOpponent.chooseAttackArcherOpponent(hero: hero, heroes: heroArray, bag: bag)
                    } else if let doctorOpponent = enemy as? DoctorOpponent {
                        doctorOpponent.chooseAttackDoctorOpponent(hero: hero, heroes: heroArray, opponents: enemyArray, bag: bag)
                    }
                }
            }
        }
    }
    
    func randomOpponentAttack() {
        for enemy in enemyArray {
            if let warriorOpponent = enemy as? WarriorOpponent {
                warriorOpponent.randomWarriorOpponentAttack(heroes: heroArray)
            } else if let archerOpponent = enemy as? ArcherOpponent {
                archerOpponent.randomArcherOpponentAttack(heroes: heroArray)
            } else if let doctorOpponent = enemy as? DoctorOpponent {
                doctorOpponent.randomDoctorOpponentAttack(heroes: heroArray, opponents: enemyArray)
            }
        }
    }
    
    func randomHeroesAttack() {
        for hero in heroArray {
            if let warrior = hero as? Warrior {
                warrior.randomWarriorAttack(enemies: enemyArray)
            } else if let acrher = hero as? Archer {
                acrher.randomArcherAttack(enemies: enemyArray)
            } else if let doctor = hero as? Doctor {
                doctor.randomDoctorAction(enemies: enemyArray, heroes: heroArray, bag: heroesBag)
            }
        }
    }
    
    func checkAllCharactersAfterRound(heroes: inout [Hero], enemies: inout [Enemy]) {
        print("-----------------------------------------------------")
        print("\n🌟 Checking the status of characters 🌟")
        
        // Удаляем мертвых героев из heroArray
        heroes.removeAll { hero in
            hero.checkIfAlive()  // Проверяем, жив ли герой
            if !hero.isLive {
                print("💔 Hero \(hero.name) is dead.")
                return true  // Возвращаем true, если герой мертв (будет удален)
            }
            return false  // Герой жив, не удаляем
        }
        
        // Удаляем мертвых врагов из enemyArray
        enemies.removeAll { enemy in
            enemy.checkIfAlive()  // Проверяем, жив ли враг
            if !enemy.isLive {
                print("💔 Enemy \(enemy.name) is dead.")
                return true  // Возвращаем true, если враг мертв (будет удален)
            } else {
                print("✨ Enemy \(enemy.name) is alive with \(enemy.HP) HP.")
                return false  // Враг жив, не удаляем
            }
        }
        
        print("-----------------------------------------------------")
        
        // Выводим информацию о живых героях
        if heroes.isEmpty {
            print("\n⚔️ All heroes are dead!")
        } else {
            print("\n✅ Total living heroes: \(heroes.count)")
        }
        
        // Выводим информацию о живых врагах
        if enemies.isEmpty {
            print("\n⚔️ All enemies are dead!")
        } else {
            print("\n✅ Total living enemies: \(enemies.count)")
        }
    }
 
}
