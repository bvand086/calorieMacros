# Calorie and Macro Tracker iOS Application Development Plan

## Project Overview

Develop a straightforward iOS application designed for personal use to track calories and macronutrients (macros) from images of food. The app utilizes the built-in iOS camera to capture food images and sends them, along with a prompt, to the OpenAI API for evaluation. It maintains a record of assessed meals, storing images and their associated nutritional statistics. Additionally, the app features interactive charts to visualize statistics on a weekly, monthly, and yearly basis.

## Features

1. **User Interface (UI)**
   - **Home Screen:** Overview of daily calorie and macro intake.
   - **Camera Integration:** Capture images of food using the iOS camera.
   - **Meal Log:** List of all assessed meals with images and nutritional details.
   - **Statistics Dashboard:** Interactive charts displaying weekly, monthly, and yearly nutrition stats.

2. **Image Processing**
   - Capture and store food images.
   - Send images to OpenAI API for analysis.

3. **Data Management**
   - Store meal data, including images and nutritional information.
   - Manage data persistence locally without requiring user authentication.

4. **API Integration**
   - Communicate with OpenAI API to evaluate and extract nutritional information from food images.

5. **Analytics and Visualization**
   - Generate interactive charts to display calorie and macro trends over different time periods.

## Technology Stack

- **Programming Language:** Swift
- **Frameworks:**
  - **UIKit or SwiftUI:** For building the user interface.
  - **Core Data or SQLite:** For local data storage.
  - **Combine or RxSwift:** For reactive programming (optional).
- **APIs:**
  - **OpenAI API:** For analyzing food images and extracting nutritional data.
- **Libraries:**
  - **Charts:** For creating interactive charts and visualizations.

## Development Steps

### 1. **Project Setup**
   - Initialize a new iOS project using Xcode.
   - Set up version control with Git.

### 2. **Design the User Interface**
   - Sketch wireframes for all screens (Home, Camera, Meal Log, Statistics).
   - Implement the UI using SwiftUI or UIKit, ensuring a user-friendly layout.

### 3. **Implement Camera Functionality**
   - Integrate the iOS camera to capture food images.
   - Handle permissions for camera access.

### 4. **Integrate OpenAI API**
   - Set up network requests to send captured images and prompts to the OpenAI API.
   - Handle API responses and extract nutritional information.

### 5. **Data Storage**
   - Choose a local storage solution (Core Data or SQLite).
   - Design the data model to store meals, images, and nutritional stats.
   - Implement data persistence to save and retrieve meal data.

### 6. **Meal Logging**
   - Create functionalities to add, view, and manage assessed meals.
   - Display captured images alongside their nutritional information.

### 7. **Analytics and Charts**
   - Integrate a charting library (e.g., Charts) to visualize nutritional data.
   - Develop interactive charts for weekly, monthly, and yearly statistics.

### 8. **Testing**
   - Perform unit testing for individual components.
   - Conduct UI testing to ensure a smooth user experience.
   - Test API integrations and data storage functionalities.

### 9. **Polishing and Optimization**
   - Refine the UI for better aesthetics and usability.
   - Optimize performance, especially for image handling and data processing.
   - Ensure the app is responsive and handles edge cases gracefully.

### 10. **Deployment**
   - Since the app is for personal use, deployment can be done via TestFlight or direct installation on personal devices.

## Timeline

| Phase                  | Duration       |
|------------------------|----------------|
| Project Setup          | 1 week         |
| UI Design and Implementation | 2 weeks     |
| Camera Integration     | 1 week         |
| OpenAI API Integration | 2 weeks         |
| Data Storage Setup     | 1 week         |
| Meal Logging Feature   | 1 week         |
| Analytics and Charts   | 2 weeks         |
| Testing                | 2 weeks         |
| Polishing and Optimization | 1 week     |
| **Total**              | **12 weeks**   |

## Good Coding Practices

- **Modular Code:** Break down the code into reusable components.
- **Documentation:** Comment code effectively to explain functionality.
- **Version Control:** Commit changes regularly with clear messages.
- **Error Handling:** Gracefully handle potential errors, especially with API calls and data storage.
- **User Privacy:** Ensure that stored images and data are securely managed, even without authentication.

## Resources for Further Learning

