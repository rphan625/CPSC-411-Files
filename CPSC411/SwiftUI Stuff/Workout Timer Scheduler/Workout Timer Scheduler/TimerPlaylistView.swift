//
//  TimerPlaylistView.swift
//  Workout Timer Scheduler
//
//  Created by csuftitan on 12/8/22.
//

import SwiftUI

class TimerList: ObservableObject {
    @Published var timerItemList = [TimerItem()]
}

struct TimerPlaylistView: View {
    @EnvironmentObject var timerlist : TimerList
    @State private var showCreateView = false
    @State private var editMode: EditMode = .inactive
    
    func delete(at offsets: IndexSet) {
        timerlist.timerItemList.remove(atOffsets: offsets)
    }
    
    @discardableResult func iterateOverTimerList(timers: [TimerItem]) -> SimpleTimerView? {
        for timer in timers {
            return SimpleTimerView(timersetting: timerSettings(seconds: Int(timer.seconds)))
        }
        return nil
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
//                    iterateOverTimerList(timers: timerlist.timerItemList)
                    RunningTimerPlaylistView()
                } label: {
                    Text("Show Playlist")
                }
                List {
                    ForEach(timerlist.timerItemList, id: \.id) { timer in
                        let (hourQuotient, hourRemainder) = timer.seconds.quotientAndRemainder(dividingBy: 3600)
                        let (minuteQuotient, _) = hourRemainder.quotientAndRemainder(dividingBy: 60)
                        NavigationLink(
                            destination:
//                                CreateTimerView(timerlist: TimerList(), timeritem: TimerItem())
//                                if editMode.isEditing == true {
//                                    EditTimerView()
//                                        .environmentObject(TimerItem())
//                                } else {
//                                    DisplayTimerView()
//                                        .environmentObject(TimerItem())
//                                }
//                            DisplayTimerView(timersetting: timerSettings(seconds: Int(timer.seconds)), timeritem: TimerItem())
//                                .environmentObject(TimerItem())
                            
                            SimpleTimerView(timersetting: timerSettings(seconds: Int(timer.seconds)))
                        ) {
                            HStack {
                                Text("\(timer.name)")
                                Spacer()
                                Text("\(String(format: "%02d", hourQuotient)):\(String(format: "%02d", minuteQuotient)):\(String(format: "%02d", (timer.seconds % 60)))")
//                                Text("\(timer.date)")
                            }
                        }
                    }
                    .onDelete(perform: delete)
                }
            }
            .toolbar {
//                EditButton()
                Button("Add") {
                    showCreateView = true
                }
                .sheet(isPresented: $showCreateView) {
                    NavigationStack {
                        CreateTimerView(timeritem: TimerItem())
//                        SimpleTimerView(timersetting: 60)
                    }
                }
            }
            .navigationTitle("Timer Playlist")
            
        }
        .environmentObject(timerlist)
    }
}

struct TimerPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        TimerPlaylistView()
            .environmentObject(TimerList())
    }
}
