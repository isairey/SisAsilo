//
//  PruebasView.swift
//  RetoTC2007B
//

import SwiftUI

struct PruebasView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var dimension: String
    @ObservedObject var examsModel: EXAMSModel
    
    // Aqui revisamos cuales pruebas seran de tipo Y/N Button o tipo Radio Button
    var ynQuestions: [String] = ["ADGY"]
    var radioQuestions: [String] = ["KATZ", "LW&B", "SARC-F", "VSG", "CFS"]
    var nonWorkingQuestions: [String] = ["MMSE", "PR", "SPPB"]
    
    @Binding var newResults: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                ScrollView{
                    ForEach(examsModel.exams) { pruebas in
                        if pruebas.dimension == dimension {
                            NavigationLink {
                                
                                // If la prueba es Y/N nos vamos al view con Y/N
                                if ynQuestions.contains(pruebas.initials){
                                    PreguntasYNView(examID: pruebas.id, initials: pruebas.initials, newResults: $newResults)
                                }
                                // Else if la prueba es de Radio Button nos vamos al view con Radio Buttons
                                else if radioQuestions.contains(pruebas.initials){
                                    PreguntasRadioView(examID: pruebas.id, initials: pruebas.initials, newResults: $newResults)
                                } else {
                                    NoPreguntasView()
                                }
                                
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 350, height: 140)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                    HStack {
                                        //                                    Spacer()
                                        VStack(alignment: .leading) {
                                            Image(systemName: "checkmark.circle")
                                                .font(.system(size: 30))
                                                .padding(.bottom)
                                            Text(pruebas.name)
                                                .font(.system(size: 15))
                                                .multilineTextAlignment(.leading)
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
                    }
                    .padding(.top)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Pruebas")
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

struct PruebasView_Previews: PreviewProvider {
    static var dim: String = ""
    static var previews: some View {
        PruebasView(dimension: dim, examsModel: EXAMSModel(), newResults: .constant(false))
    }
}
