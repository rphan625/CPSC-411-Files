//
//  ListLayout.swift
//  Moonshot
//
//  Created by csuftitan on 12/2/22.
//

import SwiftUI

struct ListLayout: View {
    let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        ScrollView {
            List {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                        }
                    }
                }
            }
            .frame(minHeight: 770, maxHeight: .infinity)
        }
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

struct ListLayout_Previews: PreviewProvider {
    static var previews: some View {
        ListLayout()
    }
}
