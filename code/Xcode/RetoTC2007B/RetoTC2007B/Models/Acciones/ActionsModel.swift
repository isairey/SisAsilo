//
//  ActionsModel.swift
//  RetoTC2007B
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct ACTIONS: Identifiable {
    var id: Int
    var descripcion: String
}

extension ACTIONS {
    static let def: ACTIONS = ACTIONS(id: 0, descripcion: "Toma una siesta de 30 minutos")
}


class ACTIONSModel: ObservableObject {
    
    //    @Published var actions = [ACTIONS]()
    var managedObjectContext = PersistenceController.shared.container.viewContext
    //    @AppStorage("userID") var userID: Int?
    
    
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \ActionEntity.actionDescription, ascending: true)],
    //        animation: .default)
    //    private var Actions: FetchedResults<ActionEntity>
    
    //    init() {
    //    }
    
    func loadACTIONS() {
        let URL = "http://localhost:3000/getRandomAcciones"
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
            let json = try! JSON(data: data.data!)
            for action in json {
                print(action.1["Descripcion"].stringValue)
                withAnimation {
                    let newAction = ActionEntity(context: self.managedObjectContext)
                    newAction.id = UUID()
                    newAction.actionDescription = action.1["Descripcion"].stringValue
                    newAction.completed = false
                    do {
                        try self.managedObjectContext.save()
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }
            }
        }
    }
    
    func check() -> Bool {
        if let referenceDate = UserDefaults.standard.object(forKey: "reference") as? Date {
            // reference date has been set, now check if date is not today
            if !Calendar.current.isDateInToday(referenceDate) {
                // if date is not today, do things
                // update the reference date to today
                UserDefaults.standard.set(Date(), forKey: "reference")
                return true
            }
        } else {
            // reference date has never been set, so set a reference date into UserDefaults
            UserDefaults.standard.set(Date(), forKey: "reference")
            return true
        }
        return false
    }
}
