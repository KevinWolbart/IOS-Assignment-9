//
//  MatchModel.swift
//  Assignment-9
//
//  Created by Kevin Wolbart on 7/20/25.
//

import Foundation

struct MatchModel: Codable, Identifiable {
    var competition: Competition
    var id: Int
    var utcDate: String
    var status: String
    var matchday: Int
    var homeTeam: HomeTeam
    var awayTeam: AwayTeam
    var score: Score
}

struct Competition: Codable, Identifiable {
    var id: Int
    var name: String
}

struct HomeTeam: Codable, Identifiable {
    var id: Int
    var name: String
    var tla: String
    var crest: String
}

struct AwayTeam: Codable, Identifiable {
    var id: Int
    var name: String
    var tla: String
    var crest: String
}

struct Score: Codable {
    var winner: String
    var fullTime: FullTime
}

struct FullTime: Codable {
    var home: Int
    var away: Int
}
