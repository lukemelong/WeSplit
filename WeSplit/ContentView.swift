//
//  ContentView.swift
//  WeSplit
//
//  Created by Luke Melong on 2021-09-27.
//

import SwiftUI

struct ContentView: View {
    @State private var chequeAmount = ""
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 2
    
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage]) / 100
        let orderAmount = Double(chequeAmount) ?? 0
        
        let totalPerPerson = (orderAmount + orderAmount * tipSelection) / peopleCount
        
        return totalPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("ChequeAmount", text: $chequeAmount)
                        .keyboardType(.decimalPad)
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section (header: Text("How much tip would you like to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .textCase(nil)
                Section{
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("Tip Calculator")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
