//
//  PokedexView.swift
//  Pokedex
//
//  Created by Alley Pereira on 25/06/21.
//

import SwiftUI

struct PokedexView: View {

    // MARK: - PROPERTIES
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    @ObservedObject var viewModel = PokemonViewModel()

    @State var isShowingDetail: Bool = false

    // MARK: - BODY
    var body: some View {

        NavigationView {

            ScrollView {

                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 23, weight: .bold))
                        .foregroundColor(.gray)

                    TextField("Search", text: $viewModel.searchQuery)
                } //: HStack

                .padding(.vertical, 9)
                .padding(.horizontal)
                .background(Color.primary.opacity(0.05))
                .cornerRadius(8)
                .padding()

                LazyVGrid(columns: gridItems, spacing: 18) {
                    ForEach(viewModel.pokemons) { pokemon in
                        PokemonCell(pokemon: pokemon)
                    }  //: ForEach
                } //: LazyVGrid
                .padding()
            } //: Scroll
            .navigationTitle("Pokedex")
        } //: Nav

        .onAppear {
            viewModel.fetchPokemon()
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
