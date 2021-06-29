//
//  CoreData Helper.swift
//  Pokedex
//
//  Created by Alley Pereira on 29/06/21.
//

import CoreData

struct CoreDataPokemonHelper {

    static private var context: NSManagedObjectContext {
        PersistenceController.shared.container.viewContext
    }

    static func readPokemonsFromCoreData() -> [PokemonsEntity] {
        let fetchRequest = NSFetchRequest<PokemonsEntity>(entityName: "PokemonsEntity")
        do {
            let pokemonsEntities: [PokemonsEntity] = try context.fetch(fetchRequest)
            return pokemonsEntities
        } catch {
            print(error)
        }
        return []
    }

    static func saveToCoreData(pokemon: Pokemon) {
        let entity = PokemonsEntity(context: context)
        entity.name = pokemon.model.name
        entity.type = pokemon.model.type
        entity.imageURL = pokemon.model.imageUrl
        entity.pokemonDescription = pokemon.model.description
        entity.id = Int16(pokemon.model.id)
        entity.attack = Int16(pokemon.model.attack)
        entity.defense = Int16(pokemon.model.defense)
        entity.height = Int16(pokemon.model.height)
        entity.weight = Int16(pokemon.model.weight)

        do {
            try context.save()
            print("Saved!")
        } catch {
            print(error.localizedDescription)
        }
    }

    static func updateToCoreData(imageData: Data?, entity: PokemonsEntity) {

        guard let imageData = imageData else { return }

        entity.imageData = imageData

        do {
            try context.save()
            print("Updated!")

        } catch {
            print(error.localizedDescription)
        }
    }

}
