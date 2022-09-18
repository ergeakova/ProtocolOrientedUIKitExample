//
//  UserViewModel.swift
//  ProtocolOrientedUIKitExample
//
//  Created by Erge Gevher Akova on 18.09.2022.
//

import Foundation

class UserViewModel {
    
    private let userService: UserService
    weak var output: UserViewModelOutput?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUser(){
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.output?.updateView(name: user.name, email: user.email, userName: user.username)
               print(user)
            case .failure:
                self?.output?.updateView(name: "No User", email: "", userName: "")
                print("error")
            }
            
        }
        
    }
    
}
