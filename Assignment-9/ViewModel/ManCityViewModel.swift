//
//  ManCityViewModel.swift
//  Assignment-9
//
//  Created by Kevin Wolbart on 7/19/25.
//

import Foundation

class ManCityViewModel: ObservableObject {
    @Published var manCitySeason: [MatchModel] = []
    @Published var hasError = false
    @Published var matchError : MatchModelError?
    
    @MainActor
    func fetchSeason() async {
        //self.isLoading = true
        //self.manCitySeason.removeAll()
        
        let baseUrl = "https://api.football-data.org/v4/teams/65/matches"
        
        // ENTER YOUR OWN API KEY
        let apiKey = ""
        
        guard var components = URLComponents(string : baseUrl) else { return }
        components.queryItems = [
            URLQueryItem(name: "season", value: "2024"),
        ]
        
        guard let url = components.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(apiKey, forHTTPHeaderField: "X-Auth-Token")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let response = try JSONDecoder().decode(FootballAPIResponse.self, from: data)

            let filtered = response.matches
            
            self.manCitySeason = filtered
            //self.isLoading = false
            
            
        } catch {
            self.hasError = true
            self.matchError = .customError(error: error)
            //self.isLoading = false
        }
}
    
    struct FootballAPIResponse : Codable {
        let matches : [MatchModel]
    }
    
    enum MatchModelError : LocalizedError {
        case decodingError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
                case .decodingError:
                return "Error decoding JSON"
            case .customError(error: let error):
                return error.localizedDescription
            }
        }
    }
}
