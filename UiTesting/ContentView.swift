//
//  ContentView.swift
//  UiTesting
//
//  Created by Enzo Henrique Botelho Romão on 05/03/26.
//

import SwiftUI

struct ContentView: View {
    @State private var peso: String = ""
    @State private var altura: String = ""
    @State private var resultado: IMCResult? = nil
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "figure.arms.open")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.blue)
                
                Text("Calculadora de IMC")
                    .font(.largeTitle.bold())
                
                VStack(alignment: .leading) {
                    Text("Peso (kg)")
                        .font(.caption)
                    TextField("Ex: 75.5", text: $peso)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                }
                
                VStack(alignment: .leading) {
                    Text("Altura (m)")
                        .font(.caption)
                    TextField("Ex: 1.75", text: $altura)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(.roundedBorder)
                }
                
                Button(action: calcularIMC) {
                    Text("Calcular")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)
                
                Spacer()
            }
            .padding(32)
            .navigationTitle("Saúde")
            .sheet(item: $resultado) { info in
                ResultadoView(resultado: info)
                    .presentationDetents([.medium])
            }
        }
    }
    
    private func calcularIMC() {
        let p = Double(peso.replacingOccurrences(of: ",", with: ".")) ?? 0
        let a = Double(altura.replacingOccurrences(of: ",", with: ".")) ?? 0
        
        if p > 0 && a > 0 {
            resultado = IMCService.calcular(peso: p, altura: a)
        }
    }
}

#Preview {
    ContentView()
}
