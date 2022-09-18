//
//  ProtocolOrientedUIKitExampleTests.swift
//  ProtocolOrientedUIKitExampleTests
//
//  Created by Erge Gevher Akova on 17.09.2022.
//

import XCTest
@testable import ProtocolOrientedUIKitExample

class ProtocolOrientedUIKitExampleTests: XCTestCase {
    
    private var sutUserViewModel: UserViewModel!
    private var sutUserService: MockUserService!
    private var sutOutput: MockUserViewOutput!
    
    override func setUpWithError() throws {
        sutUserService = MockUserService()
        sutUserViewModel = UserViewModel(userService: sutUserService)
        sutOutput = MockUserViewOutput()
        sutUserViewModel.output = sutOutput
    }
    
    override func tearDownWithError() throws {
        sutOutput = nil
        sutUserService = nil
        sutUserViewModel = nil
    }
    
    func testUpdateView_whenAPISuccess_showsEmailNameUsername() throws {
        let mockUser = User(id: 1, name: "erge", username: "ergeakova", email: "ergeak@gmail.com", address: Address(street: "a", suite: "b", city: "c", zipcode: "d", geo: Geo(lat: "123", lng: "321")), phone: "+95001234567", website: "www.ergeakova.com", company: Company(name: "erge", catchPhrase: "erge", bs: "erge"))
        
        sutUserService.fetchUserMaockResult = .success(mockUser)
        sutUserViewModel.fetchUser()
        
        XCTAssertEqual(sutOutput.updateViewArray.first?.username, "ergeakova")
    }
    
    func testUpdateView_whenAPIFailure_NoUser() throws {
        sutUserService.fetchUserMaockResult = .failure(NSError())
        sutUserViewModel.fetchUser()
        XCTAssertEqual(sutOutput.updateViewArray.first?.name, "No User")
    }
}

class MockUserService: UserService{
    var fetchUserMaockResult: Result<ProtocolOrientedUIKitExample.User, Error>?
    func fetchUser(completion: @escaping (Result<ProtocolOrientedUIKitExample.User, Error>) -> Void) {
        if let result = fetchUserMaockResult{
            completion(result)
        }
    }
}

class MockUserViewOutput: UserViewModelOutput {
    var updateViewArray: [(name:String, username: String, email: String)] = []
    func updateView(name: String, email: String, userName: String) {
        updateViewArray.append(( name,userName,email))
    }
}
