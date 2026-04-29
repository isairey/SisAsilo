//
//  NewPasswordView.swift
//  RetoTC2007B
//

import SwiftUI

struct NewPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var newPassword1 = ""
    @State private var newPassword2 = ""
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
                
                VStack(spacing: 50) {
                    
                    CustomTextFieldView(type: "Secure", imageName: "lock", placeholder: "Nueva Contraseña", text: $newPassword1)
                    
                    
                    CustomTextFieldView(type: "Secure", imageName: "lock", placeholder: "Confirmar Contraseña", text: $newPassword2)
                }
                
                Spacer()
                
                // Crear nueva contraseña button
                NavigationLink {
                    if verifyPassword(newPassword1: newPassword1, newPassword2: newPassword2) {
                        LoginView(authModel: authModel)
                    } else {
                        WrongPasswordView()
                    }
                } label: {
                    Text("Crear nueva contraseña")
                        .frame(width: 250, height: 70, alignment: .center)
                        .font(Font.custom("Poppins-SemiBold", size: 20))
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
    
    func verifyPassword(newPassword1: String, newPassword2: String) -> Bool {
        if newPassword1 == newPassword2 {
            return true
        }
        return false
    }
    
}

struct NewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NewPasswordView(authModel: AUTHModel())
    }
}
