//
//  BattleLogic.swift
//  RPG
//
//  Created by Maxim Svidrak on 24.09.24.
//

class BattleLogic {
    var heroWarrior = Warrior (name: "King Artur", HP: 200, attack: 35, isLive: true, twoAttack: 3)
    var heroArcher = Archer (name: "Falconer", HP: 130, attack: 30, isLive: true, shadow: false)
    var heroDoctor = Doctor (name: "Tim", HP: 100, attack: 50, isLive: true, strengthVaccine: false)
    
    var enemyWarrior = WarriorOpponent(name: "Goliaf", HP: 250, attack: 50, isLive: true)
    var enemyArcher = ArcherOpponent(name: "Shooter", HP: 150, attack: 25, isLive: true)
    var enemyDortor = DoctorOpponent(name: "Mariarti", HP: 70, attack: 40, isLive: true)
    
    var heroArray: [Hero] = []
    var enemyArray: [Enemy] = []
    
    init () {
        heroArray = [heroWarrior, heroArcher, heroDoctor]
        enemyArray = [enemyWarrior, enemyArcher, enemyDortor]
    }
}
