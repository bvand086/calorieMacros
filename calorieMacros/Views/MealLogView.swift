import SwiftUI

struct MealLogView: View {
    var body: some View {
        List {
            Text("Meal 1")
            Text("Meal 2")
            // We'll populate this with actual meal data later
        }
        .navigationTitle("Meal Log")
    }
}

struct MealLogView_Previews: PreviewProvider {
    static var previews: some View {
        MealLogView()
    }
}