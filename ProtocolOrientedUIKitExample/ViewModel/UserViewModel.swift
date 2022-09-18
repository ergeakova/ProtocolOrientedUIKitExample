//
//  UserViewModel.swift
//  ProtocolOrientedUIKitExample
//
//  Created by Erge Gevher Akova on 18.09.2022.
//

import Foundation

class UserViewModel {
    
    private let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUser(){
        
        userService.fetchUser { result in
            switch result {
            case .success(let user):
               print(user)
            case .failure:
                print("error")
            }
            
        }
        
    }
    
}
