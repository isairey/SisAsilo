//
//  VerifyCodeView.swift
//  RetoTC2007B
//

import SwiftUI

struct VerifyCodeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var code = ""
    
    @ObservedObject var authModel: AUTHModel
    
    var body: some View {
        
        ZStack {
            
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("BackButton")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Spacer()
                }
                .padding(.leading)
                
                Spacer()
                
                Image(systemName: "lock")
                    .font(.system(size: 150))
                    .foregroundColor(Color("Button"))
                
                Spacer()
                
                CustomTextFieldView(type: "Text", imageName: "number", placeholder: "Ingrese su código", text: $code)
                
                Spacer()
                
                // Recuperar Contraseña button
                NavigationLink {
                    NewPasswordView(authModel: authModel)
                } label: {
                    Text("Verificar")
                        .frame(width: 250, height: 70, alignment: .center)
                        .font(Font.custom("Poppins-SemiBold", size: 25))
                        .tracking(1.8)
                }
                .foregroundColor(.black)
                .background(Color("Button"))
                .cornerRadius(15)
                .shadow(radius: 4, x: 0, y: 4)
                .padding()
                
                Spacer()
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct VerifyCodeView_Previews: PreviewProvider {
    static var previews: some View {
        VerifyCodeView(authModel: AUTHModel())
    }
}
