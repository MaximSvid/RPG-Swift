//
//  StrongCharacter.swift
//  RPG
//
//  Created by Maxim Svidrak on 27.09.24.
//

class StrongCharacter {
    var name: String
    var HP: Int
    var attack: Int
    var isLive: Bool = false
    
    init(name: String, HP: Int, attack: Int, isLive: Bool) {
        self.name = name
        self.HP = HP
        self.attack = attack
        self.isLive = isLive
    }
}
