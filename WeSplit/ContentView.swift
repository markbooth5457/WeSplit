//
//  ContentView.swift
//  WeSplit
//
//  Created by Mark Booth on 14/11/2019.
//  Copyright © 2019 Mark Booth. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = [10, 15, 20, 0]
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 0
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        return orderAmount + tipValue
    }
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople ) ?? 1
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
     var body: some View {
        NavigationView{
            Form{
                TextField("Check amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                Section(header: Text("How much tip do you want to leave?")){
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Grand Total")){
                    Text("\(grandTotal, specifier: "%.2f")")
                }
                HStack {
                    
                    TextField("Number of people", text:  $numberOfPeople)
                    .keyboardType(.decimalPad)
                    Section(header: Text("Per person")){
                        Text("£\(totalPerPerson, specifier: "%.2f")").bold()
                              }
                }
          
            }.navigationBarTitle(Text("WeSplit"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
