//
//  ProfileViewModel.swift
//  SwiftUI-Firebase
//
//  Created by Ali Osman Öztürk on 5.07.2024.
//


import Foundation

class ProfileViewModel: ObservableObject {
    
    func logout() {
       try? FirebaseManager.shared.auth.signOut()
    }
}
