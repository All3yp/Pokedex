//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Alley Pereira on 25/06/21.
//

import SwiftUI

struct PokemonCell: View {

    // MARK: - PROPERTIES
    let pokemon: Pokemon

    @State var isShowingDetail: Bool = false

    var body: some View {
        Button(
            action: {
                withAnimation(.easeInOut(duration: 1)) {
                    isShowingDetail = true
                }
            },
            label: {
                cellView
            }
        )
        .fullScreenCover(isPresented: $isShowingDetail) {
            PokemonDetailView(
                pokemon: pokemon,
                isShowingDetail: $isShowingDetail
            )
        }
    }

    fileprivate var cellView: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.model.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)

                HStack {
                    Text(pokemon.model.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 88, height: 25)

                    if let image = pokemon.image {
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
        .background(pokemon.color)
        .cornerRadius(12)
        .shadow(color: pokemon.color, radius: 5, x: 0.0, y: 0.0)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: MOCK_POKEMON[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
