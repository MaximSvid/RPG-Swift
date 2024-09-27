//
//  StrongHero.swift
//  RPG
//
//  Created by Maxim Svidrak on 27.09.24.
//

class StrongHero: Hero {
    var cameUp: Bool
    
    init(name: String, HP: Int, maxHP: Int, attack: Int, isLive: Bool, cameUp: Bool) {
        self.cameUp = cameUp
        super.init(name: name, HP: HP, maxHP: maxHP, attack: attack, isLive: isLive)
    }
    
    func strongAttack (target: Enemy) {
        var attack = attack - target.HP
        
    }
    
    
}
