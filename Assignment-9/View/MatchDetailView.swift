//
//  MatchDetailView.swift
//  Assignment-9
//
//  Created by Kevin Wolbart on 7/20/25.
//

import SwiftUI

struct MatchDetailView: View {
    
    var match: MatchModel
    
    var body: some View {
        VStack {
            VStack {
                Text(match.homeTeam.name)
                    .font(.title)
                AsyncImage(url: URL(string: match.homeTeam.crest)) { phase in
                    switch phase {
                    case .empty:
                        ZStack {
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(maxWidth: .infinity)
                                .aspectRatio(1.4, contentMode: .fill)
                            ProgressView()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    case .success(let image):
                        image
                            .resizable()
                            .frame(maxWidth: 300)
                            .aspectRatio(1.4, contentMode: .fit)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    case .failure:
                        Color.gray
                            .frame(maxWidth: 300)
                            .aspectRatio(1.4, contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    @unknown default:
                        EmptyView()
                    }
                }
            }
            
            HStack {
                Text("\(match.homeTeam.tla): \(match.score.fullTime.home)")
                    .font(.headline)
                Spacer()
                VStack {
                    Text(match.status)
                    Text(match.utcDate)
                }
                
                Spacer()
                Text("\(match.awayTeam.tla): \(match.score.fullTime.away)")
                    .font(.headline)
            }
            .padding(30)
            VStack {
                Text(match.awayTeam.name)
                    .font(.title)
                AsyncImage(url: URL(string: match.awayTeam.crest)) { phase in
                                switch phase {
                                case .empty:
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.gray.opacity(0.2))
                                            .frame(maxWidth: .infinity)
                                            .aspectRatio(1.4, contentMode: .fill)
                                        ProgressView()
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                case .success(let image):
                                    image
                                        .resizable()
                                        .frame(maxWidth: 300)
                                        .aspectRatio(1.4, contentMode: .fit)
                                        .clipped()
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                case .failure:
                                    Color.gray
                                        .frame(maxWidth: 300)
                                        .aspectRatio(1.4, contentMode: .fit)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                @unknown default:
                                    EmptyView()
                                }
                            }
            }
            
        }
    }
}

#Preview {
    MatchDetailView(match: MatchModel(
        competition: Competition(
            id: 64,
            name: "Premire League"
        ),
        id: 123,
        utcDate: "Jan-13-2025",
        status: "FINISHED",
        matchday: 1,
        homeTeam: HomeTeam(
            id: 64,
            name: "Man City",
            tla: "Man",
            crest: "image URl",
        ),
        awayTeam: AwayTeam(
            id: 64,
            name: "Chelsea",
            tla: "CHE",
            crest: "image URl",
        ),
        score: Score(
            winner: "Home",
            fullTime: FullTime(
                home: 0,
                away: 2
            ),
        ),
    )
)
}
