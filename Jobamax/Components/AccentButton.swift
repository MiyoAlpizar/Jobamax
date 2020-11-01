//
//  AccentButton.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 31/10/20.
//

import SwiftUI

struct AccentButton: View {
    let title: String
    var action: () -> Void = { }
    let buttonHeight: CGFloat = 44
    let buttonWidth: CGFloat = UIScreen.width - 40
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.accentDark, Color.accentLight]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        Button(action: {}, label: {
            Text(title)
                .foregroundColor(.white)
        }).padding()
        .frame(width: buttonWidth,height: self.buttonHeight)
        .background(Capsule().fill(gradient))
    }
}

struct AccentButton_Previews: PreviewProvider {
    static var previews: some View {
        AccentButton(title: "SIGN UP")
    }
}
