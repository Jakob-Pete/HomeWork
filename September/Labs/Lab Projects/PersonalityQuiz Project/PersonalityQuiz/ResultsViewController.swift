//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by mac on 9/30/22.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    func calculatePersonalityResult() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in counts[answer.type, default: 0] += 1
            
            
        }
    let mostCommonAnswer = frequencyOfAnswers.sorted { $0.value >
           $1.value }.first!.key

        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
