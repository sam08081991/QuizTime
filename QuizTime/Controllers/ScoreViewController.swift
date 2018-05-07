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
    
    var scoreArray = [Score]()
    let realm = try! Realm()
    var examinees : Results<Examinee>?
    var thisUser = Examinee()
    var thisUsername : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //Remove line between cells
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        //Retrieve all Examinee objects
        examinees = realm.objects(Examinee.self)
        //Retrieve scores of current user
        importing()
    }
    //IMPORT DATA
    func importing(){
        let findUser = examinees?.filter("username = %@", thisUsername!)
        for i in findUser!{
            thisUser = i
        }
        for i in thisUser.scores{
            scoreArray.append(i)
        }
    }
    @IBOutlet weak var tableView: UITableView!
    //NUMBER OF ROWS
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return scoreArray.count
    }
    //CONTENT OF CELL
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreCell") as! ScoreTableViewCell
        cell.dateLabel.text = formatDate(date: scoreArray[indexPath.row].date!)
        cell.subjectLabel.text = scoreArray[indexPath.row].scoreOfSub?.subName
        cell.scoreLabel.text = String(scoreArray[indexPath.row].scoreOfTest)
        return cell
    }
   //FORMAT DATE
    func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM-dd-yyyy HH:mm"
        return formatter.string(from:date)
    }
    //BACK BUTTON'S PRESSED
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    //CLEAR YOUR SCORE BUTTON'S PRESSED
    @IBAction func clearButtonPressed(_ sender: Any) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(thisUser.scores)
            }
        }catch {
            print("Error addSubject: \(error)")
        }
        scoreArray.removeAll()
        tableView.reloadData()
    }
}

