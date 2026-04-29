//
//  ContentView.swift
//  RetoTC2007B
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // To move between views
    @State var selectedPage: Page = .inicio
    
    // UserID var
    @AppStorage("userID") var userID: Int = 0
    
    // StateObjects
    @StateObject var authModel = AUTHModel()
    @StateObject var resultsModel = RESULTSModel()
    @StateObject var examsModel = EXAMSModel()
    @StateObject var userModel = USERSModel()
    @StateObject var actionsModel = ACTIONSModel()
    
    // Show new results
    @State var newResults: Bool = true
    
    var body: some View {
        
        ZStack {
            
            Color("Background")
                .ignoresSafeArea()
            
            if userID == 0 {
                
                LoginView(authModel: authModel)
                
            } else {
                
                VStack(spacing: 2) {
                    
                    switch selectedPage {
                    case .inicio:
                        InicioView(newResults: $newResults, resultsModel: resultsModel, userModel: userModel)
                    case .dimensiones:
                        DimensionesView(examsModel: examsModel, newResults: $newResults)
                    case .lineaAtencion:
                        LineaAtencionView()
                    case .miEspacio:
                        MiEspacioView()
                    case .acciones:
                        AccionesView(actionsModel: actionsModel)
                    }
                    
                    CustomTabView(selectedPage: $selectedPage)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
