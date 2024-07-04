//
//  MainView.swift
//  SwiftUI-Firebase
//
//  Created by Ali Osman Öztürk on 3.07.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var loginViewModel = LoginViewModel()
    @StateObject private var registerViewModel = RegisterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: RegisterView(registerViewModel: RegisterViewModel())) {
                    Text("Register")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
                NavigationLink(destination: LoginView(loginViewModel: LoginViewModel())) {
                       Text("Login")
                           .padding()
                           .background(Color.green)
                           .foregroundColor(.white)
                           .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Firebase Auth")
        }
    }
}

#Preview {
    MainView()
}
