//
//  ResultViewController.swift
//  AnimalQuiz
//
//  Created by Дмитрий on 23.11.2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        
        updateResults()
    }

}
//MARK: - Private
extension ResultViewController {
    private func updateResults() {
        
        let mostFrequencyAnimal = Dictionary(grouping: answers, by: {$0.type})
            .sorted(by: { $0.value.count > $1.value.count})
            .first?.key
        
        updateUI(with: mostFrequencyAnimal!)
    }
    
    private func updateUI(with animal: AnimalType) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)!"
        descriptionLabel.text = animal.description
    }
}
