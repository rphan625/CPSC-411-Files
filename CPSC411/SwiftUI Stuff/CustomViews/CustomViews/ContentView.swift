//
//  ContentView.swift
//  CustomViews
//
//  Created by csuftitan on 11/16/22.
//

import SwiftUI

struct ContentView: View {
    let speaker = Speaker(

         name: "Wei-Meng Lee",

         title: "Founder, Learn2Develop.net",

         email: "weimenglee@learn2develop.net",

         twitter: "@weimenglee",

         URL: "http://calendar.learn2develop.net",

         imageName: "weimenglee",

         profile: "Wei-Meng Lee is a technologist and founder of Developer Learning Solutions (http://www.learn2develop.net), a technology company specializing in hands-on training on the latest Web and mobile technologies.")

 

    var body: some View {

        SpeakerView(speaker: speaker)

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
