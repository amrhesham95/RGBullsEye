//
//  ContentView.swift
//  RGBullsEye
//
//  Created by Amr Hesham on 17/09/2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    // MARK: - Properties
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double = Double.random(in: 0..<1)
    @State var gGuess: Double = Double.random(in: 0..<1)
    @State var bGuess: Double = Double.random(in: 0..<1)
    @State var showAlert = false
    
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
            Button(action: {
                showAlert = true
            }) {
                Text("Hit Me!")
            }
            
            // <SliderView>
            ColorSlider(value: $rGuess, textColor: .red)
            ColorSlider(value: $gGuess, textColor: .green)
            ColorSlider(value: $bGuess, textColor: .blue)
            // <SliderView/>
            
        }.alert(isPresented: $showAlert, content: {
            Alert(title: Text("Your Score"),
                  message: Text(String(computeScore())))
        })
    }
}

// MARK: - Helpers

extension ContentView {
    func computeScore() -> Int {
      let rDiff = rGuess - rTarget
      let gDiff = gGuess - gTarget
      let bDiff = bGuess - bTarget
      let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
      return Int((1.0 - diff) * 100.0 + 0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
