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
        let thisNewUser = Examinee()
        thisNewUser.username = username.text!
        thisNewUser.password = password.text!
        thisNewUser.UID = (String)((examinees?.count)! + 1)
        self.addUser(newUser: thisNewUser)
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
