//
//  ArcherOpponent.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class ArcherOpponent: Enemy {
    var isFreeze: Bool = false
    
    init(name: String, HP: Int, attack: Int, isLive: Bool, isFreeze: Bool) {
        self.isFreeze = isFreeze
        super.init(name: name, HP: HP, attack: attack, isLive: Bool)
    }
    
    func iceArrow(target: Hero)  {
        let damage = 30
        isFreeze = true
    }

    
}

