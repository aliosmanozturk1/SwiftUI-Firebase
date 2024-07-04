//
//  RegisterView.swift
//  SwiftUI-Firebase
//
//  Created by Ali Osman Öztürk on 3.07.2024.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var registerViewModel: RegisterViewModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $registerViewModel.email)
                .autocapitalization(.none)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $registerViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Register") {
                registerViewModel.register()
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            if !registerViewModel.errorMessage.isEmpty {
                Text(registerViewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .navigationTitle("Register")
    }
}

#Preview {
    RegisterView(registerViewModel: RegisterViewModel())
}
