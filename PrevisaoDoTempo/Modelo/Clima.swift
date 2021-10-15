//
//  Clima.swift
//  PrevisaoDoTempo
//
//  Created by Pedro Gomes on 15/10/21.
//

import Foundation

enum Clima: String {
    case sol = "Sol"
    case chuva = "Chuva"
    case nublado = "Nublado"
    
    var imagem: String {
        return "icone" + self.rawValue
    }
}
