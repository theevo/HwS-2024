//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Tana Vora on 9/29/24.
//

import SwiftUI

struct ContentView: View {
    @State var inputValue: Double = 0.0

    var body: some View {
        NavigationStack {
            Form {
                Section("Input Value") {
                    TextField("Input Value", value: $inputValue, format: .number)
                }
            }
            .navigationTitle("Volume Conversion")
        }
    }
}

#Preview {
    ContentView()
}
