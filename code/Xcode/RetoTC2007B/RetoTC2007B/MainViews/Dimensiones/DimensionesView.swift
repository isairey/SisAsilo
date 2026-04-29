//
//  DimensionesView.swift
//  RetoTC2007B
//

import SwiftUI

struct DimensionesView: View {
    
    let dimensiones = [("Cognitiva", "brain.head.profile"), ("Funcionalidad", "figure.walk"), ("Afectivo", "face.smiling"), ("Desempeño Físico", "figure.run"), ("Riesgo Social", "person.3.fill")]
    
    @ObservedObject var examsModel: EXAMSModel
    @Binding var newResults: Bool
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color("Background")
                    .ignoresSafeArea()
                
                ScrollView {
                    ForEach(dimensiones, id: \.0) { dimension in
                        NavigationLink {
                            PruebasView(dimension: dimension.0, examsModel: examsModel, newResults: $newResults)
                        } label: {
                            DimensionCardView(dimensionName: dimension.0, dimensionIcon: dimension.1)
                        }
                    }
                    .padding(.top)
                }
                .scrollIndicators(.hidden)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Dimensiones")
                        .font(Font.custom("Poppins-SemiBold", size: 30))
                        .accessibilityAddTraits(.isHeader)
                        .fixedSize()
                }
            }
        }
    }
}

struct DimensionesView_Previews: PreviewProvider {
    static var previews: some View {
        DimensionesView(examsModel: EXAMSModel(), newResults: .constant(false))
    }
}
