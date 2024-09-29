//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Tana Vora on 9/29/24.
//

import SwiftUI

struct ContentView: View {
    @State var inputValue: Double = 35.0
    @State var inputUnit: String = "milliliters"
    @State var outputUnit: String = "gallons"
    
    var outputValue: Double {
        if inputUnit == "milliliters" {
            if outputUnit == "liters" {
                return inputValue / 1000
            } else if outputUnit == "cups" {
                return inputValue / 236.588
            } else if outputUnit == "pints" {
                return inputValue / 473.176
            } else if outputUnit == "gallons" {
                return inputValue / 3785.41
            }
        }
        return 0
    }
    
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
                Section("Output Value") {
                    Text("\(outputValue)")
                    Picker("Output Unit", selection: $outputUnit) {
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
