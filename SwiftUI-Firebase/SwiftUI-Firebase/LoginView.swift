//
//  LoginView.swift
//  SwiftUI-Firebase
//
//  Created by Ali Osman Öztürk on 3.07.2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $loginViewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $loginViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Login") {
                loginViewModel.login()
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            if !loginViewModel.errorMessage.isEmpty {
                Text(loginViewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .navigationTitle("Login")
    }
}

#Preview {
    LoginView(loginViewModel: LoginViewModel())
}
