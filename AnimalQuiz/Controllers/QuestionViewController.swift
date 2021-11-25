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
    @IBOutlet var rangedSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedSlider.value = answerCount
        }
    }
    
    @IBOutlet var singleStack: UIStackView!
    @IBOutlet var multipleStack: UIStackView!
    @IBOutlet var rangeStack: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var rangeLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
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
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else { return }
        answersChosen.append(currentAnswers[currentIndex])
        nextQuestion()
    }
    
    @IBAction func multipleButtonAnswerPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedButtonAnswerPressed() {
        let index = Int(rangedSlider.value)
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
}

//MARK: - Private

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
        let totalProgres = Float(questionIndex) / Float (questions.count)
        progressLabel.setProgress(totalProgres, animated: true)
        
        //set current title
        title = "Вопрос №\(questionIndex + 1) из \(questions.count)"
        
        //Show current stackView
        showCurrentStackView(for: currentQuestion.type)
    }
    
    
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
        singleStack.isHidden = false
        
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
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}
