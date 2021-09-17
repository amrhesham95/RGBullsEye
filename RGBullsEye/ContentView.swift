//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Amr Hesham on 17/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double = Double.random(in: 0..<1)
    @State var gGuess: Double = Double.random(in: 0..<1)
    @State var bGuess: Double = Double.random(in: 0..<1)
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    Text("Match this color")
                        .padding()
                    
                }
                
                VStack {
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                    Text("R: \(Int(rGuess * 255.0))"
                     + "  G: \(Int(gGuess * 255.0))"
                     + "  B: \(Int(bGuess * 255.0))")
                        .padding()
                    
                }

            }
            Button(action: {}) {
                Text("Hit Me!")
            }
            
            // <SliderView>
            ColorSlider(value: $rGuess, textColor: .red)
            ColorSlider(value: $gGuess, textColor: .green)
            ColorSlider(value: $bGuess, textColor: .blue)
            // <SliderView/>
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
