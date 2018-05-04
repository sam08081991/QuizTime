//
//  AppDelegate.swift
//  QuizTime
//
//  Created by Quyen on 3/21/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit
import RealmSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setDefaultRealmForUser(username: "QuizTime")
        do {
            let realm = try Realm()
        }catch{
            print("Error: \(error)")
        }
        //ADDING SUBJECTS TO DATABASE
//        let hinhhoc = Subject(value:["subID":"HH", "subName": "Hinh Hoc"])
//        let daiso = Subject(value:["subID":"DS", "subName": "Dai So"])
//        let tienganh = Subject(value:["subID":"TA", "subName": "Tieng Anh"])
//        addSubject(newSubject: hinhhoc)
//        addSubject(newSubject:tienganh)
//        addSubject(newSubject:daiso)
        //ADDING QUESTIONS TO DATABASE
//        let nuques = Question(value:["quesID":"HH02", "quesContent":"Trong các mệnh đề sau, mệnh đề nào đúng?\n Khối đa diện có các mặt là những tam giác thì:"])
//        addQuestion(newQuestion: nuques)
        return true
    }
//ADDING SUBJECT
    func addSubject(newSubject: Subject){
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(newSubject)
            }
        }catch {
            print("Error addSubject: \(error)")
        }
    }
//ADDING QUESTION
    func addQuestion(newQuestion: Question){
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(newQuestion)
            }
        }catch {
            print("Error addSubject: \(error)")
        }
    }
//LOCALIZING REALM FILE
    func setDefaultRealmForUser(username: String){
        var config = Realm.Configuration()
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("\(username).realm")
        Realm.Configuration.defaultConfiguration = config
        print(config)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

