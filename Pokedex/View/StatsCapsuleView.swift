//
//  StatsCapsuleView.swift
//  Pokedex
//
//  Created by Alley Pereira on 26/06/21.
//

import SwiftUI

struct StatsCapsuleView: View {

    var value: Int
    var title: String
    var color: Color

    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 30)
                .frame(width: 100)

            HStack {
                Text("\(value)")
                    .frame(width: 50)
                    .padding(.trailing)
            } //: HStack
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(width: 200, height: 20)
                    .foregroundColor(Color.gray).opacity(0.4)

                Capsule()
                    .frame(width: value > 200 ? CGFloat(200) : CGFloat(value), height: 20)
                    .foregroundColor(color)
            } //: ZStack
            Spacer()
        } //: HStack
    }
}

struct CustomChartView: View {

    let pokemon: Pokemon

    var body: some View {
        VStack {
            StatsCapsuleView(value: pokemon.model.height, title: "Height", color: pokemon.color)
            StatsCapsuleView(value: pokemon.model.weight, title: "Weight", color: pokemon.color)
            StatsCapsuleView(value: pokemon.model.attack, title: "Attack", color: pokemon.color)
            StatsCapsuleView(value: pokemon.model.defense, title: "Defense", color: pokemon.color)
            StatsCapsuleView(value: pokemon.average, title: "Average", color: pokemon.color)

        }.padding()
    }
}


struct CapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        CustomChartView(pokemon: MOCK_POKEMON[0])
    }
}
