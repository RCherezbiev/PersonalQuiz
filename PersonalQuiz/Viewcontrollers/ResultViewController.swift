//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Rustam Cherezbiev on 04.12.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultAnimalDescriptionLabel: UILabel!
    
    var chosenAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getResultAnimal()
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func determineMostFrequentAnimal() -> Animal? {
        var animalCounts: [Animal: Int] = [:]

        for answer in chosenAnswers {
            let animal = answer.animal
            animalCounts[animal] = (animalCounts[animal] ?? 0) + 1
        }
        return animalCounts.max(by: { $0.value < $1.value })?.key
    }
    
    private func getResultAnimal() {
        if let mostFrequentAnimal = determineMostFrequentAnimal() {
            resultAnimalLabel.text = "Вы: \(mostFrequentAnimal.rawValue)"
            resultAnimalDescriptionLabel.text = mostFrequentAnimal.definition
        }
    }
}
