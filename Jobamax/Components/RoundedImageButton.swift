//
//  RoundedImageButton.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 31/10/20.
//

import SwiftUI

struct RoundedImageButton: View {
    let image: String
    let title: String
    var action: () -> Void = { }
    let buttonHeight: CGFloat = 44
    let buttonWidth: CGFloat = UIScreen.width - 40
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                    
                Spacer()
                Text(title)
                    .foregroundColor(.black)
                    .font(.body)
                Spacer()
            }
        }).padding()
        .frame(width: buttonWidth,height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.black.opacity(0.4), lineWidth: 1))
    }
}

struct RoundedImageButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImageButton(image: "facebook", title: "LOGIN")
    }
}
