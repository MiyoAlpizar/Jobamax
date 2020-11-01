//
//  LoadingView.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 01/11/20.
//

import SwiftUI

struct LoadingView: View {
    @State var isLoading: Bool
    var body: some View {
        if isLoading {
            ActivityIndicatorView()
        }else {
            ActivityIndicatorView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: false)
    }
}
