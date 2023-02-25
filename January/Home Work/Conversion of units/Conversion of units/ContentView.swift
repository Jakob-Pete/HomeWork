//
//  ContentView.swift
//  Conversion of units
//
//  Created by mac on 1/10/23.
//
//Math needed fahrenheight - 32) *5 / 9
//So celsisus would be * 9 / 5 + 32 = fahrenheit
//(kelvin Input - 273.15) * 9 / 5 + 32 = fahrenheit
//Kelvin Input - 273.15 = Celsius
// celsius + 273.15 = kelvins
// fahrenheit - 32) * 5 / 9 + 256.483 = kelvin



//var math: Double {
//
//    var returnValue = 0.0
//
//    if selectedInput == "Fahrenheit" {
//         (userInput - 32) * 5 / 9
//    } else if  selectedInput == "Celsius" {
//         userInput * 9 / 5 + 32
//    } else if selectedInput == "Kelvin" {
//         userInput - 273.15
//    }
//
//    if selectedOutput == "Fahrenheit" {
//        return returnValue = userInput * 9 / 5 + 32
//    } else if selectedOutput == "Celsius" {
//        return returnValue = (userInput - 32) * 5 / 9
//    } else if selectedOutput == "Kelvin" {
//        return returnValue= userInput + 273.15
//    }
//          return returnValue
//}

//var doMath: Double {
//    var input: Double
//    var outputUnit: Double
//
//    switch userInput {
//    case "Celsius":
//        switch outputUnit {
//        case "Celsius":
//            return input
//        case "Fahrenheit":
//            return (input * (9 / 5)) + 32
//        case "Kelvin":
//            return input + 273.15
//        default:
//            return 0
//        }
//    case "Kelvin":
//        switch outputUnit {
//        case "Celsius":
//            return input - 273.15
//        case "Fahrenheit":
//            return ((input - 273.15) * (9 / 5)) + 32
//        case "Kelvin":
//            return input
//        default:
//            return 0
//        }
//    case "Fahrenheit":
//        switch outputUnit {
//        case "Celsius":
//            return (input - 32) * (5 / 9)
//        case "Fahrenheit":
//            return input
//        case "Kelvin":
//            return ((input - 32) * (5 / 9)) + 273.15
//        default:
//            return 0
//        }
//    default:
//        return 0
//    }
//}
//var math: Double {
//        let inputUnits: Double
//        let outputUnits: Double
//
//        switch selectedInput {
//        case "Fahrenheit":
//            inputUnits = (userInput - 32) * 5 / 9
//        case "Celsius":
//            inputUnits = userInput * 9 / 5 + 32
//        case "Kelvin":
//            inputUnits = userInput - 273.15
//        default: "IDK"
//        }
//        switch selectedOutput {
//        case "Fahrenheit":
//            outputUnits
//
//            let celsiusToFahrenhit = userInput
//            let celsiusToKelvin = userInput + 273.15
//
//            let fahrenheitToCelsius =
//            let farenheitToKelvin = (userInput - 32) * 5 / 9 + 256.48
//
//            let kelvinToCelsius = userInput - 273.15
//            let kelvinToFahrenheit = (userInput - 273.15) * 9 / 5 + 32
//        }
//    }

//func doMath(units: Double, from: String, to: String) -> Double {
//        if from == to {
//            switch (from, to) {
//            case("Fahrenheit", "Celsius"):
//                return (units - 32) * 5 / 9
//
//            case("Fahrenheit","Kelvin"):
//                return (units - 32) * 5 / 9 + 256.483
//            case("Celsius", "Fahrenheit"):
//                return units * 9 / 5 + 32
//            case("Celsius", "Kelvin"):
//                return units + 273.15
//            case("Kelvin", "Fahrenheit"):
//                return (units - 273.15) * 9 / 5 + 32
//            case("Kelvin", "Celsius"):
//                return units - 273.15
//            default:
//                return 32.0
//            }
//        }
//
//        return units
//    }



import SwiftUI

struct ContentView: View {
    @State private var userInput = 0.0
    
    //    @State private var fahrenheit = 32
    //    @State private var celsius =  0
    @State private var selectedInput = "Fahrenheit"
    @State private var selectedOutput = "Celsius"
    
    let degrees = ["Fahrenheit", "Celsius", "Kelvin"]
    
    func doMath(units: Double, from: String, to: String) -> Double {
        switch (from, to) {
        case("Fahrenheit", "Celsius"):
            return (units - 32) * 5 / 9
        case("Fahrenheit","Kelvin"):
            return (units - 32) * 5 / 9 + 256.483
        case("Celsius", "Fahrenheit"):
            return units * 9 / 5 + 32
        case("Celsius", "Kelvin"):
            return units + 273.15
        case("Kelvin", "Fahrenheit"):
            return (units - 273.15) * 9 / 5 + 32
        case("Kelvin", "Celsius"):
            return units - 273.15
        default:
            break
        }
        return units
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Fahrenheit", selection: $selectedInput) {
                        ForEach(degrees, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    HStack {
                        TextField("User input", value: $userInput, format: .number)
                        Text(selectedInput)
                    }
                    
                } header: {
                    Text("Input")
                }
                Section {
                    Picker("Celsius", selection: $selectedOutput) {
                        ForEach(degrees, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    HStack {
                        Text(doMath(units: userInput, from: selectedInput, to: selectedOutput), format: .number)
                        Text(selectedOutput)
                    }
                } header: {
                    Text("Output")
                }
            }
            .navigationTitle("Confusing math for you")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
