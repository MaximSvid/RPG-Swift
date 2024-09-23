//
//  Gegner.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class Gegner {
    var name: String,
        var HP: Int,
        var attack: Int
    init(name: String, HP: Int, attack: Int) {
        self.name = name
        self.HP = HP
        self.attack = attack
    }
    
    //функция атаки на всех героев
    func attackOnAllHero(warriors: [Helden])  {
        for warrior in warriors {
            warrior.takeDamageHelden(self.attack)
        }
    }
    
        //метод лечения
    func treatment(HP: Int)  {
        var treatment = HP * 2
        print("\(name) used the treatment.")
    }
    
    // Метод для получения урона
        func takeDamageGegner(_ damage: Int) {
            HP -= damage
            print("\(name) has taken \(damage) damage, \(HP) HP left.")
        }
    
    
}

