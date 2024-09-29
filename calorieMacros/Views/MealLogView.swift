import SwiftUI

struct MealLogView: View {
    @EnvironmentObject private var mealViewModel: MealViewModel
    
    var body: some View {
        List {
            ForEach(mealViewModel.meals) { meal in
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
                        Text(formatDate(meal.date))
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 8)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Meal Log")
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct MealLogView_Previews: PreviewProvider {
    static var previews: some View {
        MealLogView()
            .environmentObject(MealViewModel()) // This is correct for the preview
    }
}
