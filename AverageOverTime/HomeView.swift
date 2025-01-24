//
//  ContentView.swift
//  AverageOverTime
//
//  Created by Dax Gerber on 1/24/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    startButtonTapped()
                } label: {
                    Text("Start")
                }
                Spacer()
                Text(vm.timerText)
                    .padding(.horizontal)
                    .font(.title3)
                Spacer()
                Button {
                    endButtonTapped()
                } label: {
                    Text("End")
                }
                Spacer()
            }
            .padding(.bottom, 40)
            .buttonStyle(.borderedProminent)
            Button {
                vm.taps += 1
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 150)
                    Text("Tap")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
            }
            .disabled(vm.timer == nil)

            //show the taps
            Group {
                Text("\(vm.taps)")
                    .padding(.vertical, 40)
                Text("Taps per minute:")
                Text(vm.tapsPerMinute == nil ? "0 taps/min" : vm.tapsPerMinute! + " taps/min")
            }
            .font(.title3)
            Button {
                resetButtonTapped()
            } label: {
                Text("Reset")
            }
            .padding(.top, 60)
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
    }
    
    
    func resetButtonTapped() {
        vm.taps = 0
        vm.tapsPerMinute = nil
        vm.timerText = "00:00"
        vm.stopTimer()
        vm.elapsedTime = 0
    }
    
    func endButtonTapped() {
        vm.endTime = Date()
        vm.stopTimer()
        vm.tapsPerMinute = vm.calculateAveragePerMinute()
    }
    
    func startButtonTapped() {
        vm.startTime = Date()
        vm.startTimer()
    }
}

#Preview {
    HomeView()
}
