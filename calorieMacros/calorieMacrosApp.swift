//
//  calorieMacrosApp.swift
//  calorieMacros
//
//  Created by Benjamin van der Woerd on 2024-09-21.
//

import SwiftUI

@main
struct CalorieMacrosApp: App {
    @StateObject private var mealViewModel = MealViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(mealViewModel)
        }
    }
}

struct MainTabView: View {
    @State private var isPresentingCameraView = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
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
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 100) // Increased space for the camera button
            }
            
            Button(action: {
                isPresentingCameraView = true
            }) {
                Image(systemName: "camera.fill")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 64, height: 64)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(radius: 4)
            }
            .offset(y: -70) // Increased offset to move the button higher
        }
        .sheet(isPresented: $isPresentingCameraView) {
            CameraView()
        }
    }
}
