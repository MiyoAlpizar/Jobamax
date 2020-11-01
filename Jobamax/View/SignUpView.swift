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
    @State private var isAlertPresented = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var alertOkButton = "Accept"
    
    
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
                    validateSignUp()
                }
                Spacer()
            }.navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
            }))
        }.onAppear {
            
        }.alert(isPresented: $isAlertPresented, content: {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text(alertOkButton)))
        })
    }
}

extension SignUpView {
    func validateSignUp() {
        if isLoading { return }
        
        guard name.isMoreThan(characters: 2) else {
            alert(title: "Invalid name", message: "Name must be more than 2 characters long")
            return
        }
        
        guard email.isEmail() else {
            alert(title: "Email not valid", message: "You must enter a valid email")
            return
        }
        
        guard pwd.isMoreThan(characters: 5) else {
            alert(title: "Invalid password", message: "Password must be more than 6 characters long")
            return
        }
        isLoading = true
        
        
        AuthService.shared.signUp(with: email, password: pwd) { (result) in
            switch result {
            case .success(let uid):
                print(uid)
            case .failure(let error):
                alert(title: "Error trying to signup", message: error.localizedDescription)
            }
            isLoading = false
        }
    }
    
    func alert(title: String, message: String, dismissButton: String = "Accept") {
        alertTitle = title
        alertMessage = message
        alertOkButton = dismissButton
        isAlertPresented = true
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
