//
//  ContentView.swift
//  Toggle
//
//  Created by csuftitan on 11/2/22.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        HStack {
//            Image(systemName: "globe")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
////                .frame(width: 100, height: 100)
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            VStack(alignment:.leading) {
//                Text("Me")
//                Text("CS-522")
//                Text("800 N. State College Blvd.")
//                Text("Fullerton, CA 92801")
//            }
//        }
//        .padding()
//    }
//}

// TOGGLE----------------------------------------------

//struct ContentView : View {
//    @State private var isPushEnable = false
//
//    var body: some View {
//        Form {
//            Section {
//                Toggle(isOn: $isPushEnable) {
//                    Text("Push Notification")
//                }
//
//                if isPushEnable {
//                    Text("Schedule Notification")
//                }
//            }
//        }
//    }
//}

// TEXTFIELD-------------------------------------------

//struct ContentView : View {
//  @State private var username: String = ""
//  var body: some View {
//    Form {
//      Section {
//        TextField("Username", text: $username)
//      }
//    }
//  }
//}

// PICKER-----------------------------------------------
//struct ContentView : View {
//  var fruits = ["Apple", "Apricot", "Banana", "Pear"]
//  @State var selectedFruit = 0
//
//  var body: some View {
//    NavigationView {
//      Form {
//        Section {
//          Picker(selection: $selectedFruit, label: Text("Fruit")) {
//            ForEach(0 ..< fruits.count) {
//              Text(self.fruits[$0]).tag($0)
//            }
//          }//.pickerStyle(.wheel)
//        }
//      }.navigationBarTitle(Text("Select your Fruit"))
//    }
//  }
//}

// SEGMENTED CONTROL-------------------------------------
//struct ContentView : View {
//  var colors = ["Blue", "Yellow", "Red"]
//
//  @State private var selectedColor = 0
//  var body: some View {
//    VStack {
////      SegmentedControl(selection: $selectedColor) {
//      Picker("Colors", selection: $selectedColor) {
//        ForEach(0..<colors.count) { index in
////            Text(self.colors[index]).tag(index)
//            Text($0)
//        }
//      }.pickerStyle(SegmentedPickerStyle())
//        Text("value: \(selectedColor)")
//    }
//  }
//}

// SCROLLVIEW
//struct ContentView : View {
//  var colors: [Color] = [.blue, .red, .yellow, .pink]
//  @State private var selectedColor = 0
//
//  var body: some View {
//    ScrollView(.horizontal) {
//      HStack(spacing: 0) {
//        ForEach(0..<colors.count) { index in
//          Rectangle().frame(width: 300, height: 300)
//            .foregroundColor(self.colors[index])
//        }
//      }.frame(height: 600)
//    }
//  }
//}

// LIST OF ITEMS
//struct ColorInfo: Identifiable {
//  var id = UUID()
//  var color: Color
//  var name: String
//}
//
//struct ContentView : View {
//  var colors = [ColorInfo(color: .red, name: "Red"),
//                ColorInfo(color: .blue, name: "Blue"),
//                ColorInfo(color: .yellow, name: "Yellow")]
//
//  var body: some View {
//    NavigationView {
//      List (colors) { colorInfo in
//        Text(colorInfo.name)
//          .foregroundColor(colorInfo.color)
//      }.navigationBarTitle(Text("List of Colors"))
//    }
//  }
//}

// FORM
//struct ContentView : View {
//  var colors = ["Red", "Green", "Blue"]
//  @State var enableNotifications = false
//  @State var username: String = ""
//  @State var selectedColor = 0
//
//  var body: some View {
//    NavigationView {
//      Form {
//        Section {
//          TextField("Username", text: $username)
//        }
//        Section {
//          Toggle(isOn: $enableNotifications) {
//            Text("Enable Notifications")
//          }
//          SegmentedControl(selection: $selectedColor) {
//            ForEach(0 ..< colors.count) {
//              Text(self.colors[$0]).tag($0)
//            }
//          }
//        }
//        Section {
//          Button(action: {}) {
//            Text("Save")
//          }
//        }
//      }.navigationBarTitle(Text("Settings"))
//    }
//  }
//}

// ALERT
//struct ContentView : View {
//@State var showingAlert = false
//
//var body: some View {
//  Button(action: {
//    self.showingAlert = true
//    }) {
//      Text("Show Alert")
//    }.presentation($showingAlert) {
//      Alert(title: Text("Important title"), message: Text("message"), dismissButton: .default(Text("Dismiss")))
//    }
//  }
//}

// ACTION SHEET
//struct ContentView : View {
//@State var showingSheet = false
//
//var body: some View {
//  Button(action: {
//    self.showingSheet = true
//  }) {
//    Text("Show Action Sheet")
//  }.presentation($showingSheet) {
//      ActionSheet(title: Text("Action title"), message: Text("description"), buttons: [.default(Text("Close"), onTrigger: {
//        self.showingSheet = false
//      })])
//    }
//  }
//}

// POPOVER
//struct ContentView : View {
//  @State var showingPopover = false
//
//  var body: some View {
//    Button(action: {
//      self.showingPopover = true
//    }) {
//      Text("Show new view")
//    }.popover(isPresented: $showingPopover){
//      HStack {
//        Text("New Popover")
//      }.frame(width: 500, height: 500)
//        .background(Color.red)
//    }
//  }
//}

// PSEUDO PHONE APP

//struct Favorites: View {
//    var body: some View {
//        NavigationView {
//            NavigationLink(destination: DetailView()) {
//                Text("Tap me!")
//            }
//            .navigationBarTitle("Favorites")
//        }
//    }
//}
//
//struct Recents: View {
//    var body: some View {
//        NavigationView {
//            Text("Recents")
//            .navigationBarTitle("Recents")
//        }
//    }
//}
//
//struct Contacts: View {
//    var body: some View {
//        NavigationView {
//            Text("Contacts")
//            .navigationBarTitle("Contacts")
//        }
//    }
//}
//
//struct Keypad: View {
//    var body: some View {
//        NavigationView {
//            Text("Keypad")
//                .navigationBarTitle("Keypad")
//        }
//    }
//}
//
//struct Voicemail: View {
//    var body: some View {
//        NavigationView {
//            Text("Voicemail")
//                .navigationBarTitle("Voicemail")
//        }
//    }
//}
//
//struct DetailView: View {
//    var body: some View {
//        Text("DetailView")
//        .navigationBarTitle("DetailView",
//            displayMode: .inline)
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        TabView {
//            Favorites()
//                .tabItem {
//                    Image(systemName: "star")
//                    Text("Favorites")
//                }
//            Recents()
//                .tabItem {
//                   Image(systemName: "clock")
//                   Text("Recents")
//                }
//            Contacts()
//                .tabItem {
//                    Image(systemName: "person")
//                    Text("Contacts")
//                }
//            Keypad()
//                .tabItem {
//                    Image(systemName: "circle.grid.3x3.fill")
//                    Text("Keypad")
//                }
//            Voicemail()
//                .tabItem {
//                    Image(systemName: "recordingtape")
//                    Text("Voicemail")
//                }
//        }
//    }
//}

//struct ContentView: View {
//    @State var offset:CGFloat = 0
//    @State private var username: String = ""
//    @State private var password: String = ""
//
//    var body: some View {
//        VStack {
//            Text("Username")
//            TextField("Enter username", text:$username)
//                .frame(width: 300, height: 30)
//                .border(Color.black)
//
//            Text("Password")
//            SecureField("Enter a password",
//                text: $password)
//                .frame(width: 300, height: 30)
//                .offset(x: offset)  // amount to "shake"
//                .animation(
//                  offset != 0 ?
//                     Animation.default
//                    .repeatCount(5).speed(4)
//                    :
//                    nil) // if offset is not zero, animate
//                .border(Color.black)
//
//            Button(action: {
//                if true {  // simulates login failed
//                    self.offset = 20 // set "shake" amount
//
//                    // after a delay of 0.5 seconds, set
//                    // offset to 0 to bring back the
//                    // SecureField to its original
//                    // position
//                    DispatchQueue.main.asyncAfter(
//                        deadline: .now() + 0.5) {
//                        self.offset = 0
//                    }
//                }
//            }) {
//                Text("Login")
//            }
//        }
//    }
//}

// SHARE BUTTON FOR IMG

//struct ContentView: View {
//    func shareURLButton() {
//        let img = UIImage(named: "macintoshse")
//        let avc = UIActivityViewController(
//            activityItems: [img!],
//            applicationActivities: nil)
//
//        UIApplication.shared.windows.first?
//            .rootViewController?.present(
//            avc, animated: true, completion: nil)
//    }
//
//    var body: some View {
//        NavigationView {
//            Image("macintoshse")
//                .resizable()
//                .frame(width: 200.0, height: 220.0)
//                .navigationBarItems(trailing:
//                    Button(action: {
//                        self.shareURLButton()
//                    }) {
//                       Image(systemName:
//                           "square.and.arrow.up")
//                    }
//                )
//               .navigationBarTitle("Share Sheet Example")
//        }
//    }
//}

struct ContentView: View {
    func shareURLButton() {
        let img = UIImage(named: "macintoshse")
        let avc = UIActivityViewController(
            activityItems: [img!],
            applicationActivities: nil)
    
        UIApplication.shared.windows.first?
            .rootViewController?.present(
            avc, animated: true, completion: nil)
    }

    var body: some View {
            NavigationView {
                Image("macintoshse")
                    .resizable()
                    .frame(width: 200.0, height: 220.0)
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.shareURLButton()
                        }) {
                           Image(systemName:
                               "square.and.arrow.up")
                        }
                    )
                    .contextMenu {
                        Button(action: {
                            self.shareURLButton()
                        }) {
                            Text("Share")
                            Image(systemName:
                                "square.and.arrow.up")
                        }
                    }
                   .navigationBarTitle("Share Sheet Example")
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
