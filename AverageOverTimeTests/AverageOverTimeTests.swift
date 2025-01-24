//
//  AverageOverTimeTests.swift
//  AverageOverTimeTests
//
//  Created by Dax Gerber on 1/24/25.
//

import Testing
@testable import AverageOverTime
import Foundation

struct AverageOverTimeTests {
        
    var vm = HomeViewModel()
    
    @Test func testAverageCalculation() {
        vm.taps = 30
        vm.startTime = Date().addingTimeInterval(-60)
        vm.endTime = Date()
        let avg = vm.calculateAveragePerMinute()
        #expect(avg == "30.0")
    }
    @Test func testStartTimer() {
        vm.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            vm.elapsedTime += 1
            #expect(vm.elapsedTime >= 1)
        }
    }
    @Test func testStopTimer() {
        vm.startTimer()
        #expect(vm.timer != nil)
        vm.timer?.invalidate()
        vm.timer = nil
        #expect(vm.timer == nil)
    }
    
    @Test func testFormatTime() {
        vm.elapsedTime = 60
        #expect(vm.formattedTime() == "01:00")
        vm.elapsedTime = 3601
        #expect(vm.formattedTime() == "60:01")
        vm.elapsedTime = 5
        #expect(vm.formattedTime() == "00:05")
    }
}
