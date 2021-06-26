//
//  Color.swift
//  Pokedex
//
//  Created by Alley Pereira on 25/06/21.
//

import SwiftUI

extension UIColor {

    static func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "poison":
            return .systemGreen
        case "fire":
            return .systemRed
        case "water":
            return .systemBlue
        case "eletric":
            return .systemYellow
        case "psychic":
            return .systemPurple
        case "normal":
            return .systemOrange
        case "ground":
            return .systemGray
        case "flying":
            return .systemTeal
        case "fairy":
            return .systemPink
        default:
            return .systemIndigo
        }
    }
}
