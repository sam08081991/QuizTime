//
//  TestViewController.swift
//  QuizTime
//
//  Created by Quyen on 4/11/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit
import RealmSwift
class TestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var quesLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    var thisSub: String?
    var thisUser: String?
    let realm = try! Realm()
    var examinees: Results<Examinee>?
    var subs: Results<Subject>?
    var currentExaminee = Examinee()
    var currentSubject = Subject()
    var quesNum: Int = 0
    var quesOfSub = [Question]()
    var totalQues : Int = 0
    var score: Int = 0
    var ansArray = [Answer]()
    var pickedAns = Answer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        examinees = realm.objects(Examinee.self)
        subs = realm.objects(Subject.self)
        importing()
        updateUI()
        
    }
    
    //IMPORTING DATA
    func importing(){
        let findUser = examinees?.filter("username = %@", thisUser!)
        let findSub = subs?.filter("subID = %@", thisSub!)
        for i in findUser!{
            currentExaminee = i
        }
        for i in findSub!{
            currentSubject = i
        }
        for i in currentSubject.questions {
            quesOfSub.append(i)
        }
        totalQues = quesOfSub.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //NUMBER OF ROWS
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 4
    }
    //CONTENT OF CELL
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var charArray = ["A", "B", "C", "D"]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ansCell") as! AnswerTableViewCell
        cell.charLabel.text = charArray[indexPath.row]
        cell.ansContentLabel.text = ansArray[indexPath.row].answerContent
        return cell
    }
    
    //UI UPDATE
    func updateUI() {
        if quesNum < totalQues {
            progressLabel.text = String(quesNum + 1 ) + "/" + String(totalQues)
        }
        nextQuestion()
    }

    //NEXT QUESTION
    func nextQuestion(){
        if quesNum < totalQues {
            quesLabel.text = quesOfSub[quesNum].quesContent
            for i in quesOfSub[quesNum].answers{
                ansArray.append(i)
            }
        }
        else{
            do {
                let realm = try Realm()
                try realm.write {
                    let thisScore = Score(value:["scoreOfUser": currentExaminee, "scoreOfSub": currentSubject, "scoreOfTest": score, "date": Date()])
                    currentExaminee.scores.append(thisScore)
                    realm.add(thisScore)
                    let alert = UIAlertController(title: "Congratulations!" , message: "You finished the test", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
                        self.navigationController?.popViewController(animated: true)                    }
                    alert.addAction(action)
                    present(alert, animated: true, completion: nil)
                }
            }catch {
                print("Error addSubject: \(error)")
            }
        }
    }
    //SEND ANSWER
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pickedAns = ansArray[indexPath.row]
        checkAnswer(ans: pickedAns)
        print("correct:",score)
        quesNum += 1
        updateUI()
    }
    //CHECK ANSWER
    func checkAnswer(ans: Answer){
        if ans.correct == true {
            score += 1
        }
    }
    //QUIT BUTTON'S PRESSED
    @IBAction func quitButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Hey!" , message: "Are you sure you want to quit this test?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "Yes", style: .default) { (action) -> Void in
            self.navigationController?.popViewController(animated: true)                    }
        let no = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(yes)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)
    }
}
