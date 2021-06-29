//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Alley Pereira on 25/06/21.
//

import SwiftUI
import CoreData

class PokemonViewModel: ObservableObject {

    // MARK: - PROPERTIES
    @Published var pokemons = [Pokemon]()
    @Published var searchQuery = "" {
        willSet {
            pokemons = (newValue.isEmpty) ? persistedPokemons.pokemons : self.filteredPokemons(newValue)
        }
    }

    private var persistedPokemons: (pokemons: [Pokemon], entities: [PokemonsEntity]) {
        let entities = CoreDataPokemonHelper.readPokemonsFromCoreData()
        return (
            pokemons: entities.compactMap { Pokemon(entity: $0) },
            entities: entities
        )
    }

    // MARK: - Request Pokemons
    func fetchPokemons() {
        
        if !persistedPokemons.entities.isEmpty {

            pokemons = persistedPokemons.pokemons
            downloadImagesIfNeeded()

        } else {

            Networking.loadFromAPI { [weak self] result in
                guard let self = self else { return }
                switch result {

                case .success(let pokemons):

                    for pokemon in pokemons {
                        CoreDataPokemonHelper.saveToCoreData(pokemon: pokemon)
                    }

                    self.downloadImagesIfNeeded()

                    self.reloadPokemonsFromCoreData()

                case .failure(let error):
                    print(error)
                }
            }

        }

    }

    private func filteredPokemons(_ filterTerm: String) -> [Pokemon] {
        return persistedPokemons.pokemons.filter { pokemon in
            return pokemon.model.name.lowercased().contains(filterTerm.lowercased())
        }
    }

    private func reloadPokemonsFromCoreData() {
        DispatchQueue.main.async {
            self.pokemons = self.persistedPokemons.pokemons
        }
    }

    private func downloadImagesIfNeeded() {
        let pokemonsWithoutPersistedImages: [PokemonsEntity] = persistedPokemons.entities.filter { $0.imageData == nil }

        pokemonsWithoutPersistedImages.forEach { entity in
            Networking.fetchImage(imageUrl: entity.imageURL!) { [weak self] data in

                CoreDataPokemonHelper.updateToCoreData(imageData: data, entity: entity)

                //recarrega lista de pokemons que aparece na tela
                self?.reloadPokemonsFromCoreData()
            }
        }
    }

}
