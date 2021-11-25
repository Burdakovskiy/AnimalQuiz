//
//  QuestionViewController.swift
//  AnimalQuiz
//
//  Created by Дмитрий on 23.11.2021.
//

import UIKit

class QuestionViewController: UIViewController {

    
    @IBOutlet var progressLabel: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var singleStack: UIStackView!
    @IBOutlet var multipleStack: UIStackView!
    @IBOutlet var rangeStack: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    
    @IBOutlet var rangeLabels: [UILabel]!
    
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
}

extension QuestionViewController {
    private func updateUI() {
        
        //Hide stack
        for stackView in [singleStack, multipleStack, rangeStack] {
            stackView?.isHidden = true
        }
        
        //get current question
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.text
        
        // calculate and set progress
        let totalProgres = Float(questionIndex + 1) / Float (questions.count)
        progressLabel.setProgress(totalProgres, animated: true)
        
        //set current title
        title = "Вопрос №\(questionIndex + 1) из \(questions.count)"
    }
    
    //Show current stackView
    private func showCurrentStackView(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            showMultipleStackView(with: currentAnswers)
        case .range:
            showRangedStackView(with: currentAnswers)
        }
    }
    private func showSingleStackView(with answers: [Answer]) {
        singleStack.isHidden = true
        
        for (button, answer) in zip(singleButtons, answers){
            button.setTitle(answer.text, for: .normal)
        }
    }
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStack.isHidden = false
        
        for (labels, answer) in zip(multipleLabels, answers){
            labels.text = answer.text
        }
    }
    private func showRangedStackView(with answers: [Answer]) {
        rangeStack.isHidden = false
        
        rangeLabels.first?.text = answers.first?.text
        rangeLabels.last?.text = answers.last?.text
    }
}
