//
//  ResultadoView.swift
//  UiTesting
//
//  Created by Enzo Henrique Botelho Romão on 05/03/26.
//

import SwiftUI

struct ResultadoView: View {
    let resultado: IMCResult
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Seu Resultado")
                .font(.headline)
            
            Text(String(format: "%.2f", resultado.valor))
                .font(.system(size: 60, weight: .bold))
                .foregroundColor(resultado.cor)
            
            Text(resultado.classificacao)
                .font(.title2)
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(resultado.cor.opacity(0.2))
                .foregroundColor(resultado.cor)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ResultadoView(resultado:
        IMCResult(
            valor: 19,
            classificacao: "Peso ideal",
            cor: .green
        )
    )
}
