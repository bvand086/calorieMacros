import Foundation
import CoreData
import UIKit

class DataStorageService {
    static let shared = DataStorageService()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CalorieMacros")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveMeal(_ meal: Meal) {
        let entity = NSEntityDescription.entity(forEntityName: "Meal", in: context)!
        let mealObject = NSManagedObject(entity: entity, insertInto: context)
        
        mealObject.setValue(meal.name, forKey: "name")
        mealObject.setValue(meal.date, forKey: "date")
        mealObject.setValue(meal.imageData, forKey: "imageData")
        
        do {
            try context.save()
        } catch {
            print("Failed to save meal: \(error)")
        }
    }
    
    func fetchMeals() -> [Meal] {
        let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: "Meal")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
        do {
            let results = try context.fetch(fetchRequest)
            return results.compactMap { object in
                guard let name = object.value(forKey: "name") as? String,
                      let date = object.value(forKey: "date") as? Date else {
                    return nil
                }
                let imageData = object.value(forKey: "imageData") as? Data
                return Meal(name: name, date: date, image: imageData.flatMap { UIImage(data: $0) })
            }
        } catch {
            print("Failed to fetch meals: \(error)")
            return []
        }
    }
    
    func deleteMeal(_ meal: Meal) {
        let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: "Meal")
        fetchRequest.predicate = NSPredicate(format: "name == %@ AND date == %@", meal.name, meal.date as NSDate)
        
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                context.delete(object)
            }
            try context.save()
        } catch {
            print("Failed to delete meal: \(error)")
        }
    }
}