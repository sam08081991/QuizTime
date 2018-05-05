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
//        //ADDING SUBJECTS TO DATABASE
//        let hinhhoc = Subject(value:["subID":"HH", "subName": "Hinh Hoc"])
//        let daiso = Subject(value:["subID":"DS", "subName": "Dai So"])
//        let tienganh = Subject(value:["subID":"TA", "subName": "Tieng Anh"])
//        addSubject(newSubject: hinhhoc)
//        addSubject(newSubject:tienganh)
//        addSubject(newSubject:daiso)
//        //ADDING QUESTIONS TO DATABASE
//        let nuques = Question(value:["quesID":"HH01", "quesContent":"Trong các mệnh đề sau, mệnh đề nào đúng?\n Khối đa diện có các mặt là những tam giác thì:"])
//        addQuestion(newQuestion: nuques)
//        //ADDING ANSWERS TO DATABASE
//        let nuAns1 = Answer(value:["ansID": "HH01", "answerContent":"Số mặt và số đỉnh của nó bằng nhau", "correct": false])
//        let nuAns2 = Answer(value:["ansID": "HH01", "answerContent":"Số mặt và số cạnh của nó bằng nhau", "correct": false])
//        let nuAns3 = Answer(value:["ansID": "HH01", "answerContent":"Số mặt của nó là một số chẵn", "correct": true])
//        let nuAns4 = Answer(value:["ansID": "HH01", "answerContent":"Số mặt của nó là một số lẻ", "correct": false])
//        addAnswer(A: nuAns1, B: nuAns2, C: nuAns3, D: nuAns4)
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
            var subs: Results<Subject>?
            subs = realm.objects(Subject.self)
            try realm.write {
                if newQuestion.quesID.contains("HH"){
                    let hh = subs?.filter("subID = %@","HH")
                    for i in hh! {
                        i.questions.append(newQuestion)
                        newQuestion.quesOfSub = i
                    }
                }
                else if newQuestion.quesID.contains("DS"){
                    let ds =  subs?.filter("subID = %@", "DS")
                    for i in ds!{
                        i.questions.append(newQuestion)
                        newQuestion.quesOfSub = i
                    }
                }
                else if newQuestion.quesID.contains("TA"){
                    let ta =  subs?.filter("subID = %@","TA")
                    for i in ta!{
                        i.questions.append(newQuestion)
                        newQuestion.quesOfSub = i
                    }
                }
                realm.add(newQuestion)
            }
        }catch {
            print("Error addSubject: \(error)")
        }
    }
//ADDING ANSWERS
    func addAnswer(A: Answer, B: Answer, C: Answer, D: Answer){
        do {
            let realm = try Realm()
            let ansArray = [A, B, C, D]
            var ques: Results<Question>?
            ques = realm.objects(Question.self)
            try realm.write {
                for newAns in ansArray{
                    let ansID = newAns.ansID
                    let thisques = ques?.filter("quesID = %@", ansID)
                    for i in thisques!{
                        i.answers.append(newAns)
                        newAns.ansOfQuestion = i
                    }
                realm.add(newAns)
                }
            }
        }catch {
            print("Error addSubject: \(error)")
        }
    }
//LOCALIZING REALM FILE
    func setDefaultRealmForUser(username: String){
        var config = Realm.Configuration(
                            schemaVersion: 1,
                            migrationBlock: { migration, oldSchemaVersion in
                            if (oldSchemaVersion < 1) {
                                // Nothing to do!
                                // Realm will automatically detect new properties and removed properties
                                // And will update the schema on disk automatically
                            }
                        })
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

