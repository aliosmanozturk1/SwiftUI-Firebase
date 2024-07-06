//
//  ProfileView.swift
//  SwiftUI-Firebase
//
//  Created by Ali Osman Öztürk on 5.07.2024.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    
    
    var body: some View {
        VStack {
            Button {
                profileViewModel.logout()
            } label: {
                Text("Logout")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(Color(red: 0.12, green: 0.14, blue: 0.17))
                    .cornerRadius(8)
                
            }
        }
        .padding()
    }
}

#Preview {
    ProfileView(profileViewModel: ProfileViewModel())
}
