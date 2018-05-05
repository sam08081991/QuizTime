//
//  MainMenuViewController.swift
//  QuizTime
//
//  Created by Quyen on 4/11/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit
import RealmSwift
class MainMenuViewController: UIViewController {
    var thisUsername : String?
    let realm = try! Realm()
    var examinees: Results<Examinee>?
    var subs: Results<Subject>?
    var currentUser = Examinee()
    var currentSubject = Subject()
    @IBOutlet weak var currentuser: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        currentuser.text = thisUsername
        examinees = realm.objects(Examinee.self)
        subs = realm.objects(Subject.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func TAButtonPressed(_ sender: Any) {
        currentSubject = currentSubject(subID: "TA")

        print("User: ",currentUser)
        print("Subject: ",currentSubject)

    }
    
    @IBAction func DSButtonPressed(_ sender: Any) {
        currentSubject = currentSubject(subID: "DS")
        print("Subject: ",currentSubject)
    }
    
    @IBAction func HHButtonPressed(_ sender: Any) {
        currentSubject = currentSubject(subID: "HH")
        print("Subject: ",currentSubject)
    }
    
    //IMPORTING CURRENT SUBJECT
    func currentSubject(subID: String) -> Subject{
        let currentSub = subs?.filter("subID = %@", subID)
        var curSub = Subject()
        let name = "\u{08}" + currentuser.text!
        let findUser = examinees?.filter("username = %@",name)
        for i in findUser!{
            let thisname = i.username
            if thisname == name {
                currentUser.UID = i.UID
                currentUser.username = i.username
                currentUser.password = i.password
            }
        }
        for i in currentSub!{
                    curSub = i
        }
        return curSub
    }
}
