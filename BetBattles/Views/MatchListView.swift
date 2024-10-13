//
//  MatchListView.swift
//  BetBattles
//
//  Created by Edvin Mujanovic on 2024-10-14.
//

import SwiftUI

struct MatchListView: View {
    @State private var matchManager = Match()

    var body: some View {
        VStack {
            if !matchManager.matchModels.isEmpty {
                // Data loaded, display list
                List(matchManager.matchModels, id: \.id) { matchModel in
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
            }
        }
        .onAppear {
            Task {
                await loadMatchData()
            }
        }
        .navigationTitle("Upcoming Matches")
    }

    private func loadMatchData() async {
        do {
            try await matchManager.loadMatch()
        } catch {
            print("Failed to load match data: \(error)")
        }
    }
}
