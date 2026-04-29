//
//  TurnToString.swift
//  RetoTC2007B
//

import Foundation

func turnToString(score: Double) -> String {
    var toString: String = ""
    
    if score == 999 {
        toString = "--"
    } else {
        toString = String(score)
    }
    
    return toString
}
