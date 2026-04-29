//
//  ChecklistView.swift
//  RetoTC2007B
//

import SwiftUI

struct AccionesView: View {
    
    @Environment(\.openURL) var openURL
    
    @ObservedObject var actionsModel: ACTIONSModel
    @State private var textHeight: Double = 100
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ActionEntity.actionDescription, ascending: true)],
        animation: .default)
    private var Actions: FetchedResults<ActionEntity>
    
    @State var cantCom: CGFloat = 0
    @AppStorage("cantidadTotal") var cantidadTotal: Int = 0
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                
                Color("Background")
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    if cantCom < 3 {
                        List {
                            ForEach(Actions) { action in
                                HStack {
                                    Text(action.actionDescription_wrapped)
                                        .strikethrough(action.completed)
                                        .onAppear{
                                            if action.completed == true{
                                                cantCom += 1
                                            }
                                        }
                                    Spacer()
                                    Button{
                                        
                                    }label:{
                                        Image(systemName: action.completed ? "checkmark.square.fill" : "square")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40)
                                            .foregroundColor(.green)
                                            .opacity(action.completed ? 0.5 : 1.0)
                                            .onTapGesture {
                                                if action.completed == false{
                                                    cantidadTotal += 1
                                                    cantCom += 1
                                                }
                                                action.completed.toggle()
                                                do {
                                                    try self.viewContext.save()
                                                } catch {
                                                    let nsError = error as NSError
                                                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                                                }
                                            }
                                            .disabled(action.completed)
                                    }
                                    
                                }
                                
                            }
                            .font(.custom("Avenir Next Regular", size: 20))
                            .frame(height: CGFloat(self.textHeight))
                            
                        }
                        .onAppear {
                            UITableView.appearance().backgroundColor = .clear
                        }
                        .scrollContentBackground(.hidden)
                    }
                    else{
                        Spacer()
                        Text("Felicidades!")
                            .font(.custom("Avenir Next Regular", size: 30))
                            .multilineTextAlignment(.center)
                        Text("Completaste todas las acciones del día, regresa mañana por más!")
                            .font(.custom("Avenir Next Regular", size: 20))
                            .multilineTextAlignment(.center)
                    }
                    Text("Total de acciones completadas: \(cantidadTotal)")
                        .font(.custom("Avenir Next Regular", size: 20))
                    Spacer()
                    
                    ProgressBar(width: 400, height: 20, percent: cantCom, total: 3, color1: .blue, color2: .blue)
                    
                    Button {
                        
                        openURL(URL(string: "https://longevitta.mx")!)
                        
                    } label: {
                        Text("Más Información")
                            .frame(width: 250, height: 70, alignment: .center)
                            .font(Font.custom("Poppins-SemiBold", size: 25))
                            .tracking(1.8)
                    }
                    .foregroundColor(.black)
                    .background(Color("Button"))
                    .cornerRadius(15)
                    .shadow(radius: 4, x: 0, y: 4)
                    .padding()
                    
                    
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Acciones de hoy")
                            .font(Font.custom("Poppins-SemiBold", size: 30))
                            .accessibilityAddTraits(.isHeader)
                            .fixedSize()
                    }
                }
            }
            .onAppear{
                if actionsModel.check() {
                    deleteActions()
                    actionsModel.loadACTIONS()
                }
            }
        }
        
    }
    
    func deleteActions(){
        print("Fin del dia")
        var completadasDia: Int = 0
        do {
            for action in Actions {
                if action.completed == true{
                    completadasDia += 1
                }
                viewContext.delete(action)
            }
            // Save Changes
            try viewContext.save()
            print("Acciones totales: \(completadasDia)")
            
        } catch {
            // Error Handling
            // ...
            print("Error")
        }
    }
    
}

struct AccionesView_Previews: PreviewProvider {
    static var previews: some View {
        AccionesView(actionsModel: ACTIONSModel())
    }
}
