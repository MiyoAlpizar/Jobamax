//
//  LogoView.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 01/11/20.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Text("Jobamax")
            .font(.largeTitle)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color.accent)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
