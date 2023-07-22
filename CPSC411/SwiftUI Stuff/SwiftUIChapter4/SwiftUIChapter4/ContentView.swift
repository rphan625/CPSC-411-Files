//
//  ContentView.swift
//  SwiftUIChapter4
//
//  Created by csuftitan on 11/8/22.
//

import SwiftUI


// TEXTFIELD

//struct ContentView: View {
//    @State private var firstName:String = ""
//    @State private var lastName:String = ""
//
//    func removeSpecialCharsFromString(text:String) -> String {
//        return text.components(separatedBy: CharacterSet.alphanumerics.inverted)
//            .joined()
//            .lowercased()
//    }
//
//    var body: some View {
//        VStack {
//            TextField("First Name", text: $firstName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            TextField("Last Name", text: $lastName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            Text("Your UserID: \(removeSpecialCharsFromString(text: (firstName + lastName)))")
//        }
//        .padding()
//        .font(.title)
//    }
//}

// SECUREFIELD

//struct ContentView: View {
//
//    @State var username: String = ""
//    @State var password: String = ""
//    private var enableButton: Bool {
//        !username.isEmpty && !password.isEmpty
//}
//    var body: some View {
//        Group {
//            HStack {
//                Text("Username").font(.title)
//                TextField("Username", text: $username).border(Color.black)
//            }
//            HStack {
//                Text("Password").font(.title)
//                TextField("Password", text: $password).border(Color.black)
//            }
//            Button("Login") {
//                print("Logging in using \(self.username) and \(self.password)")
//            }.disabled(!enableButton)
//        }.padding()
//            .font(.title)
//    }
//}

// TOGGLE

//struct ContentView: View {
//    @State private var showFavorites = true
//
//    var body: some View {
//        VStack {
//            Toggle(isOn: $showFavorites) {
//                Text("Show Favorites").bold()
//            }.padding()
//                .background(showFavorites ? Color.yellow : Color.gray)
//                .labelsHidden()
//        }
//    }
//}

// SLIDER

//struct ContentView: View {
//    @State var sliderTempC = 23.0
//    @State var sliderTempF = 0.0
//
//    var minimumTemp = 20.0
//    var maximumTemp = 38.0
//    var body: some View {
//      VStack {
//          HStack {
//              Text("\(Int(minimumTemp)) °C")
////              Slider(value: $sliderTemp,
////                  in: minimumTemp...maximumTemp)
//                  Slider(value:
//                      Binding(get: {
//                          self.sliderTempC
//                      }, set: { (newVal) in
//                          self.sliderTempC = newVal
//                          self.sliderTempF =
//                          self.sliderTempC * 9 / 5 + 32; in: minimumTempC...maximumTempC)
//              Text("\(Int(maximumTemp)) °C")
//          }.padding()
//          Text(
//            "Temperature Selected: \(Int(sliderTemp)) °C")
//      }
//} }


//struct ContentView: View {
//    @State var sliderTempC = 23.0
//    @State var sliderTempF = 0.0
//
//    var minimumTempC = -17.7778
//    var maximumTempC = 50.0
//
//    var minimumTempF = 0.0
//    var maximumTempF = 122.0
//
//    init() {
//        self._sliderTempF = State(initialValue:
//            sliderTempC * 9 / 5 + 32)
//    }
//
//    var body: some View {
//        VStack {
//            Text("Temperature in Degree Celsius").bold()
//            HStack {
//                Text("\(String(format: "%.2f",
//                    minimumTempC)) °C")
//                Slider(value:
//                    Binding(get: {
//                        self.sliderTempC
//                    }, set: { (newVal) in
//                        self.sliderTempC = newVal
//                        self.sliderTempF =
//                    self.sliderTempC * 9 / 5 + 32
//            }),
//                    in: minimumTempC...maximumTempC)
//                Text("\(String(format: "%.2f",
//                    maximumTempC)) °C")
//            }.padding()
//            Text("\((String(format: "%.2f",
//                            sliderTempC as Double))) °C").bold()
//            Divider()
//            Text("Temperature in Fahrenheit").bold()
//            HStack {
//                Text("\(String(format: "%.2f",
//                    minimumTempF)) F")
//                Slider(value:
//                    Binding(get: {
//                        self.sliderTempF
//                    }, set: { (newVal) in
//                        self.sliderTempF = newVal
//                        self.sliderTempC =
//                           (self.sliderTempF - 32) * 5 / 9
//                    }),
//                    in: minimumTempF...maximumTempF)
//                Text("\(String(format: "%.2f",
//                    maximumTempF)) F")
//            }.padding()
//            Text("\((String(format: "%.2f",
//                            sliderTempF as Double))) °C").bold()
//        }
//    }
//}

