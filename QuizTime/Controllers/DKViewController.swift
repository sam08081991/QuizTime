//
//  DKViewController.swift
//  QuizTime
//
//  Created by Quyen on 3/21/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit
import RealmSwift
class DKViewController: UIViewController {
    let realm = try! Realm()
    var examinees: Results<Examinee>?
    let thisNewUser = Examinee()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        examinees  = realm.objects(Examinee.self)
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dkButtonPressed(_ sender: Any) {
        thisNewUser.username = username.text!
        thisNewUser.password = password.text!
        thisNewUser.UID = (String)((examinees?.count)! + 1)
        var available = examinees?.filter("username = %@", thisNewUser.username)
        
        //var count = available?.count
        for examinee in available! {
            let userID = examinee.UID
            let userPW = examinee.password
            let userName = examinee.username
            let subjects = examinee.subjects
            print(userID, userPW, userName, subjects)
        }
//        if count! > 0 {
//            print("This username is unavailable.")
//
//        }
//        else {
//            self.addUser(newUser: thisNewUser)
//        }
//        while count! > 0 {
//
//        }
        self.addUser(newUser: thisNewUser)
        
        //print(available?.sorted(byKeyPath: "UID", ascending: false))
        
        
    }
        
    func addUser(newUser: Examinee){
        do {
            try realm.write {
                realm.add(newUser)
            }
        }catch {
            print("Error addUser: \(error)")
        }
    }
    
    
}
