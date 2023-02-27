//
//  Personne.swift
//  Lunabee
//
//  Created by Heesham on 2/18/23.
//

import Foundation

struct Personne: Codable {
    var name: Name
    var email: String
    var phone: String
    var picture: Picture
    var location: Location
}

struct Name: Codable {
    var title: String
    var first: String
    var last: String
}

struct Picture: Codable {
    var large: String
    var medium: String
    var thumbnail: String
}

struct Location: Codable {
    var city: String
    var country: String
}
