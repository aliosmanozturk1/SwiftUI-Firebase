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
    @StateObject private var profileViewModel = ProfileViewModel()
    
    @State private var isUserLoggedIn = false
    
    var body: some View {
        Group {
            if !isUserLoggedIn {
                OnboardingView()
            }
            else {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "turkishlirasign.square")
                            Text("Cüzdan")
                        }
                    ProfileView(profileViewModel: profileViewModel)
                        .tabItem {
                            Image(systemName: "person.3.fill")
                            Text("Topluluk")
                        }
                }
            }
            
        }
        .onAppear(perform: checkLoginStatus)
    }
    
    private func checkLoginStatus() {
            FirebaseManager.shared.auth.addStateDidChangeListener { auth, user in
                self.isUserLoggedIn = user != nil
            }
        }
}

#Preview {
    MainView()
}
