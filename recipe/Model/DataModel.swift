//
//  DataModel.swift
//  recipe
//
//  Created by Jasmine Shang on 12/9/21.
//

import Foundation
import CoreData

class DataController {

    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext{
        return persistentContainer.viewContext
    }

    // Initializing Container
    init(modelName: String){
        persistentContainer = NSPersistentContainer(name: modelName)
    }

    func configureContexts() {
        viewContext.automaticallyMergesChangesFromParent = true
    }

    // Loading
    func load(completion: (() -> Void)? = nil){
        persistentContainer.loadPersistentStores(completionHandler: { storeDescription, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            self.autoSaveViewContext(timeInterval: 3)
            self.configureContexts()
            completion?()
        })
    }
}

// Autosaving
extension DataController {
    func autoSaveViewContext(timeInterval: TimeInterval = 30) {
        guard timeInterval > 0 else {
            print("Negative interval not possible!")
            return
        }
        if viewContext.hasChanges {
            try? viewContext.save()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) {
            self.autoSaveViewContext(timeInterval: timeInterval)
        }
    }
}

