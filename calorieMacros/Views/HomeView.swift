import SwiftUI

struct NutritionGoal: Identifiable {
    let id = UUID()
    let name: String
    let current: Int
    let target: Int
}

struct HomeView: View {
    // Sample data - in a real app, this would come from a data model
    @State private var meals: [Meal] = []
    
    let goals: [NutritionGoal] = [
        NutritionGoal(name: "Calories", current: 1000, target: 2000),
        NutritionGoal(name: "Carbs", current: 150, target: 250),
        NutritionGoal(name: "Protein", current: 70, target: 150),
        NutritionGoal(name: "Fat", current: 40, target: 70)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Daily Intake")
                        .font(.largeTitle)
                        .padding(.horizontal)
                    
                    lastMealsSection
                    
                    goalsSection
                }
            }
            .navigationTitle("Home")
            .onAppear {
                // Load meals here
                loadMeals()
            }
        }
    }
    
    var lastMealsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Last 3 Meals")
                .font(.headline)
                .padding(.horizontal)
            
            ForEach(meals.prefix(3)) { meal in
                HStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text(meal.name)
                            .font(.subheadline)
                        Text(mealDetails(for: meal))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .shadow(radius: 2)
        .padding(.horizontal)
    }
    
    var goalsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Goals")
                .font(.headline)
                .padding(.horizontal)
            
            ForEach(goals) { goal in
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(goal.name) Goal: \(goal.target) \(goal.name == "Calories" ? "kcal" : "g")")
                        Spacer()
                        Text("Remaining: \(goal.target - goal.current) \(goal.name == "Calories" ? "kcal" : "g")")
                            .foregroundColor(.secondary)
                    }
                    .font(.subheadline)
                    
                    ProgressView(value: Double(goal.current), total: Double(goal.target))
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .shadow(radius: 2)
        .padding(.horizontal)
    }
    
    func loadMeals() {
        // Load meals from your data source
        // This is just a placeholder. Replace with actual data loading logic.
        meals = [
            Meal(name: "Breakfast"),
            Meal(name: "Lunch"),
            Meal(name: "Dinner")
        ]
    }
    
    func mealDetails(for meal: Meal) -> String {
        // Replace this with actual logic to get meal details
        return "Meal details"
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
