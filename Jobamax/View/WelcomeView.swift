//
//  WelcomeView.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 31/10/20.
//

import SwiftUI



struct WelcomeView: View {
    @EnvironmentObject var session: SessionStore
    
    @State private var showingAlert = false
    @State private var isSignUpPresented = false
    @State private var isLoginPresented = false
    
    var body: some View {
        VStack {
            LogoView()
                .padding(.top, 40)
            
            Spacer()
            
            RoundedImageButton(image: "facebook", title: "Login with Facebook") {}
            RoundedImageButton(image: "linkedin", title: "Login with Linkedin") {}
            RoundedImageButton(image: "mail", title: "Login with Gmail") {}
            
            Text("Or").padding(.vertical, 40)
            
            AccentButton(title: "Sign Up") {
                isSignUpPresented = true
            }.fullScreenCover(isPresented: $isSignUpPresented, content: {
                SignUpView().environmentObject(session)
            })
            
            Spacer()
            
            HStack {
                Text("Already have an account?")
                Button(action: {
                    isLoginPresented = true
                }, label: {
                    Text("Login")
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }).fullScreenCover(isPresented: $isLoginPresented,content: {
                    LoginView().environmentObject(session)
                })
                
            }.padding(.bottom, 35)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
