import SwiftUI

struct NutritionGoal: Identifiable {
    let id = UUID()
    let name: String
    let current: Int
    let target: Int
}

struct HomeView: View {
    @EnvironmentObject private var mealViewModel: MealViewModel
    @State private var isPresentingCameraView = false
    
    let goals: [NutritionGoal] = [
        NutritionGoal(name: "Calories", current: 1000, target: 2000),
        NutritionGoal(name: "Carbs", current: 150, target: 250),
        NutritionGoal(name: "Protein", current: 70, target: 150),
        NutritionGoal(name: "Fat", current: 40, target: 70)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    dailyIntakeSection
                    lastMealsSection
                    goalsSection
                }
                .padding()
            }
            .navigationTitle("Home")
            .background(Color(.systemGroupedBackground))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isPresentingCameraView = true }) {
                        Image(systemName: "camera")
                            .foregroundColor(.accentColor)
                    }
                }
            }
            .sheet(isPresented: $isPresentingCameraView) {
                CameraView()
            }
        }
    }
    
    var dailyIntakeSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Daily Intake")
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
                ForEach(["Calories", "Carbs", "Protein", "Fat"], id: \.self) { nutrient in
                    VStack {
                        Text(nutrient)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("0g")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground)))
    }
    
    var lastMealsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recent Meals")
                .font(.title3)
                .fontWeight(.semibold)
            
            ForEach(mealViewModel.meals.prefix(3)) { meal in
                HStack(spacing: 16) {
                    if let image = meal.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } else {
                        Image(systemName: "fork.knife")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.secondary)
                            .frame(width: 60, height: 60)
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(meal.name)
                            .font(.headline)
                        Text(mealDetails(for: meal))
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground)))
    }
    
    var goalsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Goals")
                .font(.title3)
                .fontWeight(.semibold)
            
            ForEach(goals) { goal in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(goal.name)
                            .font(.headline)
                        Spacer()
                        Text("\(goal.current)/\(goal.target) \(goal.name == "Calories" ? "kcal" : "g")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    ProgressView(value: Double(goal.current), total: Double(goal.target))
                        .accentColor(.blue)
                }
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground)))
    }
    
    func loadMeals() {
        // Optional: Load meals from persistent storage
    }
    
    func mealDetails(for meal: Meal) -> String {
        return "Calories: \(meal.calories), P: \(meal.protein)g, C: \(meal.carbs)g, F: \(meal.fat)g"
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        // No need to provide MealViewModel here anymore
    }
}
