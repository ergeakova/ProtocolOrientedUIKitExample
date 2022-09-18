//
//  UserViewModelOutput.swift
//  ProtocolOrientedUIKitExample
//
//  Created by Erge Gevher Akova on 18.09.2022.
//

import Foundation

protocol UserViewModelOutput: AnyObject{
    func updateView(name: String, email: String, userName: String)
}
