//
//  UsersModel.swift
//  RetoTC2007B
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct USERS: Identifiable {
    var id: Int
    var nombre: String
    var edad: Int
    var genero: String
    var parroquia: String
    var decanato: String
    var zona: String
}

extension USERS {
    static let def: USERS = USERS(id: 0, nombre: "Juan Sebastian Blando", edad: 74, genero: "M", parroquia: "Monterrey", decanato: "Monterrey", zona: "Monterrey")
}


class USERSModel: ObservableObject {
    
    @Published var user = [USERS]()
    @AppStorage("userID") var userID: Int?
    var genero = "M"
    
    func loadUSER() {
        user.removeAll()
        
        let URL = "http://localhost:3000/getDatosPaciente/\(userID!)"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
            
            let json = try! JSON(data: data.data!)
            var auxUser: USERS
            auxUser = USERS(id: json["IdPaciente"].intValue,
                            nombre: json["Autorizacion"]["Nombre"].stringValue + " " + json["Autorizacion"]["ApellidoPaterno"].stringValue + " " + json["Autorizacion"]["APellidoMaterno"].stringValue,
                            edad: json["Edad"].intValue,
                            genero: json["Genero"].stringValue,
                            parroquia: json["Parroquia"]["Nombre"].stringValue,
                            decanato: json["Parroquia"]["Decanato"]["Nombre"].stringValue,
                            zona: json["Parroquia"]["Decanato"]["Zona"]["Nombre"].stringValue
            )
            self.genero = json["Genero"].stringValue
            self.user.append(auxUser)
            print(self.user)
        }
    }
    
    func getGenero() -> String{
        return self.genero
    }
    
}
