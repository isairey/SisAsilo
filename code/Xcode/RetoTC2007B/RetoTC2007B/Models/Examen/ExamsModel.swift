//
//  ExamsModel.swift
//  RetoTC2007B
//

import SwiftUI
import SwiftyJSON
import Alamofire

struct EXAMS: Identifiable {
    var id: Int
    var name: String
    var initials: String
    var dimension: String
}

extension EXAMS {
    static let def: EXAMS = EXAMS(id: 1, name: "Índice de Katz", initials: "KATZ", dimension: "Funcionalidad")
}

class EXAMSModel: ObservableObject {
    
    @Published var exams = [EXAMS]()
    
    init() {
        loadEXAMS()
    }
    
    func loadEXAMS() {
        exams.removeAll()
        
        let URL = "http://localhost:3000/getExamenes"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
            
            let json = try! JSON(data: data.data!)
            var auxExams: EXAMS
            
            for exam in json {
                auxExams = EXAMS(id: exam.1["IdExamen"].intValue,
                                 name: exam.1["Nombre"].stringValue,
                                 initials: exam.1["Siglas"].stringValue,
                                 dimension: exam.1["Dimension"].stringValue
                )
                
                self.exams.append(auxExams)
            }
            
//            print(self.exams)
        }
    }
}
