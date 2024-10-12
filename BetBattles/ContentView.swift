//
//  ContentView.swift
//  BetBattles
//
//  Created by Edvin Mujanovic on 2024-03-07.
//

import SwiftUI

struct ContentView: View {
    @State private var matchManager = Match()
    @State private var selectedMatch: MatchModel?

    var body: some View {
        NavigationView {
            VStack {
                if !matchManager.matchModels.isEmpty {
                    // Data loaded, display list
                    List(matchManager.matchModels, id: \.bookmaker.bookmakerKey) { matchModel in
                        NavigationLink(destination: MatchView(matchModel: matchModel)) {
                            MatchRow(matchModel: matchModel)
                        }
                    }
                } else {
                    // Data not loaded, display try again button
                    Button("Try Again") {
                        Task {
                            await loadMatchData()
                        }
                    }
                    .buttonStyle(CustomButtonStyle())
                }
            }
            .padding()
        }
        .onAppear {
            Task {
                await loadMatchData()
            }
        }
        .navigationTitle("BetBattles")
    }

    private func loadMatchData() async {
        do {
            try await matchManager.loadMatch()
        } catch {
            print("Failed to load match data: \(error)")
        }
    }
}
