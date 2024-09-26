//
//  Animation.swift
//  RPG
//
//  Created by Maxim Svidrak on 26.09.24.
//

import Foundation
struct Animation {
    
    
    func epicGameIntroAnimation() {
        let introFrames = [
            "🌑                                                 ",
            "🌘                                                 ",
            "🌗                                                 ",
            "🌖                                                 ",
            "🌕 The moon shines bright... 🌕                    ",
            "🌕🌕 A cold wind blows... 🌕🌕                      ",
            "🌟✨ The stars begin to flicker... ✨🌟            ",
            "⚡ Thunder rumbles in the distance... ⚡            ",
            "💥 Shadows move in the dark... 💥                 ",
            "⚔️ Warriors are preparing for battle... ⚔️         ",
            "🧙‍♂️ Mages chant their powerful spells... 🧙‍♂️    ",
            "🏹 Archers ready their bows... 🏹                 "
        ]

        for frame in introFrames {
            print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
            print(frame)
            Thread.sleep(forTimeInterval: 0.2) // Замедление для эффекта
        }

        let battlePreparationFrames = [
            "🌕✨ Heroes gather their forces... ✨🌕",
            "💥 Armies stand on the horizon... 💥",
            "⚔️ Shields clash, swords are drawn... ⚔️",
            "🔥 The battlefield is set ablaze... 🔥",
            "⚡ The sky cracks with lightning... ⚡",
            "🌩️ Thunder roars as the armies charge! 🌩️"
        ]

        for frame in battlePreparationFrames {
            print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
            print(frame)
            Thread.sleep(forTimeInterval: 0.2) // Ускорение перед кульминацией
        }

        let finalBattleCountdown = [
            "💥...3...💥",
            "💥...2...💥",
            "💥...1...💥",
            "💥💥💥 BATTLE STARTS NOW! 💥💥💥"
        ]

        for frame in finalBattleCountdown {
            print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
            print(frame)
            Thread.sleep(forTimeInterval: 0.2)
        }
        
        print("⚔️ The war has begun! ⚔️")
        print("-----------------------------------------------------")
    }

    
    
    
}
