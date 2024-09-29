import SwiftUI

@main
struct CalorieMacroTrackerApp: App {
    let persistenceController = DataStorageService.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.context)
        }
    }
}