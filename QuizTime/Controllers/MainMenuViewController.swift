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
    @IBOutlet weak var currentuser: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentuser.text = thisUsername

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func TAButtonPressed(_ sender: Any) {
    }
    
    @IBAction func DSButtonPressed(_ sender: Any) {
    }
    
    @IBAction func HHButtonPressed(_ sender: Any) {
    }
}
