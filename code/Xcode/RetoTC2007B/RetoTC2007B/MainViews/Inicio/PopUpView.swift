//
//  PopUpView.swift
//  RetoTC2007B
//

import SwiftUI

struct PopUpView : View {
    
    @Binding var name: String
    
    var body: some View {
        ZStack(alignment: .center) {
            Text("\(name)")
                .font(Font.custom("Apercu Light", size: 20))
                .padding()
        }
        .background(Color.white)
        .cornerRadius(15)
        .padding()
    }
}

struct PopUpView_Previews: PreviewProvider {
    static var previews: some View {
        PopUpView(name: .constant("Hello"))
    }
}
