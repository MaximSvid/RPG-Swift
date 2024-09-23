//
//  Archer.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//
class Archer: Helden {
    val archeryAttack: Int
    
    init(name: String, HP: Int, attack: Int, archeryAttack: Int) {
        self.archeryAttack = archeryAttack
        super.init(name: name, HP: HP, attack: attack)
    }
    
    
    //атака на всех противников
    func attackOnAllOpponent (opponents: [Gegner]) {
        opponent in opponents {
            opponent.takeDamageGegner(archeryAttack)
        }
    }
}
