//
//  ColorSlider.swift
//  RGBullsEye
//
//  Created by Amr Hesham on 17/09/2021.
//

import SwiftUI

struct ColorSlider: View {
    @Binding var value: Double
   var textColor: Color
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value)
                .background(textColor)
                 .cornerRadius(10)
            Text("255").foregroundColor(textColor)
        }
    }
}
