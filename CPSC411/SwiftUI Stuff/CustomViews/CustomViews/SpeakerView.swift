//
//  SpeakerView.swift
//  CustomViews
//
//  Created by csuftitan on 11/16/22.
//

import SwiftUI


struct Speaker {
    var name: String
    var title: String
    var email: String
    var twitter: String
    var URL: String
    var imageName: String
    var profile: String
}

extension View {
    public func addBorder<S>(_ content: S,
                             width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        return overlay(RoundedRectangle(
            cornerRadius: cornerRadius).strokeBorder(
                content, lineWidth: width))
    }
}

struct Picture: View {
    var imageFilename : String
    
    var body: some View {
        Image(imageFilename)
            .resizable()
            .frame(width: 100, height: 100)
            .cornerRadius(15)
            .addBorder(Color.black, width: 1, cornerRadius: 15)
    }
}

struct Contact: View {
    var detail: String
    var imageType: String
    var imageName: String

    var body: some View {
        HStack {
            if (imageType=="System"){
                Image(systemName: imageName)
            } else {
                Image(imageName).resizable()
                   .frame(width: 25, height: 25)
            }
            Text(detail).font(.footnote)
        }
    }
}

struct SpeakerHeader: View {
    var speaker: Speaker

    var body: some View {
        VStack(alignment: .leading) {
            Text(speaker.name)
                .font(.largeTitle)
                .foregroundColor(.primary)
                .bold()
            Text(speaker.title)
                .foregroundColor(.secondary)
            Contact(detail: speaker.email,
                    imageType: "System",
                    imageName: "envelope")
            Contact(detail: speaker.twitter,
                    imageType: "nil",
                    imageName: "twitter")
            Contact(detail: speaker.URL,
                    imageType: "System",
                    imageName: "safari")
        }
    }
}

struct SpeakerView: View {
    var speaker: Speaker
    var body: some View {
        VStack {
            HStack {
                Picture(imageFilename: speaker.imageName)
                SpeakerHeader(speaker: speaker)
            }
            Spacer().frame(height: 15)
            Divider()
            Text(speaker.profile)
                .font(.footnote)
                .italic()
                .multilineTextAlignment(.center)
        }
    }
}

//struct SpeakerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpeakerView()
//    }
//}

