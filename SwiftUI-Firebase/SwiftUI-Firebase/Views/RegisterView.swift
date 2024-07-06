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
            
            Spacer()
            Text("Register")
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
            
            Spacer()
            
            TextField("Email", text: $registerViewModel.email)
                .autocapitalization(.none)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.25).cornerRadius(10))
            
            TextField("First Name", text: $registerViewModel.firstName)
                .autocapitalization(.none)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.25).cornerRadius(10))
            
            TextField("Last Name", text: $registerViewModel.lastName)
                .autocapitalization(.none)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.25).cornerRadius(10))
            
            SecureField("Enter your password", text: $registerViewModel.password)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.25).cornerRadius(10))
                
                
            Button {
                registerViewModel.register()
            } label: {
                Text("Register")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color(red: 0.12, green: 0.14, blue: 0.17))
                    .cornerRadius(8)
                
            }
            
            Spacer()
            
            Text("Or Login with")
                .font(.callout)
                .fontWeight(.medium)
            
            HStack() {
                Button {
                    registerViewModel.register()
                } label: {
                    Image("FacebookIcon")
                        .resizable()
                        .scaledToFit()
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                        .frame(width: 105, height: 56)
                        .cornerRadius(8)
                        .overlay(
                          RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.50)
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                        )
                }
                
                
                Button {
                    registerViewModel.register()
                } label: {
                    Image("GoogleIcon")
                        .resizable()
                        .scaledToFit()
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                        .frame(width: 105, height: 56)
                        .overlay(
                          RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.50)
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                        )
                    
                }
                
                
                Button {
                    registerViewModel.register()
                } label: {
                    Image("AppleIcon")
                        .resizable()
                        .scaledToFit()
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                        .frame(width: 105, height: 56)
                        .cornerRadius(8)
                        .overlay(
                          RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.50)
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                        )
                }
            }
            
            Spacer()
            
            if !registerViewModel.errorMessage.isEmpty {
                Text(registerViewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    RegisterView(registerViewModel: RegisterViewModel())
}


/*
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
 
 */
