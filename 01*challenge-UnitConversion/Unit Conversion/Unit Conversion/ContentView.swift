//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Tana Vora on 9/29/24.
//

import SwiftUI

struct ContentView: View {
    @State var inputValue: Double = 0.0
    @State var inputUnit: String = "milliliters"
    
    var volumeUnits = [
        "milliliters",
        "liters",
        "cups",
        "pints",
        "gallons"
    ]

    var body: some View {
        NavigationStack {
            Form {
                Section("Input Value") {
                    TextField("Input Value", value: $inputValue, format: .number)
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(volumeUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Volume Conversion")
        }
    }
}

#Preview {
    ContentView()
}
