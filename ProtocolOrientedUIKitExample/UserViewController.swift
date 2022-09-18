//
//  ViewController.swift
//  ProtocolOrientedUIKitExample
//
//  Created by Erge Gevher Akova on 17.09.2022.
//

import UIKit

class UserViewController: UIViewController, UserViewModelOutput {
    
    private let userViewModel: UserViewModel
    
    func updateView(name: String, email: String, userName: String) {
        self.lblName.text = name
        self.lblUsername.text = userName
        self.lblEmail.text = email
    }
    
    private let lblName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let lblUsername: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let lblEmail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    init(userViewModel: UserViewModel){
        self.userViewModel = userViewModel
        super.init(nibName: nil, bundle: nil)
        self.userViewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        userViewModel.fetchUser()
    }
    
    func setupViews(){
        view.backgroundColor = .lightGray
        view.addSubview(lblName)
        view.addSubview(lblUsername)
        view.addSubview(lblEmail)
        
        NSLayoutConstraint.activate(
            [
                lblName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                lblName.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                lblName.heightAnchor.constraint(equalToConstant: 60),
                lblName.widthAnchor.constraint(equalToConstant: 200),
                
                lblUsername.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                lblUsername.topAnchor.constraint(equalTo: lblName.bottomAnchor),
                lblUsername.heightAnchor.constraint(equalToConstant: 60),
                lblUsername.widthAnchor.constraint(equalToConstant: 200),
                
                lblEmail.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                lblEmail.topAnchor.constraint(equalTo: lblUsername.bottomAnchor),
                lblEmail.heightAnchor.constraint(equalToConstant: 60),
                lblEmail.widthAnchor.constraint(equalToConstant: 200),
            ]
        )
    }
    
}

