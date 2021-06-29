//
//  Networking.swift
//  Pokedex
//
//  Created by Alley Pereira on 28/06/21.
//

import Foundation

struct Networking {

    private static let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"

    static func loadFromAPI(completion: @escaping (Result<[Pokemon],Error>) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else {
                return
            }

            do {
                let pokemonsFromJson = try JSONDecoder().decode([PokemonDecodable].self, from: data)

                let parsedPokemons: [Pokemon] = pokemonsFromJson.compactMap { Pokemon(decodableModel: $0) }

                completion(.success(parsedPokemons))

            } catch {
                completion(.failure(error))
            }

        }.resume()
    }

    static func fetchImage(imageUrl: String, completion: @escaping (Data?) -> Void) {
        let getImageURL = URL(string: imageUrl)!
        URLSession.shared.dataTask(with: getImageURL) { data, _, _ in
            completion(data)
        }.resume()
    }
}
