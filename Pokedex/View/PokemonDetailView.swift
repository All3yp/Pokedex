//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Alley Pereira on 26/06/21.
//

import SwiftUI

struct PokemonDetailView: View {

    // MARK: - PROPERTIES
    let pokemon: Pokemon

    @Binding var isShowingDetail: Bool

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [pokemon.color, Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            Color.white.offset(y: 300)
            ScrollView {

                HStack { Spacer() }.padding(25)

                if let image = pokemon.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .zIndex(2.0)
                } else {
                    Image("pokeball")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                VStack {
                    Text(pokemon.model.name.capitalized)
                        .font(.largeTitle)
                        .padding(.top, 40)

                    Text(pokemon.model.type.capitalized)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
                        .background(pokemon.color)
                        .cornerRadius(20)


                    Text(pokemon.formattedDescription)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 25)
                        .padding(.top, 12)

                    HStack { Spacer() }

                } //: VStack

                .background(Color.white)
                .cornerRadius(30)
                .padding(.top, -40)
                .padding(.bottom, 40)

                HStack {
                    Text("Base Stats")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.leading, 30)

                    Spacer()
                } //: HStack
                CustomChartView(pokemon: pokemon)
                    .padding(.top, 2)

            } //: Scroll

            HStack {
                Spacer()
                VStack {
                    Button(
                        action: {
                            isShowingDetail = false
                        },
                        label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                                .foregroundColor(.black.opacity(0.5))
                                .background(Color.clear)
                                .padding()
                        }
                    ) //: Button
                    Spacer()
                } //: VStack
            } //: HStack

        } //: ZStack

    } //: Body
}

struct PokemonDetailView_Previews: PreviewProvider {
    @State static var value = false
    static var previews: some View {
        PokemonDetailView(pokemon: MOCK_POKEMON[0], isShowingDetail: $value)
    }
}
