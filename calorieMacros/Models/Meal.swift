import Foundation
import UIKit

struct Meal: Identifiable, Codable {
    let id: UUID
    var name: String
    var calories: Int
    var protein: Int
    var carbs: Int
    var fat: Int
    var date: Date
    var aiAnalysis: String?  // New property to store AI analysis results
    
    // ... (rest of the code remains unchanged)
}