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
    .init(id: 0, name: "Bulbassaur", imageUrl: "bulbassaur", type: "poison"),
    .init(id: 1, name: "Ivysaur", imageUrl: "bulbassaur", type: "poison"),
    .init(id: 2, name: "Charmander", imageUrl: "bulbassaur", type: "fire"),
    .init(id: 3, name: "Squirtle", imageUrl: "bulbassaur", type: "water"),
    .init(id: 4, name: "Bulbassaur", imageUrl: "bulbassaur", type: "poison"),
    .init(id: 5, name: "Bulbassaur", imageUrl: "bulbassaur", type: "poison"),
]
