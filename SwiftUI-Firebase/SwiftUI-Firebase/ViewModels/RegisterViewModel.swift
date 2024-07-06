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
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var errorMessage = ""
    @Published var isRegistered = false

    
    func register() {
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else if let result = result {
                self.isRegistered = true
                self.storeUserInformation()
                
                print("Successfully logged in as user: \(result.user.uid)")
            }
        }
    }
    
    func storeUserInformation() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let userData = ["uid": uid, "email": email, "firstName": firstName, "lastName": lastName]
        FirebaseManager.shared.firestore
            .collection("users")
            .document(uid)
            .setData(userData)
    }
}
