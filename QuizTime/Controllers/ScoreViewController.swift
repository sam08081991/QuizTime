//
//  ScoreViewController.swift
//  QuizTime
//
//  Created by Quyen on 4/30/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit
import RealmSwift
class ScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var scoreArray = [12, 14, 16]
    var subArray = ["Hinh Hoc", "Dai So", "Tieng Anh"]
    var dateArray = ["20-2-2018", "30-3-2018", "4-5-2018"]
    
    let realm = try! Realm()
    var examinees : Results<Examinee>?
    let thisUser = Examinee()
    var thisUsername : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        var currentUser = thisUsername
    }

    @IBOutlet weak var tableView: UITableView!
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return scoreArray.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell") as! ScoreTableViewCell
        cell.dateLabel.text = dateArray[indexPath.row]
        cell.subjectLabel.text = subArray[indexPath.row]
        cell.scoreLabel.text = String(scoreArray[indexPath.row])
        return cell
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func clearButtonPressed(_ sender: Any) {
    }
}