- **Swift Programming:** [Apple's Swift Documentation](https://swift.org/documentation/)
- **iOS Development:** [Apple Developer](https://developer.apple.com/documentation/)
- **SwiftUI Tutorials:** [Apple SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- **Core Data:** [Apple Core Data Documentation](https://developer.apple.com/documentation/coredata)
- **Charts Library:** [Charts GitHub Repository](https://github.com/danielgindi/Charts)
- **OpenAI API Documentation:** [OpenAI API Docs](https://beta.openai.com/docs/)

## Next Steps

1. **Finalize Requirements:** Ensure all desired features are listed and understood.
2. **Begin Project Setup:** Initialize the project and set up the development environment.
3. **Start UI Design:** Create initial wireframes and prototypes for the app's interface.

Feel free to reach out with any questions or for further clarification on any of the steps outlined above!

--------------------------------------------------------------------------------
## Detailed Development Plan

### Overview

This section outlines a highly detailed development plan for the Calorie and Macro Tracker iOS application. The plan includes step-by-step tasks, organized by feature and functionality, ensuring comprehensive coverage of all aspects required for successful development.

### 1. Project Setup

**1.1 Initialize the Xcode Project**
- Open Xcode and create a new project.
- Select "App" under iOS.
- Name the project "CalorieMacroTracker".
- Choose Swift as the language and SwiftUI as the interface.
- Disable Core Data and Tests for initial setup.
- Save the project in the desired directory.

**Pseudocode:**
```plaintext
Initialize new SwiftUI project in Xcode named "CalorieMacroTracker".
Set language to Swift and interface to SwiftUI.
Disable Core Data and Tests.
Save project repository locally and push to remote Git repository.
```

**1.2 Set Up Version Control with Git**
- Initialize a Git repository in the project directory.
- Make the initial commit with the project structure.
- Set up a remote repository (e.g., GitHub) and push the initial commit.

**Pseudocode:**
```bash
cd CalorieMacroTracker
git init
git add .
git commit -m "Initial project setup"
git remote add origin [repository_url]
git push -u origin main
```

### 2. Design the User Interface

**2.1 Sketch Wireframes**
- Use design tools like Sketch or Figma to create wireframes for:
  - Home Screen
  - Camera Screen
  - Meal Log Screen
  - Statistics Dashboard

**2.2 Implement UI Using SwiftUI**
- Create SwiftUI views corresponding to each wireframe.
- Ensure a consistent design language and user-friendly layout.
- Utilize SwiftUI's latest features like `LazyVStack`, `NavigationView`, and `TabView`.

**Pseudocode:**
```swift:path/to/HomeView.swift
struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Display daily calorie and macro intake
                Text("Daily Intake")
                    .font(.largeTitle)
                // Additional UI components
            }
            .navigationTitle("Home")
        }
    }
}

struct CameraView: View {
    var body: some View {
        VStack {
            // Camera interface elements
            Text("Camera")
                .font(.largeTitle)
            // Additional UI components
        }
        .navigationTitle("Camera")
    }
}

struct MealLogView: View {
    var body: some View {
        List {
            // List of meals
            Text("Meal 1")
            Text("Meal 2")
            // Additional UI components
        }
        .navigationTitle("Meal Log")
    }
}

struct StatisticsView: View {
    var body: some View {
        TabView {
            WeeklyStatsView()
                .tabItem {
                    Label("Weekly", systemImage: "calendar")
                }
            MonthlyStatsView()
                .tabItem {
                    Label("Monthly", systemImage: "calendar.badge.plus")
                }
            YearlyStatsView()
                .tabItem {
                    Label("Yearly", systemImage: "calendar.circle")
                }
        }
    }
}
```

### 3. Implement Camera Functionality

**3.1 Integrate iOS Camera**
- Use `UIImagePickerController` or `PHPickerViewController` for image capture.
- Request camera permissions in `Info.plist` with `NSCameraUsageDescription`.

**3.2 Handle Permissions**
- Implement permission checks and handle denied access gracefully.
- Provide user prompts guiding them to enable camera access if denied.

**Pseudocode:**
```swift:path/to/CameraView.swift
import SwiftUI
import AVFoundation

struct CameraView: View {
    @State private var showCamera = false
    @State private var capturedImage: UIImage?

    var body: some View {
        VStack {
            if let image = capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            Button("Capture Image") {
                checkCameraPermission()
            }
            .padding()
        }
        .sheet(isPresented: $showCamera) {
            ImagePicker(image: $capturedImage)
        }
        .alert(isPresented: $showCameraDenied) {
            Alert(
                title: Text("Camera Access Denied"),
                message: Text("Please enable camera access in settings."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
    
    @State private var showCameraDenied = false

    func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            showCamera = true
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    showCamera = granted
                }
            }
        case .denied, .restricted:
            showCameraDenied = true
        @unknown default:
            showCameraDenied = true
        }
    }
}
```

### 4. Integrate OpenAI API

**4.1 Set Up Network Requests**
- Utilize `URLSession` for making HTTP requests.
- Create a service layer to handle API interactions.

**4.2 Handle API Responses**
- Parse JSON responses to extract nutritional information.
- Handle potential errors and edge cases.

**Pseudocode:**
```swift:path/to/OpenAIService.swift
import Foundation

struct NutritionalInfo: Codable {
    let calories: Int
    let protein: Double
    let carbs: Double
    let fats: Double
}

enum APIError: Error {
    case invalidResponse
    case noData
}

class OpenAIService {
    private let apiKey = "YOUR_API_KEY"
    private let endpoint = "https://api.openai.com/v1/images/analyze"

    func analyzeImage(imageData: Data, completion: @escaping (Result<NutritionalInfo, Error>) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(APIError.invalidResponse))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "image": imageData.base64EncodedString(),
            "prompt": "Analyze the calorie and macro content of the food in the image."
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(NutritionalInfo.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
```

### 5. Data Storage

**5.1 Choose Storage Solution**
- Select Core Data for local storage due to its efficiency with complex data models.

**5.2 Design Data Model**
- Define entities: `Meal`
  - Attributes: `id`, `imageData`, `calories`, `protein`, `carbs`, `fats`, `date`

**5.3 Implement Data Persistence**
- Set up Core Data stack.
- Create CRUD operations for `Meal` entities.

**Pseudocode:**
```swift:path/to/PersistenceController.swift
import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "CalorieMacroTracker")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data store failed: \(error)")
            }
        }
    }

    func addMeal(imageData: Data, calories: Int, protein: Double, carbs: Double, fats: Double, date: Date) {
        let meal = Meal(context: container.viewContext)
        meal.id = UUID()
        meal.imageData = imageData
        meal.calories = Int32(calories)
        meal.protein = protein
        meal.carbs = carbs
        meal.fats = fats
        meal.date = date

        save()
    }

    func fetchMeals() -> [Meal] {
        let request: NSFetchRequest<Meal> = Meal.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Meal.date, ascending: false)]
        do {
            return try container.viewContext.fetch(request)
        } catch {
            print("Fetch failed: \(error)")
            return []
        }
    }

    func deleteMeal(_ meal: Meal) {
        container.viewContext.delete(meal)
        save()
    }

    func save() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("Save failed: \(error)")
            }
        }
    }
}
```

### 6. Meal Logging

**6.1 Add Meal Functionality**
- After capturing and analyzing an image, save the meal data to Core Data.

**6.2 View and Manage Meals**
- Create a `MealLogView` displaying a list of meals.
- Include functionalities to delete meals.

**Pseudocode:**
```swift:path/to/MealLogView.swift
import SwiftUI

struct MealLogView: View {
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Meal.date, ascending: false)]
    ) var meals: FetchedResults<Meal>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(meals) { meal in
                    HStack {
                        Image(uiImage: UIImage(data: meal.imageData) ?? UIImage())
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)
                        VStack(alignment: .leading) {
                            Text("Calories: \(meal.calories)")
                            Text("Protein: \(meal.protein, specifier: "%.1f")g")
                            Text("Carbs: \(meal.carbs, specifier: "%.1f")g")
                            Text("Fats: \(meal.fats, specifier: "%.1f")g")
                            Text("Date: \(meal.date ?? Date(), formatter: itemFormatter)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: deleteMeals)
            }
            .navigationTitle("Meal Log")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func deleteMeals(at offsets: IndexSet) {
        for index in offsets {
            let meal = meals[index]
            PersistenceController.shared.deleteMeal(meal)
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()
```

### 7. Analytics and Charts

**7.1 Integrate Charts Library**
- Add Charts via Swift Package Manager.
- Import Charts into necessary SwiftUI views.

**7.2 Develop Interactive Charts**
- Create views for weekly, monthly, and yearly statistics.
- Fetch and aggregate meal data based on the selected time frame.
- Display data using bar charts, line charts, or pie charts as appropriate.

**Pseudocode:**
```swift:path/to/StatisticsView.swift
import SwiftUI
import Charts

struct StatisticsView: View {
    @FetchRequest(
        entity: Meal.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Meal.date, ascending: true)]
    ) var meals: FetchedResults<Meal>
    
    var body: some View {
        TabView {
            WeeklyStatsView(meals: meals)
                .tabItem {
                    Label("Weekly", systemImage: "calendar")
                }
            MonthlyStatsView(meals: meals)
                .tabItem {
                    Label("Monthly", systemImage: "calendar.badge.plus")
                }
            YearlyStatsView(meals: meals)
                .tabItem {
                    Label("Yearly", systemImage: "calendar.circle")
                }
        }
    }
}

struct WeeklyStatsView: View {
    var meals: FetchedResults<Meal>
    
    var body: some View {
        VStack {
            Text("Weekly Nutrition")
                .font(.headline)
            Chart {
                ForEach(aggregateMeals(by: .weekOfYear)) { data in
                    BarMark(
                        x: .value("Day", data.period),
                        y: .value("Calories", data.calories)
                    )
                }
            }
            .chartStyle(BarChartStyle())
            .padding()
        }
    }
    
    func aggregateMeals(by calendarComponent: Calendar.Component) -> [NutritionData] {
        var dataDict: [String: NutritionData] = [:]
        let calendar = Calendar.current
        for meal in meals {
            guard let date = meal.date else { continue }
            let period = calendar.component(calendarComponent, from: date)
            let key = "\(period)"
            if var existing = dataDict[key] {
                existing.calories += Int(meal.calories)
                existing.protein += meal.protein
                existing.carbs += meal.carbs
                existing.fats += meal.fats
                dataDict[key] = existing
            } else {
                dataDict[key] = NutritionData(period: "\(period)", calories: Int(meal.calories), protein: meal.protein, carbs: meal.carbs, fats: meal.fats)
            }
        }
        return Array(dataDict.values).sorted { $0.period < $1.period }
    }
}

struct NutritionData: Identifiable {
    let id = UUID()
    let period: String
    var calories: Int
    var protein: Double
    var carbs: Double
    var fats: Double
}
```

### 8. Testing

**8.1 Unit Testing**
- Write tests for:
  - API Service
  - Data Persistence
  - Data Models

**8.2 UI Testing**
- Automate tests for:
  - Navigation between views
  - Image capturing and display
  - Data visualization accuracy

**8.3 Integration Testing**
- Ensure seamless interaction between camera, API, and data storage.

**Pseudocode:**
```swift:path/to/OpenAIServiceTests.swift
import XCTest
@testable import CalorieMacroTracker

class OpenAIServiceTests: XCTestCase {
    func testAnalyzeImageSuccess() {
        let service = OpenAIService()
        let expectation = self.expectation(description: "API Response")
        let dummyImageData = Data(base64Encoded: "dummyImageData")!

        service.analyzeImage(imageData: dummyImageData) { result in
            switch result {
            case .success(let info):
                XCTAssertGreaterThan(info.calories, 0)
                expectation.fulfill()
            case .failure(let error):
                XCTFail("API call failed: \(error)")
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testAnalyzeImageFailure() {
        let service = OpenAIService()
        let expectation = self.expectation(description: "API Response")
        let invalidImageData = Data()

        service.analyzeImage(imageData: invalidImageData) { result in
            switch result {
            case .success(_):
                XCTFail("API call should have failed with invalid data")
            case .failure(_):
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
```

### 9. Polishing and Optimization

**9.1 UI Refinement**
- Enhance visual aesthetics with consistent color schemes and typography.
- Ensure responsiveness across different device sizes.

**9.2 Performance Optimization**
- Optimize image loading and caching.
- Reduce API call latency by handling asynchronous tasks efficiently.

**9.3 Handle Edge Cases**
- Manage scenarios like no camera access, API failures, and empty meal logs gracefully.

**Pseudocode:**
```swift:path/to/CameraView.swift
import SwiftUI
import AVFoundation

struct CameraView: View {
    @State private var showCamera = false
    @State private var capturedImage: UIImage?
    @State private var showCameraDenied = false

    var body: some View {
        VStack {
            if let image = capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(10)
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .foregroundColor(.gray)
            }
            Button(action: {
                checkCameraPermission()
            }) {
                Text("Capture Image")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .sheet(isPresented: $showCamera) {
            ImagePicker(image: $capturedImage)
        }
        .alert(isPresented: $showCameraDenied) {
            Alert(
                title: Text("Camera Access Denied"),
                message: Text("Please enable camera access in settings to capture images."),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            showCamera = true
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                DispatchQueue.main.async {
                    showCamera = granted
                }
            }
        case .denied, .restricted:
            showCameraDenied = true
        @unknown default:
            showCameraDenied = true
        }
    }
}
```

### 10. Deployment

**10.1 Prepare for TestFlight**
- Archive the app in Xcode.
- Upload the build to App Store Connect.
- Invite personal devices for testing via TestFlight.

**10.2 Direct Installation**
- Use Xcode to deploy the app directly to personal devices.

**Pseudocode:**
```plaintext
1. In Xcode, select Product > Archive.
2. Once archived, upload the build to App Store Connect.
3. Navigate to TestFlight in App Store Connect and add tester emails.
4. Alternatively, connect personal device and deploy build