//
//  LoginView.swift
//  RetoTC2007B
//

import SwiftUI

struct LoginView: View {
    
    // Username & Password
    @State private var username = ""
    @State private var password = ""
    
    // UserID var
    @AppStorage("userID") var userID: Int?
    
    // ObservedObjects
    @ObservedObject var authModel: AUTHModel
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color("Background")
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    
                    // Abuelitos ABP
                    HStack {
                        Text("Abuelitos")
                            .font(Font.custom("Recoleta-SemiBold", size: 60))
                        Text("ABP")
                            .font(Font.custom("Recoleta-SemiBold", size: 15))
                            .padding(.top, 23)
                    }
                    .padding(.vertical, 20)
                    
                    Text("TAMIZAJE")
                        .font(Font.custom("Recoleta-SemiBold", size: 30))
                        .padding(.bottom)
                    
                    // Username
                    CustomTextFieldView(type: "Text", imageName: "person", placeholder: "Usuario", text: $username)
                    
                    // password
                    CustomTextFieldView(type: "Secure", imageName: "lock", placeholder: "Constraseña", text: $password)
                    
                    // Lost Password
                    NavigationLink {
                        LostPasswordView(authModel: authModel)
                    } label: {
                        Text("Olvidaste tu contraseña?")
                            .foregroundColor(.gray)
                            .font(Font.custom("Classic Grotesque", size: 20))
                    }
                    .padding()
                    
                    // Sign In button
                    Button {
                        verifyAcc(username: username, password: password)
                    } label: {
                        Text("Iniciar Sesión")
                            .frame(width: 250, height: 70, alignment: .center)
                            .font(Font.custom("Poppins-SemiBold", size: 25))
                            .tracking(1.8)
                    }
                    .foregroundColor(.black)
                    .background(Color("Button"))
                    .cornerRadius(15)
                    .shadow(radius: 4, x: 0, y: 4)
                    .padding()

                    
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    func verifyAcc(username: String, password: String) {
        
        for auth in authModel.auths {
            if username == auth.email && password == auth.password {
                userID = auth.id
                return
            }
        }
        return
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authModel: AUTHModel())
    }
}
