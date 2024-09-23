//
//  ArcherOpponent.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class ArcherOpponent {
    val archeryAttack: Int
    
    init(name: String, HP: Int, attack: Int, archeryAttack: Int) {
        self.archeryAttack = archeryAttack
        super.init(name: name, HP: HP, attack: attack)
    }
    
}

