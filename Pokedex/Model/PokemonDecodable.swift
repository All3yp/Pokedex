//
//  PokemonDecodableModel.swift
//  Pokedex
//
//  Created by Alley Pereira on 25/06/21.
//

import Foundation

struct PokemonDecodable: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
    let height: Int
    let weight: Int
    let attack: Int
    let defense: Int
}
