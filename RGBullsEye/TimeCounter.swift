//
//  TimeCounter.swift
//  RGBullsEye
//
//  Created by Amr Hesham on 17/09/2021.
//

import Foundation
import Combine

// MARK: - TimeCounter

class TimeCounter: ObservableObject {
    
    // MARK: - Properties
    var timer: Timer?
    @Published var counter = 0
    
    // MARK: - Init
    init() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    // MARK: - Methods
    @objc func updateCounter() {
        counter += 1
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
