//
//  QuestionsModel.swift
//  RetoTC2007B
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct QUESTION: Identifiable {
    var id: Int
    var pregunta: String
    var respuestas: [(Double, String)]
}

extension QUESTION {
    static let def: QUESTION = QUESTION(id: 41, pregunta: "¿Qué tanta dificultad tiene para llevar o cargar 4 o 5 kilogramos?", respuestas: [(0.0, "Ninguna"), (1.0, "Poca")])
}


class QUESTIONSModel: ObservableObject {
    
    @Published var questions = [QUESTION]()
    @Published var resultsCount: [Double] = []
    var respuestasLista: [(Double, String)] = []
    
    func loadQUESTIONS(examID: Int) {
        questions.removeAll()
        
        let URL = "http://localhost:3000/getPreguntasPorExamen/\(examID)"
        
        AF.request(URL, method: .get, encoding: URLEncoding.default).responseData { data in
            
            let json = try! JSON(data: data.data!)
            var auxQuestions: QUESTION
            
            for information in json {
                // Conseguimos las preguntas
                for question in information.1["Pregunta"] {
                    self.respuestasLista.removeAll()
                    // Conseguimos primero todas las respuestas y su peso
                    // Accesamos PreguntasRespuesta
                    for respuesta in question.1["PreguntaRespuesta"] {
                        // Accesamos Respuesta y las guardamos en una lista de tuplas
                        self.respuestasLista.append((respuesta.1["Respuesta"]["Peso"].doubleValue, respuesta.1["Respuesta"]["Respuesta"].stringValue))
                    }
                    
                    auxQuestions = QUESTION(id: question.1["IdPregunta"].intValue,
                                            pregunta: question.1["Pregunta"].stringValue,
                                            respuestas: self.respuestasLista
                    )
                    
                    self.questions.append(auxQuestions)
                    self.resultsCount.append(-1.0)
                    
                }
            }
            
        }
    }
}

