//
//  NoPreguntasView.swift
//  RetoTC2007B
//

import SwiftUI

struct NoPreguntasView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color("Background")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Esta prueba no se puede realizar a través de la aplicación.")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("BackButton")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                    }
            }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct NoPreguntasView_Previews: PreviewProvider {
    static var previews: some View {
        NoPreguntasView()
    }
}
