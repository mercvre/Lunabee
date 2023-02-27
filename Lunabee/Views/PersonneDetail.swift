//
//  PersonneDetail.swift
//  Lunabee
//
//  Created by Heesham on 2/18/23.
//

import SwiftUI

struct PersonneDetail: View {
    var personne: Personne
    var body: some View {
        VStack {
            
            HStack {
                AsyncImage(
                    url: URL(string: personne.picture.large),
                    content: { image in
                        image.resizable()
                             .frame(width: 150, height: 150)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                VStack(alignment: .leading) {
                    Text(personne.name.first + " " + personne.name.last)
                    .font(.title)
                    Text(personne.location.city + ", " + personne.location.country)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            Divider()
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Email")
                        .foregroundColor(.secondary)
                        .frame(width: 100, alignment: .trailing)
                    Text(personne.email)
                }.padding(.top)
                
                HStack {
                    Text("Phone")
                        .foregroundColor(.secondary)
                        .frame(width: 100, alignment: .trailing)
                    Text(personne.phone)
                }.padding(.top)
            }
            
            Spacer()
            
        }
        .navigationTitle(personne.name.first)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

struct PersonneDetail_Previews: PreviewProvider {
    static var previews: some View {
        PersonneDetail(personne: personnes[0])
    }
}
