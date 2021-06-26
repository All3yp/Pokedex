//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Alley Pereira on 25/06/21.
//

import SwiftUI

struct PokemonCell: View {

    let pokemon: Pokemon

    @State private var pokemonImage: UIImage?

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)

                HStack {
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 88, height: 25)

                    if let image = pokemonImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 59, height: 59)
                            .padding([.bottom, .trailing], 4)
                    } else {
                        Image("pokeball")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 59, height: 59)
                            .padding([.bottom, .trailing], 4)
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .background(Color(UIColor.backgroundColor(forType: pokemon.type)))
        .cornerRadius(12)
        .shadow(color: Color(UIColor.backgroundColor(forType: pokemon.type)), radius: 5, x: 0.0, y: 0.0)
        .onAppear {
            pokemon.fetchImage { image in
                pokemonImage = image
            }
        }
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: MOCK_POKEMON[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
