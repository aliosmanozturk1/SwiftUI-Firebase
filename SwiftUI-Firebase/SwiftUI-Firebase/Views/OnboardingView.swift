//
//  OnboardingView.swift
//  SwiftUI-Firebase
//
//  Created by Ali Osman Öztürk on 3.07.2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentPage) {
                    OnboardingPage(imageName: "star", title: "Welcome", description: "Welcome to our app!")
                        .tag(0)
                    OnboardingPage(imageName: "star.fill", title: "Discover", description: "Discover new features!")
                        .tag(1)
                    OnboardingPage(imageName: "heart", title: "Get Started", description: "Get started now!")
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.easeInOut, value: currentPage)
                
                HStack {
                    ForEach(0..<3) { index in
                        Circle()
                            .fill(index == currentPage ? Color.blue : Color.gray)
                            .frame(width: 10, height: 10)
                            .padding(.horizontal, 4)
                    }
                }
                .padding(.top, 20)
                .padding(.bottom, 40)
                
                if currentPage < 2 {
                    Button(action: {
                        withAnimation {
                            currentPage += 1
                        }
                    }) {
                        Text("Next Page")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                } else {
                    NavigationLink(destination: LoginView(loginViewModel: LoginViewModel())) {
                        Text("Get Started")
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarItems(trailing: Button("Skip All") {
                withAnimation {
                    currentPage = 2
                }
            })
        }
    }
}

struct OnboardingPage: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.top, 50)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}
