//
//  RegisterViewModel.swift
//  SwiftUI-Firebase
//
//  Created by Ali Osman Öztürk on 3.07.2024.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isRegistered = false
    
    func register() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else if let result = result {
                self.isRegistered = true
                let user = User(uid: result.user.uid, email: result.user.email)
                
                print("Successfully logged in as user: \(user)")
            }
        }
    }
}
