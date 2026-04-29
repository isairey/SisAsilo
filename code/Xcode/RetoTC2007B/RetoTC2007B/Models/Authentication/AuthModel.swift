//
//  AuthModel.swift
//  RetoTC2007B
//

import SwiftUI
import SwiftyJSON
import Alamofire

struct AUTH: Identifiable {
    var id: Int
    var email: String
    var password: String
}


extension AUTH {
    static let def: AUTH = AUTH(id: 1, email: "correo1@gmail.com", password: "1234567890")
}

class AUTHModel: ObservableObject {
    
    @Published var auths = [AUTH]()
    
    init() {
        loadAUTH()
    }
    
    func loadAUTH() {
        auths.removeAll()
//        let URL = "http://10.14.255.61:3000/getAccesoUsuariosAPP"
        let URL = "http://localhost:3000/getAccesoUsuariosAPP"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
            
            let json = try! JSON(data: data.data!)
            
            var auxAuth: AUTH
            for auth in json {
                auxAuth = AUTH(
                    id: auth.1["IdPaciente"].intValue,
                    email: auth.1["Autorizacion"]["Correo"].stringValue,
                    password: auth.1["Autorizacion"]["Contrasenia"].stringValue
                )
                
                self.auths.append(auxAuth)
            }
        }
    }    
}
