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
                NavigationLink(destination: RegisterView)
            }
        }
    }
}

#Preview {
    MainView()
}
