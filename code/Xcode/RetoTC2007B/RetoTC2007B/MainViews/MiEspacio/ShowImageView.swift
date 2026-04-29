//
//  ShowImageView.swift
//  RetoTC2007B
//
//  Created by Marcelo Marquez M on 20/10/22.
//

import SwiftUI

struct ShowImageView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var image: Data
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color("Background")
                    .ignoresSafeArea()
                
                Image(uiImage: UIImage(data: image)!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .shadow(radius: 8)
                                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Imagen")
                        .font(Font.custom("Poppins-SemiBold", size: 30))
                        .accessibilityAddTraits(.isHeader)
                        .fixedSize()
                }
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
        .navigationBarBackButtonHidden(true)
        
    }
}
