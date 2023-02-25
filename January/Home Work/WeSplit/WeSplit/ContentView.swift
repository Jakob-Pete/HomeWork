//
//  ContentView.swift
//  WeSplit
//
//  Created by mac on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercenage = 20
    
    @State private var useRedText = false
    
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople + 2)
             let tipSelcetion = Double(tipPercenage)
             
             let tipValue = checkAmount / 100 * tipSelcetion
             let grandTotal = checkAmount + tipValue
             let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
//    func math() {
//         let math = tipPercenage >= 10 ? checkAmount.text.color.red : checkAmount.text.color.black
//    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value:  $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of peeps", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Picker("Tip percentage", selection:  $tipPercenage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented )
                } header: {
                    Text("Tip amount")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Price per person")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
