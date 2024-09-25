import Foundation

struct Meal: Identifiable, Hashable {
    let id = UUID()
    let name: String

    // If you have other properties, include them in the initializer
    // Example:
    // init(name: String, calories: Int, carbs: Int, protein: Int, fat: Int) {
    //     self.name = name
    //     self.calories = calories
    //     self.carbs = carbs
    //     self.protein = protein
    //     self.fat = fat
    // }
}