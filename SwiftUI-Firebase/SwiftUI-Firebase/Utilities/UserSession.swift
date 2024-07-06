//
//  UserSession.swift
//  SwiftUI-Firebase
//
//  Created by Ali Osman Öztürk on 6.07.2024.
//

import Foundation

class UserSession: ObservableObject {
    static let shared = UserSession()
    
    @Published var isLoggedOut: Bool = false
}
