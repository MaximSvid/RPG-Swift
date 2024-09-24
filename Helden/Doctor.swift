//
//  Doctor.swift
//  RPG
//
//  Created by Maxim Svidrak on 23.09.24.
//

class Doctor: Hero {
    var strengthVaccine: Bool
    
    
    init(name: String, HP: Int, attack: Int, isLive: Bool,strengthVaccine: Bool ) {
        self.strengthVaccine = strengthVaccine
        super.init(name: name, HP: HP, attack: attack, isLive: isLive)
    }
    
    //Angriffsverringerungsfunktion um 30
    func reduceIncomingDamage(incomingDamage: Int) -> Int {
        let reducedDamage = incomingDamage - 30
        print("\(name) has shield, damage reduced by 30")
        return reducedDamage
    }
    
    func healAllHeroes(heroes: [Hero]) {
        let recoveryAmount = 40
        for hero in heroes {
            hero.HP += recoveryAmount
            print("\(name) heals \(hero.name) for \(recoveryAmount) HP, now \(hero.name) has \(hero.HP) HP.")
        }
    }
    
    func doctorAttack(opponent: Enemy)  {
        let damage = 40
        opponent.HP -= damage
        print("\(opponent.name) was struck by the Doctor, taking \(damage) damage. \(opponent.name) now has \(opponent.HP) HP remaining.")

    }
    //test
    func effectiveAttack() -> Int {
            // Если strengthVaccine равно true, увеличиваем атаку на 2
            if strengthVaccine {
                print("\(name) is boosted by the strength vaccine, increasing attack by 2!")
                return attack + 2
            } else {
                return attack
            }
        }
    
}
