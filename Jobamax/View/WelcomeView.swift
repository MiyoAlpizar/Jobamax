//
//  WelcomeView.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 31/10/20.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Text("Jobamax")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.accent)
                .padding(.top, 40)
            
            Spacer()
            
            RoundedImageButton(image: "facebook", title: "LOG IN WITH FACEBOOK") {
                self.showingAlert = true
            }
            
            RoundedImageButton(image: "linkedin", title: "LOG IN WITH LINKEDIN") {
                
            }
            
            RoundedImageButton(image: "mail", title: "LOG IN WITH GMAIL") {
                
            }
            Text("OR")
                .padding(.vertical, 40)
            AccentButton(title: "SIGN UP") {
                
            }
            Spacer()
            HStack {
                Text("Already have an account?")
                Button(action: {}, label: {
                    Text("Login")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                })
            }.padding(.bottom, 35)
        }.frame(width: UIScreen.main.bounds.width)
        .alert(isPresented:$showingAlert) {
                    Alert(title: Text("Are you sure you want to delete this?"), message: Text("There is no undo"), primaryButton: .destructive(Text("Delete")) {
                            print("Deleting...")
                    }, secondaryButton: .cancel())
                }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
