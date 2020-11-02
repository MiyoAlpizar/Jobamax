//
//  UIApplication+Extensions.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 01/11/20.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
