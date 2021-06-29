//
//  Pokemon.swift
//  Pokedex
//
//  Created by Alley Pereira on 28/06/21.
//

import SwiftUI

struct Pokemon {

    let model: PokemonDecodable

    var formattedDescription: String {
        model.description
            .replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: "\u{0C}", with: " ")
    }

    var average: Int {
        (model.height + model.weight + model.attack + model.defense) / 4
    }

    var color: Color {
        Color(UIColor.backgroundColor(forType: model.type))
    }

    var image: UIImage? = nil

    //Inicializacao a partir do CoreData
    init(entity pokemonEntity: PokemonsEntity) {
        self.model = PokemonDecodable(
            id: Int(pokemonEntity.id),
            name: pokemonEntity.name!,
            imageUrl: pokemonEntity.imageURL!,
            type: pokemonEntity.type!,
            description: pokemonEntity.pokemonDescription!,
            height: Int(pokemonEntity.height),
            weight: Int(pokemonEntity.weight),
            attack: Int(pokemonEntity.attack),
            defense: Int(pokemonEntity.defense)
        )

        if let imageData = pokemonEntity.imageData {
            self.image = UIImage(data: imageData)
        }
    }

    //Inicializacao a partir da API
    init(decodableModel: PokemonDecodable) {
        self.model = decodableModel
    }
}


// MARK: - MOCK
let MOCK_POKEMON: [Pokemon] = [
    Pokemon(
        decodableModel: PokemonDecodable(
            id: 0,
            name: "Bulbassaur",
            imageUrl: "bulbassaur",
            type: "Poison",
            description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.",
            height: 7,
            weight: 69,
            attack: 62,
            defense: 63
        )
    )
]
