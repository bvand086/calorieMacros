import SwiftUI
import Combine
import Foundation
import UIKit

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    
    private let dataStorageService = DataStorageService.shared
    private let aiAnalysisService = AIAnalysisService()
    
    init() {
        fetchMeals()
    }
    
    func fetchMeals() {
        meals = dataStorageService.fetchMeals()
    }
    
    func addMealAndAnalyze(_ meal: Meal, image: UIImage) {
        var newMeal = meal
        meals.append(newMeal)
        dataStorageService.saveMeal(newMeal)
        
        aiAnalysisService.analyzeImage(image) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let analysis):
                    if let index = self?.meals.firstIndex(where: { $0.id == newMeal.id }) {
                        self?.meals[index].aiAnalysis = analysis
                        self?.updateMealFromAnalysis(&self?.meals[index], analysis: analysis)
                        self?.dataStorageService.saveMeal(self?.meals[index] ?? newMeal)
                    }
                case .failure(let error):
                    print("AI Analysis failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    private func updateMealFromAnalysis(_ meal: inout Meal?, analysis: String) {
        // Parse the analysis string and update the meal properties
        // This is a placeholder implementation. You'll need to adjust this based on the actual format of the AI analysis result
        let components = analysis.components(separatedBy: ", ")
        for component in components {
            let parts = component.components(separatedBy: ": ")
            if parts.count == 2 {
                let value = Int(parts[1]) ?? 0
                switch parts[0].lowercased() {
                case "calories":
                    meal?.calories = value
                case "protein":
                    meal?.protein = value
                case "carbs":
                    meal?.carbs = value
                case "fat":
                    meal?.fat = value
                default:
                    break
                }
            }
        }
    }
    
    func deleteMeal(_ meal: Meal) {
        dataStorageService.deleteMeal(meal)
        fetchMeals()
    }
}

