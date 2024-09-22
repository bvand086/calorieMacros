import SwiftUI

struct StatisticsView: View {
    var body: some View {
        TabView {
            Text("Weekly Stats")
                .tabItem {
                    Label("Weekly", systemImage: "calendar")
                }
            Text("Monthly Stats")
                .tabItem {
                    Label("Monthly", systemImage: "calendar.badge.plus")
                }
            Text("Yearly Stats")
                .tabItem {
                    Label("Yearly", systemImage: "calendar.circle")
                }
        }
        .navigationTitle("Statistics")
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}