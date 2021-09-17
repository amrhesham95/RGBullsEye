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
            ColorUISlider(color: UIColor(textColor), value: $value)
            Text("255").foregroundColor(textColor)
        }
    }
}
