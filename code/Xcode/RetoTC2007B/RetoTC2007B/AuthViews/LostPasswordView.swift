//
//  LostPasswordView.swift
//  RetoTC2007B
//

import SwiftUI

struct LostPasswordView: View {
    
    @Environment(\.presentationMode) var mode
    @State private var email = ""
    
    @ObservedObject var authModel: AUTHModel
    
    var body: some View {
        ZStack {
            
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("BackButton")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Spacer()
                }
                .padding(.leading)
                
                Spacer()
                
                Image(systemName: "envelope")
                    .font(.system(size: 150))
                    .foregroundColor(Color("Button"))
                
                Spacer()
                
                
                // Email
                CustomTextFieldView(type: "Text", imageName: "envelope", placeholder: "name@email.com", text: $email)
                
                Spacer()
                
                // Recuperar Contraseña button
                NavigationLink {
                    VerifyCodeView(authModel: authModel)
                } label: {
                    Text("Recuperar Contraseña")
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

struct LostPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        LostPasswordView(authModel: AUTHModel())
    }
}
