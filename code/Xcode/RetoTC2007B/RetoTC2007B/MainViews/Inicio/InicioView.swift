//
//  InicioView.swift
//  RetoTC2007B
//

import SwiftUI

struct InicioView: View {
    
    // Para mostrar el perfil del usuario
    @State private var showPerfil = false
    // Para mostrar el nombre completo de cada prueba
    @State var showPopUp: Bool = false
    // Para desplegar el nombre completo de la prueba escogida
    @State var showName: String = ""
    
    // Refresh results
    @Binding var newResults: Bool
    
    // ObservedObjects
    @ObservedObject var resultsModel: RESULTSModel
    @ObservedObject var userModel: USERSModel
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                
                ZStack {
                    
                    Color("Background")
                        .ignoresSafeArea()
                    
                    ScrollView {
                        
                        Text("Resultados recientes") // Aqui iran todos los resultados con sus semaforos
                            .font(Font.custom("Apercu Light", size: 30))
                        
                        ForEach(resultsModel.results) { result in
                            
                            Button {
                                showName = result.name
                                withAnimation {
                                    self.showPopUp.toggle()
                                }
                            } label: {
                                DimensionScoreView(name: result.name, score: Double(result.result), initials: result.initials, userModel: userModel)
                            }
                            
                        }
                        
                    }
                    .scrollIndicators(.hidden)
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Inicio")
                            .font(Font.custom("Poppins-SemiBold", size: 30))
                            .accessibilityAddTraits(.isHeader)
                            .fixedSize()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showPerfil.toggle()
                        } label: {
                            Image(systemName: "person.circle")
                                .font(.system(size: 30))
                                .fontWeight(.light)
                        }
                    }
                }
            }
            .fullScreenCover(isPresented: $showPerfil) {
                MiPerfilView(newResults: $newResults, userModel: userModel, resultsModel: resultsModel)
            }
            
            if self.showPopUp {
                GeometryReader { _ in
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            PopUpView(name: $showName)
                            Spacer()
                        }
                        Spacer()
                    }
                }
                .background(
                    Color.black.opacity(0.35)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                self.showPopUp.toggle()
                            }
                        }
                )
            }
        }
        .onAppear {
            if newResults {
                resultsModel.loadRESULTS()
                userModel.loadUSER()
                newResults = false
            }
        }
    }
}

struct InicioView_Previews: PreviewProvider {
    static var previews: some View {
        InicioView(newResults: .constant(false), resultsModel: RESULTSModel(), userModel: USERSModel())
    }
}
