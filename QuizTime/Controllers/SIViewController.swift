//
//  SIViewController.swift
//  QuizTime
//
//  Created by Quyen on 5/4/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit
import RealmSwift
class SIViewController: UIViewController {
    let realm = try! Realm()
    var examinees : Results<Examinee>?
    let thisUser = Examinee()
    override func viewDidLoad() {
        super.viewDidLoad()
        examinees  = realm.objects(Examinee.self)
    }
    
    @IBOutlet weak var usernameDN: UITextField!
    @IBOutlet weak var passwordDN: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func signinButtonPressed(_ sender: Any) {
        thisUser.username = usernameDN.text!
        thisUser.password = passwordDN.text!
        var arrayOfExaminees = [Examinee]()
        for examinee in examinees! {
            arrayOfExaminees.append(examinee)
        }
        if usernameDN.text!.isEmpty == true || passwordDN.text!.isEmpty == true {
            alertMessage(message: "Those fields must be filled")
            return
        }
        else{
            var countElement = 0
            for i in arrayOfExaminees {
                let name = i.username
                let pass = i.password
                print("name",name.components(separatedBy: ""))
                let comparename = "\u{08}" + thisUser.username
                //If username is match
                if name == comparename {
                    //Check its password
                    if pass == thisUser.password{
                        print(i)
                    }
                    else {
                        alertMessage(message: "Password is wrong")
                        return
                    }
                }
                    //If username is unmatch
                else {
                    countElement += 1
                    if countElement == arrayOfExaminees.count {
                        alertMessage(message: "This user doesn't exist")
                        return
                    }
                }
            }
        }
    }
    //PUSH AN ALERT
    func alertMessage(message: String){
        let alert = UIAlertController(title: "Uh oh!" , message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
            self.navigationController?.popViewController(animated: true)
            self.usernameDN.text!.removeAll()
            self.passwordDN.text!.removeAll()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    //PASSING DATA
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromLoginToMenu" {
            let vc = segue.destination as! MainMenuViewController
            vc.thisUsername = usernameDN.text!
        }
    }
}
