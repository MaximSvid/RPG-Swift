//
//  Doctor.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class Doctor: Helden {
    val treatment: Int
    
    init(name: String, HP: Int, attack: Int, treatment: Int) {
        self.treatment = treatment
        super.init(name: name, HP: HP, attack: attack)
    }
    //Angriffsverringerungsfunktion um 30
    func defend (incomingAttack: Int)-> Int {
        var reducedAttack = incomingAttack - 30
        print(\(name) has shield damage reduced by 30)
        return reducedAttack
    }
    
    func (ally: Helden) {
        var recovery: Int = 40
        ally.HP += recovery
        print ("\(name) heals \(ally.name) for \(recovery) HP, now \(ally.name) has \(ally.HP) HP")
    }
}
