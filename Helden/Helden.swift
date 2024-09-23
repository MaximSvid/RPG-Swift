//
//  Helden.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class Helden {
    var name: String,
        var HP: Int,
        var attack: Int
    
    init(name: String, HP: Int, attack: Int) {
        self.name = name
        self.HP = HP
        self.attack = attack
    }
    
    func takeDamageHelden ( _ damage: Int) {
        HP -= damage
        print("\(name) took \(damage) damage.")
    }
    
    
    
}

