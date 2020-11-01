//
//  WelcomeView.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 31/10/20.
//

import SwiftUI

struct WelcomeView: View {
    let buttonHeight: CGFloat = 44
    let buttonWidth: CGFloat = UIScreen.width - 40
    var body: some View {
        VStack {
            Text("Jobamax")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.accent)
            
            Spacer()
            Button(action: {}, label: {
                HStack {
                    Image("facebook")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        
                    Spacer()
                    Text("LOG IN WITH FACEBOOK")
                        .foregroundColor(.black)
                        .font(.body)
                    Spacer()
                }
            }).padding()
            .frame(width: buttonWidth,height: self.buttonHeight)
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.black.opacity(0.4), lineWidth: 1))
            
            Button(action: {}, label: {
                HStack {
                    Image("linkedin")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        
                    Spacer()
                    Text("LOG IN WITH LINKEDIN")
                        .foregroundColor(.black)
                        .font(.body)
                    Spacer()
                }
            }).padding()
            .frame(width: buttonWidth,height: self.buttonHeight)
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.black.opacity(0.4), lineWidth: 1))
            
            Button(action: {}, label: {
                HStack {
                    Image("mail")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                    Spacer()
                    Text("LOG IN WITH GMAIL")
                        .foregroundColor(.black)
                        .font(.body)
                    Spacer()
                }
            }).padding()
            .frame(width: buttonWidth,height: self.buttonHeight)
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color.black.opacity(0.4), lineWidth: 1))
            
            Spacer()
        }.frame(width: UIScreen.main.bounds.width)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
