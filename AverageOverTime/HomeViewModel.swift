//
//  HomeViewModel.swift
//  AverageOverTime
//
//  Created by Dax Gerber on 1/24/25.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var startTime: Date?
    @Published var endTime: Date?
    @Published var taps = 0
    @Published var timerText = "00:00"
    @Published var timerStarted = false
    @Published var tapsPerMinute: String?
    @Published var timer: Timer?
    @Published var elapsedTime = 0
    
    
    
    
    func calculateAveragePerMinute() -> String {
        let timeInSeconds = endTime!.timeIntervalSince(startTime!)
        let tapsPerMinute = Double(taps * 60) / timeInSeconds
        let roundedValue = String(format: "%.1f", tapsPerMinute)
        return roundedValue
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.elapsedTime += 1
            self.timerText = self.formattedTime()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func formattedTime() -> String {
        let minutes = elapsedTime / 60
        let seconds = elapsedTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    
    
    //MARK: User actions
    func resetButtonTapped() {
        taps = 0
        tapsPerMinute = nil
        timerText = "00:00"
        stopTimer()
        elapsedTime = 0
    }
    
    func endButtonTapped() {
        endTime = Date()
        stopTimer()
        tapsPerMinute = calculateAveragePerMinute()
    }
    
    func startButtonTapped() {
        startTime = Date()
        startTimer()
    }
}
