//
//  LoginView2.swift
//  SwiftUI-Firebase
//
//  Created by Ali Osman Öztürk on 4.07.2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                Text("Welcome! It's so good to see you.")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                
                Spacer()
                Spacer()
                
                TextField("Enter your email", text: $loginViewModel.email)
                    .autocapitalization(.none)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.25).cornerRadius(10))
                
                
                
                SecureField("Enter your password", text: $loginViewModel.password)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.25).cornerRadius(10))
                
                
                Button {
                    loginViewModel.login()
                } label: {
                    Text("Login")
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
                        loginViewModel.login()
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
                        loginViewModel.login()
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
                        loginViewModel.login()
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
                
                NavigationLink(destination: RegisterView(registerViewModel: RegisterViewModel())) {
                    Text("Don't have an account?")
                        .foregroundStyle(.black)
                    Text("Register now.")
                        .fontWeight(.bold)
                        .foregroundStyle(.blue)
                }
                .padding()
                
                
                
                if !loginViewModel.errorMessage.isEmpty {
                    Text(loginViewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    LoginView(loginViewModel: LoginViewModel())
}
