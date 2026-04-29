//
//  Semaforos.swift
//  RetoTC2007B
//

import Foundation

func getImageLight(initial: String, score: Double, genero: String) -> String {
    
    var imageName: String = ""
    
    if score == 999 {
        imageName = "NoLight"
    } else {
        // Índice de Katz
        if initial == "KATZ" {
            
            if score <= 1 {
                imageName = "RedLight"
            } else if score > 1 && score <= 3 {
                imageName = "YellowLight"
            } else {
                imageName = "GreenLight"
            }
        
        // Índice de Lawton & Brody
        } else if initial == "LW&B" {
            
            if score < 5 && genero == "M" {
                imageName = "RedLight"
            } else if score < 8 && genero == "F"{
                imageName = "RedLight"
            }
            else {
                imageName = "GreenLight"
            }
        
        // Clinical Fragility Scale
        } else if initial == "CFS" {
            
            if score >= 1 && score <= 2 {
                imageName = "GreenLight"
            } else if score >= 3 && score <= 7 {
                imageName = "YellowLight"
            } else {
                imageName = "RedLight"
            }
            
        // Short Physical Perfmormance Battery
        } else if initial == "SPPB" {
            
            if score < 8 {
                imageName = "RedLight"
            } else {
                imageName = "GreenLight"
            }
            
        // Escala de valoración sociofamiliar de gijón
        } else if initial == "VSG" {
            
            if score <= 7 {
                imageName = "GreenLight"
            } else if score >= 8 && score <= 9 {
                imageName = "YellowLight"
            } else {
                imageName = "RedLight"
            }
            
        // Escala Sarc-F
        } else if initial == "SARC-F" {
            
            if score >= 4 {
                imageName = "RedLight"
            } else {
                imageName = "GreenLight"
            }
        
        // Prueba de Reloj
        } else if initial == "PR" {
            
            if score <= 10 {
                imageName = "GreenLight"
            } else if score > 10 && score <= 20 {
                imageName = "YellowLight"
            } else {
                imageName = "RedLight"
            }
            
        // Mini Mental State Examination de Folstein
        } else if initial == "MMSE" {
            
            if score <= 24 {
                imageName = "RedLight"
            } else {
                imageName = "GreenLight"
            }
            
        // Escala Abreviada de Depresión Geríatrica de Yesavage
        } else if initial == "ADGY" {
            
            if score >= 0 && score <= 5 {
                imageName = "GreenLight"
            } else if score > 5 && score <= 9 {
                imageName = "YellowLight"
            } else {
                imageName = "RedLight"
            }
        }
    }
    
    return imageName
}
