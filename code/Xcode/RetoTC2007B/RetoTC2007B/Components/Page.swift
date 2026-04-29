//
//  Page.swift
//  RetoTC2007B
//

import Foundation

enum Page: Int, CaseIterable {
    case inicio
    case dimensiones
    case lineaAtencion
    case miEspacio
    case acciones
    
    var title: String {
        switch self {
        case .inicio: return "Inicio"
        case .dimensiones: return "Pruebas"
        case .lineaAtencion: return "Línea"
        case .miEspacio: return "Espacio"
        case .acciones: return "Acciones"
        }
    }
    
    var imageName: String {
        switch self {
        case .inicio: return "house"
        case .dimensiones: return "text.book.closed"
        case .lineaAtencion: return "phone"
        case .miEspacio: return "star"
        case .acciones: return "checkmark.square"
        }
    }
    
}
