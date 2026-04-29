//
//  ProgressView.swift
//  RetoTC2007B
//

import SwiftUI

struct ProgressBar: View {
    
    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 69
    var total: CGFloat = 100
    var color1 = Color(.gray)
    var color2 = Color(.blue)
    
    var body: some View {
        
        let multiplier = width/total
        
        ZStack(alignment: .leading) {
            RoundedRectangle (cornerRadius: height, style: .continuous)
                . frame (width: width, height: height)
                .foregroundColor (Color.black.opacity(0.1))
            
            RoundedRectangle (cornerRadius: height, style: .continuous)
                .frame (width: percent * multiplier, height: height)
                .background (
                    LinearGradient (gradient: Gradient (colors: [color1, color2]), startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle (cornerRadius: height , style: .continuous))
                )
                .foregroundColor (.clear)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
