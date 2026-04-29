//
//  DimensionCardView.swift
//  RetoTC2007B
//

import SwiftUI

struct DimensionCardView: View {
    
    var dimensionName: String = ""
    var dimensionIcon: String = ""
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .frame(width: 350, height: 140)
                .foregroundColor(.white)
                .cornerRadius(20)
            HStack {
                //                                    Spacer()
                VStack(alignment: .leading) {
                    Image(systemName: dimensionIcon)
                        .font(.system(size: 30))
                        .padding(.bottom)
                    Text(dimensionName)
                        .font(.system(size: 20))
                        .bold()
                }
                Spacer()
                Image(systemName: "greaterthan")
                    .font(.system(size: 20))
                //                                    Spacer()
                
            }
            .foregroundColor(.black)
            .frame(maxWidth: 300, minHeight: 140)
        }
        
    }
}

struct DimensionCardView_Previews: PreviewProvider {
    static var previews: some View {
        DimensionCardView(dimensionName: "Cognitiva", dimensionIcon: "brain.head.profile")
    }
}
