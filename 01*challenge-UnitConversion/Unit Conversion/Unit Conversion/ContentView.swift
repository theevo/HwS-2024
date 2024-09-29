//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Tana Vora on 9/29/24.
//

import SwiftUI

struct ContentView: View {
    @State var inputValue: Double = 35.0
    @State var inputUnit: String = "pints"
    @State var outputUnit: String = "gallons"
    
    var outputValue: Double {
        guard inputUnit != outputUnit else { return inputValue }
        
        if inputUnit == "milliliters" {
            return convertFrom(milliliters: inputValue, to: outputUnit)
        } else if inputUnit == "liters" {
            if outputUnit == "milliliters" {
                return inputValue * 1000
            } else { // cups, pints, gallons
                let milliliters = inputValue * 1000
                return convertFrom(milliliters: milliliters, to: outputUnit)
            }
        } else if inputUnit == "cups" {
            let milliliters = inputValue * 236.588
            return convertFrom(milliliters: milliliters, to: outputUnit)
        } else if inputUnit == "pints" {
            let milliliters = inputValue * 473.176
            return convertFrom(milliliters: milliliters, to: outputUnit)
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
    
    /// Milliliters will serve as a base unit. this function will do the work of converting FROM milliliters TO other units
    func convertFrom(milliliters: Double, to unit: String) -> Double {
        if unit == "milliliters" {
            return milliliters
        } else if unit == "liters" {
            return milliliters  / 1000
        } else if unit == "cups" {
            return milliliters / 236.588
        } else if unit == "pints" {
            return milliliters / 473.176
        } else if unit == "gallons" {
            return milliliters / 3785.41
        }
        return 0
    }

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
