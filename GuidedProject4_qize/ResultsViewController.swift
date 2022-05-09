//
//  ResultsViewController.swift
//  GuidedProject4_qize
//
//  Created by Tomonao Hashiguchi on 2022-05-06.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    init?(corder: NSCoder, responses: [Answer]){
        self.responses = responses
        super.init(coder: corder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult(){
        let frequencyOfAnswers = responses.reduce(into: [:]) {(counts, answer) in counts[answer.type, default: 0] += 1}
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) in return pair1.value > pair2.value})
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
}
