//
//  DimensionScoreView.swift
//  RetoTC2007B
//

import SwiftUI

struct DimensionScoreView: View {
    
    let name: String
    let score: Double
    let initials: String
    
    @ObservedObject var userModel: USERSModel
    
    var body: some View {
        
        ZStack {
//            Color(.red)
            HStack {
                Image(systemName: "info.circle")
                    .font(.system(size: 40))
                    .fontWeight(.light)
                    .padding(.horizontal)
                    .foregroundColor(Color(.systemBlue))
                
                Text("\(initials): \(turnToString(score: score))")
                    .font(Font.custom("Poppins-SemiBold", size: 25))
                    .foregroundColor(.black)
                
                Spacer()
                
            }
            .frame(width: 350, height: 90)
            .background(Color.white)
            .cornerRadius(20)
            
            HStack {
                
                Spacer()
                
                Image(getImageLight(initial: initials, score: score, genero: userModel.getGenero()))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .if(score == 999) { view in
                        view.blur(radius: 10)
                    }
            }
            
        }
        
    }
}

struct DimensionScoreView_Previews: PreviewProvider {
    static var previews: some View {
        DimensionScoreView(name: "KATZ", score: 999, initials: "KATZ", userModel: USERSModel())
    }
}
