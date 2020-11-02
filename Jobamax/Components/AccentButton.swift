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
    
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.accentDark, Color.accentLight]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(.white)
                .background(gradient)
                .cornerRadius(25)
        }).padding()
        
    }
}

struct AccentButton_Previews: PreviewProvider {
    static var previews: some View {
        AccentButton(title: "SIGN UP")
    }
}
