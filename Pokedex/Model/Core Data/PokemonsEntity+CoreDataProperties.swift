//
//  PokemonsEntity+CoreDataProperties.swift
//  Pokedex
//
//  Created by Alley Pereira on 28/06/21.
//
//

import Foundation
import CoreData


extension PokemonsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonsEntity> {
        return NSFetchRequest<PokemonsEntity>(entityName: "PokemonsEntity")
    }

    @NSManaged public var attack: Int16
    @NSManaged public var defense: Int16
    @NSManaged public var height: Int16
    @NSManaged public var id: Int16
    @NSManaged public var imageURL: String?
    @NSManaged public var name: String?
    @NSManaged public var pokemonDescription: String?
    @NSManaged public var type: String?
    @NSManaged public var weight: Int16
    @NSManaged public var imageData: Data?

}

extension PokemonsEntity : Identifiable {

}
