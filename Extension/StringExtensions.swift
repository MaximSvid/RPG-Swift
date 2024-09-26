//
//  StringExtensions.swift
//  RPG
//
//  Created by Maxim Svidrak on 26.09.24.
//
extension String {
    func startRound() -> String {
        return "\n✨ Round \(self) Begins! ✨"
    }
    
    func heroBorder () -> String {
        return "🔷🔶 \(self) 🔶🔷"
    }
    
    func warriorBorder() -> String {
        return "🍀⚔️ \(self) ⚔️🍀"
    }
    func archerBorder () ->
    String {
        return "🏅🏹 \(self) 🏹🏅"
    }
    
    func doctorBorder () ->
    String {
        return "🏅💫 \(self) 💫🏅"
    }
    
    func warriorOpponentBorder () -> String {
        return "⚔️🔷 \(self) 🔷⚔️"
    }
    
    func archerOpponentBorder () -> String {
        return "💢🕸️ \(self) 🕸️💢"
    }
    
    func doctorOpponentBorder () -> String {
        return "⚡️🔥 \(self) 🔥⚡️"
    }
}

