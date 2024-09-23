//
//  Helden.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class Hero {
    var name: String,
        var HP: Int,
        var attack: Int,
        var isLive: Bool = true
    
    init(name: String, HP: Int, attack: Int, isLive: Bool) {
        self.name = name
        self.HP = HP
        self.attack = attack
        self.isLive = isLive
    }
        
    func attackOnAllGegner(opponents: [Enemy]) {
        let damage = 50
        for opponent in opponents {
            opponent.HP -= damage
            print("\(name) attacked \(opponent.name) and did \(damage) damage to him. \(opponent.name) has \(opponent.HP) health left.")
        }
    }
    
    
    
    // Проверка жизни конкретного героя
        func checkIfAlive() {
            if HP <= 0 {
                isLive = false
                print("\(name) is dead. He's out of the game")
            }
        }
        
        // Проверка всех героев после раунда
    func checkAllHeldenAfterRound(helden: [Hero]) -> [Hero] {
            var liveHeroes: [Hero] = []  // Список живых героев
            
            for hero in liveHeroes {
                hero.checkIfAlive()  // Проверяем жизнь каждого героя
                if hero.isLive {
                    liveHeroes.append(hero)  // Если герой жив, добавляем его в список
                }
            }
            
            return liveHeroes  // Возвращаем список только живых героев
        }
    
    
    
}

