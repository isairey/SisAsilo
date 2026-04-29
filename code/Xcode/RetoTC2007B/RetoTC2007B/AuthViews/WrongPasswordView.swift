//
//  WrongPasswordView.swift
//  RetoTC2007B
//
//  Created by Marcelo Marquez M on 22/10/22.
//

import SwiftUI

struct WrongPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            Text("Información incorrecta, intente de nuevo.")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("BackButton")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct WrongPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        WrongPasswordView()
    }
}
