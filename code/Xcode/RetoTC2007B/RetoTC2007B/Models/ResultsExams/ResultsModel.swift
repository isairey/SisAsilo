//
//  ResultsModel.swift
//  RetoTC2007B
//

import SwiftUI
import SwiftyJSON
import Alamofire

struct RESULTS: Identifiable {
    var id: UUID
    var result: Double
    var name: String
    var initials: String
}


extension RESULTS {
    static let def: RESULTS = RESULTS(id: UUID(), result: 10.0, name: "Indice de KATZ", initials: "KATZ")
}

class RESULTSModel: ObservableObject {
    
    @Published var results = [RESULTS]()
    @AppStorage("userID") var userID: Int?
    
    func loadRESULTS() {
        results.removeAll()
        
        if userID != 0 {
            let URL = "http://localhost:3000/getResultadosRecientesPorPaciente/\(userID!)"
            
            AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
                
                let json = try! JSON(data: data.data!)
                var auxResults: RESULTS
                for res in json {
                    auxResults = RESULTS(
                        id: UUID(),
                        result: res.1["Resultado"].doubleValue,
                        name: res.1["Examen"]["Nombre"].stringValue,
                        initials: res.1["Examen"]["Siglas"].stringValue
                    )
                    self.results.append(auxResults)
                }
//                print(self.results)
            }
        }
    }
}
