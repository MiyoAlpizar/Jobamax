//
//  RoundedIconTextField.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 01/11/20.
//

import SwiftUI

struct RoundedIconTextField<TextFieldView>: View where TextFieldView: View {
    @Binding var text: String
    let textField: TextFieldView
    var imageName: String? = nil
    
    private var isTextFieldWithIcon: Bool {
        return imageName != nil
    }
    
    var body: some View {
        HStack {
            if isTextFieldWithIcon {
                iconImageView
            }
            underlineTextFieldView
        }.padding(.bottom,10)
    }
}

extension RoundedIconTextField {
    private var iconImageView: some View {
        Image(systemName: imageName ?? "")
            .frame(width: 32, height: 32)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .foregroundColor(.accent)
    }
    
    private var underlineTextFieldView: some View {
        VStack {
            ZStack(alignment: .leading) {
                textField
                    .padding(.trailing, 16)
                    .padding(.leading, isTextFieldWithIcon ? 0 : 16)
            }
            underlineView
        }
    }
    
   
    
    private var underlineView: some View {
        Rectangle().frame(height: 1)
            .foregroundColor(Color.bgContrast)
            .padding(.trailing, 16)
            .padding(.leading, isTextFieldWithIcon ? 0 : 16)
    }
}

struct RoundedIconTextField_Previews: PreviewProvider {
    static var previews: some View {
        RoundedIconTextField(text: .constant("E-mail"), textField: TextField("E-mail", text: .constant("miyo.naval@gmail.com")), imageName: "envelope")
    }
}
