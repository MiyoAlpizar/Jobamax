//
//  WelcomeView.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 31/10/20.
//

import SwiftUI

enum FullScreenType {
    case login
    case signup
}

struct WelcomeView: View {
    @EnvironmentObject var session: SessionStore
    
    @State private var showingAlert = false
    @State private var isFullScreenPresented = false
    @State private var fullScreenType: FullScreenType = .login
    
    var body: some View {
        VStack {
            LogoView()
                .padding(.top, 40)
            
            Spacer()
            
            RoundedImageButton(image: "facebook", title: "LOG IN WITH FACEBOOK") {}
            RoundedImageButton(image: "linkedin", title: "LOG IN WITH LINKEDIN") {}
            RoundedImageButton(image: "mail", title: "LOG IN WITH GMAIL") {}
            
            Text("OR").padding(.vertical, 40)
            
            AccentButton(title: "SIGN UP") {
                fullScreenType = .signup
                isFullScreenPresented = true
            }
            
            Spacer()
            
            HStack {
                Text("Already have an account?")
                
                Button(action: {
                    fullScreenType = .login
                    isFullScreenPresented = true
                }, label: {
                    Text("Login")
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
                
            }.padding(.bottom, 35)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .fullScreenCover(isPresented: $isFullScreenPresented, content: {
            switch fullScreenType {
            case .login:
                LoginView().environmentObject(session)
            case .signup:
                SignUpView().environmentObject(session)
            }
        })
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
