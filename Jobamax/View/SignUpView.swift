//
//  SignUpView.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 31/10/20.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    @State var email: String = ""
    @State var pwd: String = ""
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment:.center) {
                LogoView()
                    .padding(.bottom,10)
                    
                RoundedIconTextField(text: $name, textField: nameView, placeholder: "Name", imageName: "person")
                
                RoundedIconTextField(text: $email, textField: emailView, placeholder: "Email", imageName: "envelope")
                    
                RoundedIconTextField(text: $pwd, textField: passwordView, placeholder: "Password", imageName: "lock")
                
                if isLoading {
                    ProgressView()
                        .frame(width: 60, height: 60, alignment: .center)
                }else {
                    HStack { }
                        .frame(width: 68, height: 68, alignment: .center)
                }
                
                AccentButton(title: "SIGN UP") {
                    isLoading.toggle()
                }
                Spacer()
            }.navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
            }))
        }.onAppear {
            
        }
    }
}

extension SignUpView {
    
    private var nameView: some View {
        TextField("Name", text: $name)
            .keyboardType(.default)
            .autocapitalization(.words)
    }
    
    private var emailView: some View {
        TextField("Email", text: $email)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            
    }

    private var passwordView: some View {
        SecureField("Password", text: $pwd)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
