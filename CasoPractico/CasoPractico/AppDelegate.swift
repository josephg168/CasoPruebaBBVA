//
//  AppDelegate.swift
//  CasoPractico
//
//  Created by Joseph Antonio Garcia Hernandez on 04/12/23.
//

import UIKit
import CoreData
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var ref: DatabaseReference!
    var batteryLevel: Float {
        return UIDevice.current.batteryLevel
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let vC = LoginViewController()
        vC.view.frame = self.window!.frame
        self.window?.rootViewController = UINavigationController(rootViewController: vC)
        self.window?.makeKeyAndVisible()
    
        let frame =  LoginWireframe(in: self.window)
        frame.showLoginView()
        FirebaseApp.configure()
        
        UIDevice.current.isBatteryMonitoringEnabled = true
        batteryLevelC()
        return true
    }
    
    func batteryLevelC() {
        let batteryLevelUser = UserDefaults.standard.double(forKey: "battery")
        ref = Database.database().reference()
        self.ref.child("bateria").setValue(["bateria": batteryLevelUser])
        
    }
   

    func applicationWillResignActive(_ application: UIApplication) {
        UserDefaults.standard.set(batteryLevel, forKey: "battery")
        print("saveBatteryBeforeClose")
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CasoPractico")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

