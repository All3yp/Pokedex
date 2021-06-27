//
//  Pokemon.swift
//  Pokedex
//
//  Created by Alley Pereira on 25/06/21.
//

import SwiftUI

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
    let height: Int
    let weight: Int
    let attack: Int
    let defense: Int

    var formattedDescription: String {
        description
            .replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: "\u{0C}", with: " ")
    }
    var average: Int {
        (height + weight + attack + defense) / 4
    }
    var color: Color {
        Color(UIColor.backgroundColor(forType: self.type))
    }

    func fetchImage(completion: @escaping (UIImage?) -> Void) {
        let getImageURL = URL(string:imageUrl)!
        URLSession.shared.dataTask(with: getImageURL) { data, _, _ in

            guard let data = data else { return }

            let downloadedImage = UIImage(data: data)

            DispatchQueue.main.async {
                completion(downloadedImage)
            }

        }.resume()
    }
}

let MOCK_POKEMON: [Pokemon] = [
    .init(
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
]
