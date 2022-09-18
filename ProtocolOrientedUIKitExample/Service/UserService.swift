//
//  UserService.swift
//  ProtocolOrientedUIKitExample
//
//  Created by Erge Gevher Akova on 18.09.2022.
//

import Foundation

protocol UserService {
    func fetchUser(completion: @escaping(Result<User, Error>) -> Void)
}