//struct ContentView: View {
//    @State private var sliderTempC = 23.0
//    @State private var sliderTempF = 0.0
//    @State private var sliderTempK = 296.15
//    var minimumTempC = -17.7778
//    var maximumTempC = 50.0
//    var minimumTempF = 0.0
//    var maximumTempF = 122.0
//    var minimumTempK = 255.3722
//    var maximumTempK = 323.15
//    init() {
//        self._sliderTempF = State(initialValue:
//                                    sliderTempC * 9 / 5 + 32)
//    }
//
//    var body: some View {
//        VStack {
//            Section {
//                Text("Temperature in Fahrenheit").bold()
//                HStack {
//                    Text("\(String(format: "%.2f", minimumTempF)) F")
//                    Slider(value:
//                            Binding(get: {
//                        self.sliderTempF
//                    }, set: { (newVal) in
//                        self.sliderTempF = newVal
//                        self.sliderTempC =
//                        (self.sliderTempF - 32) * 5 / 9
//                        self.sliderTempK = (self.sliderTempC + 273.15)
//                    }),
//                           in: minimumTempF...maximumTempF)
//                    Text("\(String(format: "%.2f", maximumTempF)) F")
//                }.padding()
//                Text("\((String(format: "%.2f", sliderTempF as Double))) °F").bold()
//                Divider()
//            }
//            Section {
//                Text("Temperature in Degree Celsius").bold()
//                HStack {
//                    Text("\(String(format: "%.2f", minimumTempC)) °C")
//                    Slider(value:
//                            Binding(get: {self.sliderTempC
//                    }, set: { (newVal) in
//                        self.sliderTempC = newVal
//                        self.sliderTempF = self.sliderTempC * 9 / 5 + 32
//                        self.sliderTempK = self.sliderTempC + 273.15
//                    }),
//                           in: minimumTempC...maximumTempC)
//                    Text("\(String(format: "%.2f", maximumTempC)) °C")
//                }.padding()
//                Text("\((String(format: "%.2f",sliderTempC as Double))) °C").bold()
//                Divider()
//            }
//            Section {
//                Text("Temperature in Kelvin").bold()
//                HStack {
//                    Text("\(String(format: "%.2f", minimumTempK)) K")
//                    Slider(value:
//                            Binding(get: { self.sliderTempK
//                    }, set: { (newValK) in
//                        self.sliderTempK = newValK
//                        self.sliderTempC = (self.sliderTempK - 273.15)
//                        self.sliderTempF = (self.sliderTempC + 32) * 9 / 5
//                    }),
//                           in: minimumTempK...maximumTempK)
//                    Text("\(String(format: "%.2f", maximumTempK)) K")
//                }.padding()
//                Text("\((String(format: "%.2f", sliderTempK as Double))) °K").bold()
//            }
//        }
//    }
//}

// STEPPER

//struct ContentView: View {
//    @State private var qty = 1
//    @State private var minimumItems = 0
//    @State private var maximumItems = 10
//    var body: some View {
//        VStack {
//            Stepper(value: $qty, in: minimumItems...maximumItems,
//                    label: {
//                Text("Qty: \(qty)")
//            }).padding()
//            if (qty == minimumItems) {
//                Text("Item will be removed from the cart")
//            }
//            if (qty == maximumItems) {
//                Text("Maximum qty reached")
//            }
//        }
//} }

// PICKER

struct ContentView: View {
    var typesOfCoffee = ["Caffe Americano", "Caffe Latte", "Cappuccino", "Espresso", "Flat White", "Long Black", "Macchiato", "Mochaccino", "Irish Coffee", "Vienna", "Affogato"]
    @State private var selectedCoffee = 0

    var body: some View {
        VStack {
            HStack {
                Text("Coffee selected:")
                Picker(selection: $selectedCoffee, label: Text("Types of Coffee").bold()) {
                    ForEach(0..<typesOfCoffee.count) {
                        Text(self.typesOfCoffee[$0]).tag($0)
                    }
                }
                .padding()
                .labelsHidden()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
