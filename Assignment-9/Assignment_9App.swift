//
//  Assignment_9App.swift
//  Assignment-9
//
//  Created by Kevin Wolbart on 7/18/25.
//

import SwiftUI

@main
struct Assignment_9App: App {
    
    @StateObject var season = ManCityViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TeamView()
                    .environmentObject(season)
            }
            
        }
    }
}
