//
//  Answer.swift
//  QuizTime
//
//  Created by Quyen on 4/10/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation
import RealmSwift
class Answer: Object {
    @objc dynamic var answerContent: String = ""
    @objc dynamic var correct: Bool = false
    @objc dynamic var ansOfQuestion: Question?    
}
