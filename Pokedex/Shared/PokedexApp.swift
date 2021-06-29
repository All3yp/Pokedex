//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Alley Pereira on 25/06/21.
//

import SwiftUI
import CoreData

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            PokedexView()
                .onTapGesture {
                    UIApplication.shared.sendAction(
                        #selector(UIResponder.resignFirstResponder),
                        to: nil,
                        from: nil,
                        for: nil
                    )
                }
        }
    }
}
