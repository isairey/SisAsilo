//
//  PreguntasYNView.swift
//  RetoTC2007B
//

import SwiftUI

struct PreguntasYNView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("userID") var userID: Int?
    var examID: Int
    
    @StateObject var questionsModel = QUESTIONSModel()
    
    var initials: String
    
    @State var totalSum: Double = 0
    
    @Binding var newResults: Bool
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color("Background")
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    HStack{
                        Text("Pregunta")
                            .font(.title2)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal)
                        Spacer()
                        HStack{
                            Text("Si")
                                .font(.title2)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.horizontal, 10)
                            Text("No")
                                .font(.title2)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.horizontal, 10)
                            
                        }
                        .padding(.trailing, 2)
                    }
                    .padding(.horizontal, 25)
                    .padding(.vertical)
                
                    ForEach(Array(questionsModel.questions.enumerated()), id: \.offset) {index, radio in
                        
                        VStack {
                            YNButtonGroup(items: radio.respuestas, question: radio.pregunta) { selected in
                                questionsModel.resultsCount[index] = radio.respuestas[selected].0
                            }
                            .padding(.horizontal)
                        }
                        
                    }
                    
                    Button {
                        print(questionsModel.resultsCount)
                        totalSum = questionsModel.resultsCount.reduce(0, +)
                        // llamamos el post
                        updateResults(userID: userID!, examID: examID, result: totalSum, location: "NoEspecificado", evaluator: "AbuelitosABP")
                        newResults = true
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Terminar")
                            .frame(width: 250, height: 70, alignment: .center)
                            .font(Font.custom("Poppins-SemiBold", size: 25))
                            .tracking(1.8)
                    }
                    .foregroundColor(.black)
                    .background(Color("Button"))
                    .opacity(iterateResultsCount() ? 0.5 : 1.0)
                    .cornerRadius(15)
                    .shadow(radius: 4, x: 0, y: 4)
                    .padding()
                    .disabled(iterateResultsCount())


                }
                
            }
            .scrollIndicators(.hidden)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(initials)
                        .font(Font.custom("Poppins-SemiBold", size: 30))
                        .accessibilityAddTraits(.isHeader)
                        .fixedSize()
                }
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
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            questionsModel.loadQUESTIONS(examID: examID)
        }
    }
    
    func iterateResultsCount() -> Bool{
        
        for result in questionsModel.resultsCount {
            if result == -1.0 {
                return true
            }
        }
        return false
    }
}

struct PreguntasYNView_Previews: PreviewProvider {
    static var previews: some View {
        PreguntasYNView(examID: 3, initials: "ADGY", newResults: .constant(false))
    }
}
