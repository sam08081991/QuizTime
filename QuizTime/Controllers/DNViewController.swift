//
//  DNViewController.swift
//  QuizTime
//
//  Created by Quyen on 3/21/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit
import RealmSwift
class DNViewController: UIViewController {
    let realm = try! Realm()
    var examinees : Results<Examinee>?
    let thisUser = Examinee()
    
    @IBOutlet weak var usernameDN: UITextField!
    @IBOutlet weak var passwordDN: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        examinees  = realm.objects(Examinee.self)
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        thisUser.username = usernameDN.text!
        thisUser.password = passwordDN.text!
//        let available = examinees?.filter("username = %@",usernameDN.text!)
//        let count = available?.count
        var arrayOfExaminees = [Examinee]()
        for examinee in examinees! {
            let userID = examinee.UID
            let userPW = examinee.password
            let userName = examinee.username
            let subjects = examinee.subjects
            arrayOfExaminees.append(examinee)
        }
        if usernameDN.text!.isEmpty == true || passwordDN.text!.isEmpty == true {
            alertMessage(message: "Those fields must be filled")
            usernameDN.text!.removeAll()
            passwordDN.text!.removeAll()           
            return
        }
        else{
            for i in arrayOfExaminees {
                let uname = i.username
                let upass = i.password
                print(uname, upass)
                if uname != usernameDN.text!{
                    alertMessage(message: "This user doesn't exist")
                    usernameDN.text!.removeAll()
                    passwordDN.text!.removeAll()
                    return
                }
                else{
                    if upass != passwordDN.text! {
                        alertMessage(message: "Password is wrong")
                        usernameDN.text!.removeAll()
                        passwordDN.text!.removeAll()
                        return
                    }
                    else{
                        print(thisUser)
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
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
