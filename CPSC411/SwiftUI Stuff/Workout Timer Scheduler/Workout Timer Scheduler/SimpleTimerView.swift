//
//  SimpleTimerView.swift
//  Workout Timer Scheduler
//
//  Created by csuftitan on 12/5/22.
//

import SwiftUI
import AVFoundation

class timerSettings: ObservableObject {
    @Published var seconds = 0
    @Published var minutes = 0
    @Published var hours = 0
    @Published var totalSeconds = 0
    @Published var timerRunning = false
    @Published var elapsedTime = 0
    
    init() {
        self.seconds = 0
        self.minutes = 0
        self.hours = 0
        self.totalSeconds = 0
    }
    
    init(seconds:Int) {
        var hoursRemainder = 0
        self.seconds = seconds % 60
        (self.hours, hoursRemainder) = seconds.quotientAndRemainder(dividingBy: 3600)
        (self.minutes, _) = hoursRemainder.quotientAndRemainder(dividingBy: 60)
    }
}

struct ProgressRing: View {
    @EnvironmentObject var timersetting : timerSettings
    @State var progress = 0.0
    @State var remainingTime = 0
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            // MARK: Placeholder Ring
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            // MARK: Colored Ring
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [.blue, .pink, .red, .purple]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeOut(duration: 1.3), value: progress)
            
            VStack(spacing: 30) {
                // MARK: Elapsed Time
                
                VStack(spacing: 5) {
                    Text("Elapsed Time")
                        .opacity(0.7)
                    let (elapsedHoursQuotient, _) = timersetting.elapsedTime.quotientAndRemainder(dividingBy: 3600)
                    let (elapsedMinutesQuotient, _) = timersetting.elapsedTime.quotientAndRemainder(dividingBy: 60) // remainder is _ cause not needed
//                    Text("\(timersetting.hours):\(timersetting.minutes):\(timersetting.seconds)")
                    Text("\(String(format:"%02d", elapsedHoursQuotient)):\(String(format:"%02d", elapsedMinutesQuotient)):\(String(format:"%02d", timersetting.elapsedTime % 60))")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top)
                // MARK: Remaining Time
                VStack(spacing: 5) {
                    Text("Remaining Time")
                        .opacity(0.7)
                    let (remainingHoursQuotient, remainingHoursRemainder) = (timersetting.totalSeconds - timersetting.elapsedTime).quotientAndRemainder(dividingBy: 3600)
                    let (remainingMinutesQuotient, _) = (remainingHoursRemainder).quotientAndRemainder(dividingBy: 60)
//                    Text("\(timersetting.totalSeconds - elapsedTime)")
                    Text("\(String(format:"%02d", remainingHoursQuotient)):\(String(format:"%02d", remainingMinutesQuotient)):\(String(format:"%02d", (timersetting.totalSeconds - timersetting.elapsedTime) % 60))")
                        .font(.title2 )
                        .fontWeight(.bold)
                        .onReceive(timer) { _ in
                            if timersetting.totalSeconds - timersetting.elapsedTime > 0 && timersetting.timerRunning {
                                timersetting.elapsedTime += 1
                                progress = 1.0 / Double(timersetting.totalSeconds) * Double(timersetting.elapsedTime)
                            } else {
                                timersetting.timerRunning = false
                            }
                        }
                }
            }
        }
        .frame(width: 250, height: 250)
        .padding()
        .onAppear {
            progress = 1.0 / Double(timersetting.totalSeconds) * Double(timersetting.elapsedTime)
        }
        .environmentObject(timersetting)
    }
}


struct SimpleTimerView: View {
    @ObservedObject var timersetting: timerSettings
    
    @State var countdownTimer = 0
    @State private var startTimer = false
    
    let chooseSeconds = Array<Int>(0...59)
    let chooseMinutes = Array<Int>(0...59)
    let chooseHours   = Array<Int>(0...24)
    
    
    var body: some View {
        NavigationView {
            if startTimer {
                runningTimer
            } else {
                setTimer
            }
            
        }
    }
    
    var content: some View {
        ZStack {
            // MARK: Progress Ring
            
            ProgressRing()
        }
    }
    
    var setTimer: some View {
        VStack {
            // MARK: Picker Wheels
            Section {
                Text("Timer")
                    .font(.system(size: 70, weight: .semibold))
                    .foregroundColor(.primary)
                    .padding(.top)
                HStack {
                    // MARK: Hours Picker Wheel
                    VStack {
                        Picker("Hours", selection: $timersetting.hours) {
                            ForEach(chooseHours, id: \.self) {
                                Text("\($0)")
                                    .scaleEffect(x: 4)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(maxWidth: 50)
                        .compositingGroup()
                        .scaleEffect(x: 0.25)
                        .padding()
                        
                        Text("Hours")
                    }
                    // MARK: Minutes Picker Wheel
                    VStack {
                        Picker("Minutes", selection: $timersetting.minutes) {
                            ForEach(chooseMinutes, id: \.self) {
                                Text("\($0)")
                                    .scaleEffect(x: 4)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(maxWidth: 50)
                        .compositingGroup()
                        .scaleEffect(x: 0.25)
                        .padding()
                        
                        Text("Minutes")
                    }
                    // MARK: Seconds Picker Wheel
                    VStack {
                        Picker("Seconds", selection: $timersetting.seconds) {
                            ForEach(chooseSeconds, id: \.self) {
                                Text("\($0)")
                                    .scaleEffect(x: 4)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(maxWidth: 50)
                        .compositingGroup()
                        .scaleEffect(x: 0.25)
                        .padding()
                        
                        Text("Seconds")
                    }
                }
            }
            // MARK: Start button
            Section {
                Button("Start") {
                    timersetting.totalSeconds = (timersetting.seconds) + (timersetting.minutes * 60) + (timersetting.hours * 3600)
                    startTimer = true
                    timersetting.timerRunning = true
                    //                    print("\(timersetting.hours):\(timersetting.minutes):\(timersetting.seconds)")
                    //                    print(timersetting.totalSeconds)
                }
                .frame(width: 100, height: 100)
                .foregroundColor(.primary)
                .background(.secondary)
                .clipShape(Circle())
                .font(.title3)
                .padding()
            }
        }
        .preferredColorScheme(.dark)
        .environmentObject(timersetting)
    }
    
    var runningTimer: some View {
        // MARK: Title
        VStack {
            Text("Timer")
                .font(.system(size: 70, weight: .semibold))
                .foregroundColor(.primary)
            
            // MARK: Timer Progress
            content
            
            // MARK: Buttons
            HStack {
                // MARK: Pause/Resume button
                Button(timersetting.timerRunning ? "Pause" : "Resume") {
//                    let pauseTime = timersetting.totalSeconds - timersetting.elapsedTime
//                    timersetting.elapsedTime = 0
                    timersetting.timerRunning.toggle()
                    
                    
                    // stop timer there, don't toggle timerRunning
                }
                .frame(width: 100, height: 100)
                .foregroundColor(.primary)
                .background(.secondary)
                .clipShape(Circle())
                .font(.title3)
                
                // MARK: Reset button
                Button("Reset") {
                    countdownTimer = timersetting.totalSeconds
                    timersetting.elapsedTime = 0
                    startTimer = false
                }
                .frame(width: 100, height: 100)
                .foregroundColor(.primary)
                .background(.red)
                .clipShape(Circle())
                .font(.title3)
            }
            .preferredColorScheme(.dark)
        }
        .environmentObject(timerSettings())
    }
}

struct SimpleTimerView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleTimerView(timersetting: timerSettings())
    }
}
