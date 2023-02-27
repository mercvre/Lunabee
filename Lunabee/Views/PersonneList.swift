//
//  PersonneList.swift
//  Lunabee
//
//  Created by Heesham on 2/18/23.
//

import SwiftUI

struct PersonneList: View {
    @State private var results = [Personne]()
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(searchResults.sorted(by: { (p1: Personne, p2: Personne) in
                    return p1.name.first < p2.name.first
                }), id: \.email) { personne in
                    NavigationLink {
                        PersonneDetail(personne: personne)
                    } label: {
                        PersonneRow(personne: personne)
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationTitle("Find a person")
        }
        .searchable(text: $searchText)
        
    }
    
    var searchResults: [Personne] {
        if searchText.isEmpty {
            return results
        } else {
            return results.filter { $0.name.first.lowercased().contains(searchText.lowercased()) || $0.name.last.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func loadData() {
          guard let url = URL(string: "https://jobapplicationtest.lunabee.studio/users") else {
                print("Link not valid")
              return
          }
          let request = URLRequest(url: url)

          URLSession.shared.dataTask(with: request) { data, response, error in
              if let data = data {
                  if let response = try? JSONDecoder().decode([Personne].self, from: data) {
                      DispatchQueue.main.async {
                          self.results = response
                      }
                      return
                  }
              }
          }.resume()
      }
    

}

struct PersonneList_Previews: PreviewProvider {
    static var previews: some View {
        PersonneList()
    }
}
