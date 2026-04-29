//
//  CustomTextFieldView.swift
//  RetoTC2007B
//

import SwiftUI

struct CustomTextFieldView: View {
    
    let type: String
    let imageName: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if type == "Text" {
                    TextField(placeholder, text: $text)
                        .textInputAutocapitalization(.never)
                } else if type == "Secure" {
                    SecureField(placeholder, text: $text)
                        .textInputAutocapitalization(.never)
                }
                
            }
            
            Divider()
                .background(Color(.darkGray))
        }
        .padding(.horizontal, 32)        
        
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(type: "Text", imageName: "envelope", placeholder: "Email", text: .constant(""))
    }
}
