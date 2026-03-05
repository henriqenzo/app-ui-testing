//
//  IMCModel.swift
//  UiTesting
//
//  Created by Enzo Henrique Botelho Romão on 05/03/26.
//

import Foundation
import SwiftUI

struct IMCResult: Identifiable {
    let id = UUID()
    let valor: Double
    let classificacao: String
    let cor: Color
}

struct IMCService {
    static func calcular(peso: Double, altura: Double) -> IMCResult {
        let imc = peso / (altura * altura)
        
        switch imc {
        case ..<18.5:
            return IMCResult(valor: imc, classificacao: "Abaixo do peso", cor: .blue)
        case 18.5..<25:
            return IMCResult(valor: imc, classificacao: "Peso ideal", cor: .green)
        case 25..<30:
            return IMCResult(valor: imc, classificacao: "Sobrepeso", cor: .orange)
        default:
            return IMCResult(valor: imc, classificacao: "Obesidade", cor: .red)
        }
    }
}
