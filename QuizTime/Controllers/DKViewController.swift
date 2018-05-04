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
    }

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dkButtonPressed(_ sender: AnyObject) {
        thisNewUser.username = username.text!
        thisNewUser.password = password.text!
        thisNewUser.UID = (String)((examinees?.count)! + 1)
        let available = examinees?.filter("username = %@", thisNewUser.username)
        //var array1 = [Examinee]()
        let count = available?.count
//        for examinee in available! {
//            let userID = examinee.UID
//            let userPW = examinee.password
//            let userName = examinee.username
//            let subjects = examinee.subjects
//            print(userID, userPW, userName, subjects)
//            array1.append(examinee)
//        }
        if username.text!.isEmpty == true || password.text!.isEmpty == true {
            alertMessage(message: "Those fields must be filled")
            self.username.text!.removeAll()
            self.password.text!.removeAll()
            return
        }
        else{
            if count! > 0 {
                alertMessage(message: "This username is unavailable")
                self.username.text!.removeAll()
                self.password.text!.removeAll()
                return
            }
            else{
                addUser(newUser: thisNewUser)
            }
        }
    }
//PUSH AN ALERT
    func alertMessage(message: String){
        let alert = UIAlertController(title: "Uh oh!" , message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
//ADD USER
    func addUser(newUser: Examinee){
        do {
            try realm.write {
                realm.add(newUser)
            }
        }catch {
            print("Error addUser: \(error)")
        }
    }
//PASSING DATA
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromSignupToMenu" {
            let vc = segue.destination as! MainMenuViewController
            vc.thisUsername = username.text!
        }
    }
    
}
