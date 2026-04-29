//
//  UpdateResults.swift
//  RetoTC2007B
//

import Foundation
import SwiftyJSON
import Alamofire

func updateResults(userID: Int, examID: Int, result: Double, location: String, evaluator: String) {
    let URL = "http://localhost:3000/AddResultadoDePaciente/\(userID)/\(examID)"
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    
    let body: [String: Any] = [
        "resultado": result,
        "fechaDeExamen": formatter.string(from: Date()),
        "ubicacion": location,
        "evaluador": evaluator
    ]
    
    AF.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default).response { data in
        print(data.response!)
    }
    
}
