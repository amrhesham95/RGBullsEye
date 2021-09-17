//
//  ColorUISlider.swift
//  RGBullsEye
//
//  Created by Amr Hesham on 17/09/2021.
//

import SwiftUI

// MARK: - ColorUISlider
//
struct ColorUISlider: UIViewRepresentable {
    
    // MARK: - Properties
    var color: UIColor
    @Binding var value: Double
    
    // MARK: - Methods
    func makeCoordinator() -> ColorUISlider.Coordinator {
        Coordinator(value: $value)
    }
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = color
        slider.value = Float(value)
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged(_:)),
                         for: .valueChanged)
        return slider
    }
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    class Coordinator: NSObject {
        // 1
        var value: Binding<Double>
        // 2
        init(value: Binding<Double>) {
            self.value = value
        }
        // 3
        @objc func valueChanged(_ sender: UISlider) {
            self.value.wrappedValue = Double(sender.value)
        }
    }
}

