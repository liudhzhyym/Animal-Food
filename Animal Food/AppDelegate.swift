//
//  AppDelegate.swift
//  Animal Food
//
//  Created by Idan Moshe on 02/08/2020.
//  Copyright © 2020 Idan Moshe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    lazy var animals: [Animal] = {
        if let fileURL = Bundle.main.url(forResource: Application.FileResources.fileName,
                                         withExtension: Application.FileResources.fileExtension) {
            do {
                let jsonData = try Data(contentsOf: fileURL)
                let datasource: Animals = try JSONDecoder().decode(Animals.self, from: jsonData)
                return datasource.animals.shuffled()
            } catch let error {
                debugPrint(#function, error)
            }
        }
        return []
    }()
    
    
    class func sharedDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

