//
//  UserModel.swift
//  ProtocolOrientedUIKitExample
//
//  Created by Erge Gevher Akova on 17.09.2022.
//

import Foundation


struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat, lng: String
}

struct Company: Codable {
    let name, catchPhrase, bs: String
}

