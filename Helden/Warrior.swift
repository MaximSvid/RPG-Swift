//
//  Krieger.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class Krieger: Helden {
    var attackOnAll: Int
    
    init(name: String, HP: Int, attack: Int, attackOnAll: Int) {
        self.attackOnAll = attackOnAll
        super.init(name: name, HP: HP, attack: attack)
    }
}

