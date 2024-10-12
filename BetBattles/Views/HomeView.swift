//
//  HomeView.swift
//  BetBattles
//
//  Created by Edvin Mujanovic on 2024-10-12.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to BetBattles")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: MatchListView()) {
                    Text("View Upcoming Matches")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
