//
//  SplashScreenView.swift
//  SwiftUI-Firebase
//
//  Created by Ali Osman Öztürk on 3.07.2024.
//

import SwiftUI
import Lottie

struct SplashScreenView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        if isActive {
            HomeView()
        } else {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                LottieView(animation: .named("Hello_Animation"))
                    .playing(loopMode: .playOnce)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.75) {
                    withAnimation {
                        self.isActive = true
                        
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
