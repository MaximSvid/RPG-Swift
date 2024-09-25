//
//  HeroState.swift
//  RPG
//
//  Created by Maxim Svidrak on 25.09.24.
//

enum HeroState {
    case healthy // здоров
    case wounded //ранен
    case knochedOut //выбыл
    
    var description: String {
        switch self {
        case .healthy: "health is above 50 percent"
        case .wounded: "health is below 50 percent"
        case .knochedOut: "character is knocked out of the game"
        }
    }
}
