//
//  MiPerfilView.swift
//  RetoTC2007B
//

import SwiftUI

struct MiPerfilView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var newResults: Bool
    
    // Clase de PDF
    @StateObject private var contentViewModel = ContentViewModel()
    
    @AppStorage("userID") var userID: Int?
    
    // ObservedObjects
    @ObservedObject var userModel: USERSModel
    @ObservedObject var resultsModel: RESULTSModel
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Color("Background")
                    .ignoresSafeArea()
                
                VStack {
                    
                    Spacer()
                    
                    Button {
                        print("Cambiar foto")
                    } label: {
                        Image(systemName: "person.circle")
                            .font(.system(size: 200))
                            .fontWeight(.ultraLight)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    ForEach(userModel.user) { user in
                        Text("Nombre: \(user.nombre)")
                            .font(Font.custom("Apercu Light", size: 20))
                        Text("Edad: \(user.edad)")
                            .font(Font.custom("Apercu Light", size: 20))
                        Text("Parroquia: \(user.parroquia)")
                            .font(Font.custom("Apercu Light", size: 20))
                        Text("Decanato: \(user.decanato)")
                            .font(Font.custom("Apercu Light", size: 20))
                        Text("Zona: \(user.zona)")
                            .font(Font.custom("Apercu Light", size: 20))
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: PdfPreviewView()) {
                        HStack {
                            Text("Descargar Resultados")
                                .frame(width: 250, height: 70, alignment: .center)
                                .font(Font.custom("Poppins-SemiBold", size: 20))
                                .tracking(1.8)
                            Image(systemName: "doc.text.fill")
                                .font(.system(size: 30))
                        }
                        .padding(.horizontal)
                    }.simultaneousGesture(TapGesture().onEnded({ _ in
                        getPdfInfo()
                    }))
                    .foregroundColor(.black)
                    .background(Color("Button"))
                    .cornerRadius(15)
                    .shadow(radius: 4, x: 0, y: 4)
                    
                    Spacer()
                    
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Mi Perfil")
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        newResults = true
                        userID = 0
                    } label: {
                        VStack {
                            Text("Cerrar")
                            Text("Sesión")
                        }
                        .font(.headline)
                        .fixedSize()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .environmentObject(contentViewModel)
    }
    
    func getPdfInfo() {
        // We first get the title (username)
        contentViewModel.title = "Paciente: \(userModel.user.first!.nombre)"
        // Then we get the info of the user
        contentViewModel.body = "\n\n"
        // We add all the info
        var addInfo = "Nombre: \(userModel.user.first!.nombre)\n"
        contentViewModel.body += addInfo
        addInfo = "Edad: \(userModel.user.first!.edad)\n"
        contentViewModel.body += addInfo
        addInfo = "Parroquia: \(userModel.user.first!.parroquia)\n"
        contentViewModel.body += addInfo
        addInfo = "Decanato: \(userModel.user.first!.decanato)\n"
        contentViewModel.body += addInfo
        addInfo = "Zona: \(userModel.user.first!.zona)\n"
        contentViewModel.body += addInfo
        // We add a divider
        contentViewModel.body += "------------------------------------------------------------\n"
        // Then we get their scores
        for score in resultsModel.results {
            let addScore = "\(score.name): \(turnToString(score: score.result))\n\n"
            contentViewModel.body += addScore
        }
        
    }
}

struct MiPerfilView_Previews: PreviewProvider {
    static var previews: some View {
        MiPerfilView(newResults: .constant(false), userModel: USERSModel(), resultsModel: RESULTSModel())
    }
}
