//
//  RunningTimerPlaylistView.swift
//  Workout Timer Scheduler
//
//  Created by csuftitan on 12/13/22.
//

import SwiftUI

struct RunningTimerPlaylistView: View {
    @EnvironmentObject var timerlist: TimerList
    
    var body: some View {
        VStack {
            Button("Play Playlist") {
                for timer in timerlist.timerItemList {
                    print("\(timer.name)")
                    SimpleTimerView(timersetting: timerSettings(seconds: timer.seconds))
                }
            }
            
            List {
                ForEach(timerlist.timerItemList, id: \.id) { timer in
                    let (hourQuotient, hourRemainder) = timer.seconds.quotientAndRemainder(dividingBy: 3600)
                    let (minuteQuotient, _) = hourRemainder.quotientAndRemainder(dividingBy: 60)
                    HStack {
                        Text("\(timer.name)")
                        Spacer()
                        Text("\(String(format: "%02d", hourQuotient)):\(String(format: "%02d", minuteQuotient)):\(String(format: "%02d", (timer.seconds % 60)))")
                    }
                }
            }
        }
        .environmentObject(timerlist)
    }
}

struct RunningTimerPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        RunningTimerPlaylistView()
            .environmentObject(TimerList())
    }
}
