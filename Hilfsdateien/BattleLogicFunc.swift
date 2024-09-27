//
//  BattleLogicFunc.swift
//  RPG
//
//  Created by Maxim Svidrak on 26.09.24.
//

class BattleLogicFunc {
    
    var heroArray: [Hero] = []
    var enemyArray: [Enemy] = []
    
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
    
    func startGameMessage(heroWarrior: Warrior, heroArcher: Archer, heroDoctor: Doctor, enemyWarrior: WarriorOpponent, enemyArcher: ArcherOpponent, enemyDoctor: DoctorOpponent) {
        
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
        💉 Enemy Doctor: Mariarti, with \(enemyDoctor.HP) HP, will stop at nothing to keep his evil allies alive.
        
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
                let aliveEnemies = enemyArray.filter { enemy in enemy.HP > 0 }
                
                if let opponent = aliveEnemies.randomElement() {
                    // Проверяем тип героя
                    if let warrior = hero as? Warrior {
                        warrior.chooseAttackWarrior(opponent: opponent, bag: bag, heroArray: &heroArray)
                    } else if let archer = hero as? Archer {
                        archer.chooseAttackArcher(opponent: opponent, enemies: enemyArray, bag: bag)
                    } else if let doctor = hero as? Doctor {
                        doctor.chooseAttackDoctor(opponent: opponent, bag: bag, heroes: heroArray)
                    } else if let strongHero = hero as? StrongHero {  // Добавляем проверку на StrongHero
                        strongHero.chooseAttackStrongHero(target: opponent, targets: enemyArray, heroes: heroArray)
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
    
    func randomHeroesAttack(bag: HeroesBag, enemy: Enemy) {
        for hero in heroArray {
            if let warrior = hero as? Warrior {
                warrior.randomWarriorAttack(enemies: enemyArray)
            } else if let acrher = hero as? Archer {
                acrher.randomArcherAttack(enemies: enemyArray)
            } else if let doctor = hero as? Doctor {
                doctor.randomDoctorAction(enemies: enemyArray, heroes: heroArray, bag: bag)
            } else if let superHero = hero as? StrongHero {
                superHero.randomStrongHeroAction(enemies: enemyArray, heroes: heroArray, bag: bag, enemy: enemy)
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
            
            // Проверяем, ранен ли враг
            if enemy.isHospital {
                enemy.woundRoundsLeft -= 1 // Уменьшаем количество оставшихся раундов
                if enemy.woundRoundsLeft <= 0 {
                    enemy.isHospital = false
                    print("✅ \(enemy.name) has recovered from the wound.")
                } else {
                    print("⏳ \(enemy.name) is still wounded for \(enemy.woundRoundsLeft) more rounds.")
                }
            }
            
            return false
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
