//
//  TestViewController.swift
//  QuizTime
//
//  Created by Quyen on 4/11/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit
import RealmSwift
class TestViewController: UIViewController {
    var thisSub: String?
    var thisUser: String?
    let realm = try! Realm()
    var examinees: Results<Examinee>?
    var subs: Results<Subject>?
    var currentUser = Examinee()
    var currentSubject = Subject()
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentSub = thisSub
        var currentUser = thisUser
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func quitButtonPressed(_ sender: Any) {
    }
}
