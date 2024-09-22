//
//  ContentView.swift
//  calorieMacros
//
//  Created by Benjamin van der Woerd on 2024-09-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            CameraView()
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
            MealLogView()
                .tabItem {
                    Label("Meal Log", systemImage: "list.bullet")
                }
            StatisticsView()
                .tabItem {
                    Label("Statistics", systemImage: "chart.bar")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
