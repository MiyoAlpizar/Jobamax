//
//  ActivityIndicatorView.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 01/11/20.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
}

