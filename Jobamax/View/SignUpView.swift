//
//  SignUpView.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 31/10/20.
//

import SwiftUI

struct AlertInfo {
    var isAlertPresentig: Bool = false
    var title: String = ""
    var message: String = ""
    var cancelButtonText: String = "Ok"
}

struct SignUpView: View {
    
    @EnvironmentObject var session: SessionStore
    @Environment(\.presentationMode) var presentationMode
    
    @State var alertInfo = AlertInfo()
    
    @State var name: String = ""
    @State var email: String = ""
    @State var pwd: String = ""
    @State var isLoading: Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack(alignment:.center) {
                LogoView()
                    .padding(.bottom,10)
                
                RoundedIconTextField(text: $name, textField: nameView, imageName: "person")
                RoundedIconTextField(text: $email, textField: emailView, imageName: "envelope")
                RoundedIconTextField(text: $pwd, textField: passwordView, imageName: "lock")
                
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
            })).alert(isPresented: $alertInfo.isAlertPresentig, content: {
                Alert(title: Text(alertInfo.title), message: Text(alertInfo.message), dismissButton: .default(Text(alertInfo.cancelButtonText)))
            })
        }
    }
    
    func isInClose() {
        if session.session != nil {
            self.presentationMode.wrappedValue.dismiss()
        }
    }

}

extension SignUpView {
    func validateSignUp() {
        if isLoading { return }
        
        
        guard name.isMoreThan(characters: 2) else {
            alertInfo.title = "Name warning"
            alertInfo.message = "Name must have more than 2 characters"
            alertInfo.isAlertPresentig = true
            return
        }
        
        guard email.isEmail() else {
            alertInfo.title = "Email warning"
            alertInfo.message = "Please, write a valid Email"
            alertInfo.isAlertPresentig = true
            return
        }
        
        guard pwd.isMoreThan(characters: 5) else {
            alertInfo.title = "Password warning"
            alertInfo.message = "Password must be more tha 5 characteres"
            alertInfo.isAlertPresentig = true
            return
        }
        
        isLoading = true
        UIApplication.shared.endEditing()
        session.signUp(email: email, password: pwd) { (result, error) in
            if let error = error {
                alertInfo.title = "Error"
                alertInfo.message = error.localizedDescription
                alertInfo.isAlertPresentig = true
                return
            }else if result != nil {
                self.presentationMode.wrappedValue.dismiss()
            }
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
            .textContentType(.emailAddress)
    }
    
    private var passwordView: some View {
        SecureField("Password", text: $pwd)
            .textContentType(.password)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(SessionStore())
    }
}
