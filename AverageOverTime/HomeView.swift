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
                    vm.startButtonTapped()
                } label: {
                    Text("Start")
                }
                Spacer()
                Text(vm.timerText)
                    .padding(.horizontal)
                    .font(.title3)
                Spacer()
                Button {
                    vm.endButtonTapped()
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
                vm.resetButtonTapped()
            } label: {
                Text("Reset")
            }
            .padding(.top, 60)
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
    }
    
    
}

#Preview {
    HomeView()
}
