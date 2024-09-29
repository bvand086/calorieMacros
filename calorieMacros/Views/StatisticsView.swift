import SwiftUI
import Charts

struct StatisticsView: View {
    @State private var selectedTimeframe: Timeframe = .weekly
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                timeframePicker
                
                switch selectedTimeframe {
                case .weekly:
                    ChartSection(title: "Calories", chart: CaloriesTrendChart(data: weeklyCaloriesData))
                    ChartSection(title: "Macros", chart: MacrosTrendChart(data: weeklyMacrosData))
                case .monthly:
                    ChartSection(title: "Calories", chart: CaloriesTrendChart(data: monthlyCaloriesData))
                    ChartSection(title: "Macros", chart: MacrosTrendChart(data: monthlyMacrosData))
                case .yearly:
                    ChartSection(title: "Calories", chart: CaloriesTrendChart(data: yearlyCaloriesData))
                    ChartSection(title: "Macros", chart: MacrosTrendChart(data: yearlyMacrosData))
                }
            }
            .padding()
        }
        .navigationTitle("Statistics")
        .background(Color(.systemGroupedBackground))
    }
    
    var timeframePicker: some View {
        Picker("Timeframe", selection: $selectedTimeframe) {
            ForEach(Timeframe.allCases, id: \.self) { timeframe in
                Text(timeframe.rawValue.capitalized).tag(timeframe)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
    
    // Added Timeframe Enum
    enum Timeframe: String, CaseIterable {
        case weekly
        case monthly
        case yearly
    }
    
    // Placeholder data for calories
    let weeklyCaloriesData: [(day: String, value: Int)] = [
        ("Mon", 150), ("Tue", 200), ("Wed", 180),
        ("Thu", 220), ("Fri", 170), ("Sat", 190), ("Sun", 160)
    ]
    
    let monthlyCaloriesData: [(month: String, value: Int)] = [
        ("Jan", 1500), ("Feb", 1800), ("Mar", 1700),
        ("Apr", 1600), ("May", 1900), ("Jun", 2000)
    ]
    
    let yearlyCaloriesData: [(year: String, value: Int)] = [
        ("2020", 18000), ("2021", 19000),
        ("2022", 20000), ("2023", 21000)
    ]
    
    // Placeholder data for macros
    let weeklyMacrosData: [(day: String, proteins: Int, fats: Int, carbs: Int)] = [
        ("Mon", 50, 70, 200), ("Tue", 60, 80, 210),
        ("Wed", 55, 75, 190), ("Thu", 65, 85, 220),
        ("Fri", 58, 78, 205), ("Sat", 62, 82, 215), ("Sun", 59, 79, 202)
    ]
    
    let monthlyMacrosData: [(month: String, proteins: Int, fats: Int, carbs: Int)] = [
        ("Jan", 1500, 2100, 7000), ("Feb", 1600, 2200, 7200),
        ("Mar", 1550, 2150, 7100), ("Apr", 1580, 2180, 7050),
        ("May", 1620, 2250, 7300), ("Jun", 1650, 2300, 7400)
    ]
    
    let yearlyMacrosData: [(year: String, proteins: Int, fats: Int, carbs: Int)] = [
        ("2020", 18000, 25200, 84000),
        ("2021", 19000, 26600, 86000),
        ("2022", 20000, 28000, 88000),
        ("2023", 21000, 29400, 90000)
    ]
}

struct ChartSection<Content: View>: View {
    let title: String
    let chart: Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
            chart
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.systemBackground)))
    }
}

struct CaloriesTrendChart: View {
    let data: [(String, Int)]
    
    var body: some View {
        Chart(data, id: \.0) { item in
            BarMark(
                x: .value("Time", item.0),
                y: .value("Calories", item.1)
            )
        }
        .frame(height: 200)
        .padding(.horizontal)
    }
}

struct MacrosTrendChart: View {
    let data: [(String, Int, Int, Int)]
    
    var body: some View {
        Chart {
            ForEach(data, id: \.0) { item in
                LineMark(
                    x: .value("Time", item.0),
                    y: .value("Proteins", item.1)
                )
                .foregroundStyle(.green)
                
                LineMark(
                    x: .value("Time", item.0),
                    y: .value("Fats", item.2)
                )
                .foregroundStyle(.red)
                
                LineMark(
                    x: .value("Time", item.0),
                    y: .value("Carbs", item.3)
                )
                .foregroundStyle(.blue)
            }
        }
        .frame(height: 200)
        .padding(.horizontal)
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}

