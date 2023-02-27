//
//  PersonneRow.swift
//  Lunabee
//
//  Created by Heesham on 2/18/23.
//

import SwiftUI

struct PersonneRow: View {
    var personne: Personne
    
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: personne.picture.medium),
                content: { image in
                    image.resizable()
                         .frame(width: 50, height: 50)
                         .clipShape(Circle())
                },
                placeholder: {
                    ProgressView()
                }
            )
            .padding(.trailing)

            VStack(alignment: .leading) {
                Text(personne.name.first + " " + personne.name.last)
                Text(personne.location.city + ", " + personne.location.country)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

struct PersonneRow_Previews: PreviewProvider {
    static var previews: some View {
        PersonneRow(personne: personnes[0])
    }
}
