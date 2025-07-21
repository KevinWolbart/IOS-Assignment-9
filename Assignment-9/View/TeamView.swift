//
//  TeamView.swift
//  Assignment-9
//
//  Created by Kevin Wolbart on 7/20/25.
//

import SwiftUI

struct TeamView: View {
    
    @EnvironmentObject var season : ManCityViewModel
    
    var body: some View {
        VStack {
            Text("Man City FC")
                .font(.largeTitle)
            Image("ManCityLogo")
                .resizable()
                .frame(maxWidth: 300)
                .aspectRatio(1.3, contentMode: .fit)
            Text("Matches")
                .font(.title)
                .padding(30)
            ScrollView {
                VStack {
                    ForEach(season.manCitySeason) { match in
                        NavigationLink(destination: MatchDetailView(match: match)) {
                            HStack {
                                Text(match.homeTeam.name)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                Spacer()
                                Text("vs")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                Spacer()
                                Text(match.awayTeam.name)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                            .padding(20)
                        }
                    }
                }
            }
            .task {
                await season.fetchSeason()
            }
            .alert(isPresented: $season.hasError, error: season.matchError) { _ in
                Button("Ok", role: .cancel) {}
            } message: { error in
                Text(error.localizedDescription)
            }
        }
    }
}

#Preview {
    TeamView().environmentObject(ManCityViewModel())
}
