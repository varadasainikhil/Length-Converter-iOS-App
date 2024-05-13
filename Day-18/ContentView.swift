//
//  ContentView.swift
//  Day-18
//
//  Created by Sai Nikhil Varada on 5/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var enteredLength = 0.0
    @State private var inputSelectedOption = "Meters"
    @State private var outputSelectedOption = "Foot"
    
    @FocusState private var isEnterLengthActive : Bool
    private let options = ["Meters","Kilometers","Feet","Yards","Miles"]
    
    private var metersConverted : Double{
        if inputSelectedOption == options[0]{
            return enteredLength
        }
        else if inputSelectedOption == options[1]{
            return enteredLength*1000
        }
        else if inputSelectedOption == options[2]{
            return enteredLength/3.28084
        }
        else if inputSelectedOption == options[3]{
            return enteredLength*0.9144
        }
        else {
            return enteredLength*1609.34
        }
    }
    
    private var finalOutput : Double{
        if outputSelectedOption == options[0]{
            return metersConverted
        }
        else if outputSelectedOption == options[1]{
            return metersConverted/1000
        }
        else if outputSelectedOption == options[2]{
            return metersConverted*3.28084
        }
        else if outputSelectedOption == options[3]{
            return metersConverted/0.9144
        }
        else{
            return metersConverted/1609.34
        }
    }
    var body: some View {
        NavigationStack{
                Form{
                    Section("Enter Input"){
                        TextField("Enter the length",value:$enteredLength, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($isEnterLengthActive)
                        
                        Picker("Unit for input", selection: $inputSelectedOption){
                            ForEach(options, id: \.self){
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section("Results"){
                        Picker("Unit for output", selection: $outputSelectedOption){
                            ForEach(options, id: \.self){
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                        Text(finalOutput, format: .number)
                    }
                    
                }
            
        
            
            .navigationTitle("Length Converter")
            .toolbar{
                if isEnterLengthActive{
                    Button("Done"){
                        isEnterLengthActive = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
