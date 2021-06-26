//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Alley Pereira on 25/06/21.
//

import SwiftUI

class PokemonViewModel: ObservableObject {

    let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"

    private var allFetchedPokemons: [Pokemon] = []

    @Published var pokemons = [Pokemon]()

    @Published var searchQuery = "" {
        willSet {
            pokemons = (newValue.isEmpty) ? allFetchedPokemons : self.filteredPokemons(newValue)
        }
    }

    func fetchPokemon() {
        guard let url = URL(string: baseURL) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else {
                return
            }

            do {
                let pokemons = try JSONDecoder().decode([Pokemon].self, from: data)

                DispatchQueue.main.async {
                    self.allFetchedPokemons = pokemons
                    self.pokemons = pokemons
                    print(pokemons.count)
                }

            } catch {
                print(error)
                return
            }

        }.resume()
    }

    func filteredPokemons(_ filterTerm: String) -> [Pokemon] {
        return allFetchedPokemons.filter { pokemon in
            return pokemon.name.lowercased().contains(filterTerm.lowercased())
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else {
            return nil
        }
        return data
    }
}
