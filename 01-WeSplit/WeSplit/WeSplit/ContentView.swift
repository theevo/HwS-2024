//
//  ContentView.swift
//  WeSplit
//
//  Created by Tana Vora on 8/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) // look Ma! no + 2!
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount * tipSelection / 100
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalPlusTip: Double {
        checkAmount + (checkAmount * Double(tipPercentage) / 100)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people").tag($0) // this will tell the Picker to use the tag's value instead of the element's INDEX number in the range of 2..<100
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much tip do you want to leave?") {
                    // Challenge 3: Change the tip percentage picker to show a new screen rather than using a segmented control, and give it a wider range of options – everything from 0% to 100%. Tip: use the range 0..<101 for your range rather than a fixed array.
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
//                    Picker("Tip percentage", selection: $tipPercentage) {
//                        ForEach(tipPercentages, id: \.self) {
//                            Text($0, format: .percent)
//                        }
//                    }
                    // .pickerStyle(.segmented)
                    
                }
                
                // Challenge 1: Add a header to the third section, saying “Amount per person”
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                // Challenge 2: Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.
                Section("Total plus Tip") {
                    Text(totalPlusTip, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
