//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Rustam Cherezbiev on 04.12.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var chosenAnswers: [Answer] = []
    
    @IBOutlet var resultAnimalLabel: UILabel!
    @IBOutlet var resultAnimalDescriptionLabel: UILabel!

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

        // Подсчет количества ответов для каждого типа животного
        for answer in chosenAnswers {
            let animal = answer.animal
            animalCounts[animal] = (animalCounts[animal] ?? 0) + 1
        }

        // Находим тип животного с максимальным количеством ответов
        if let mostFrequentAnimal = animalCounts.max(by: { $0.value < $1.value })?.key {
            return mostFrequentAnimal
        } else {
            // Если массив ответов пуст, вернуть nil
            return nil
        }
    }
    
    private func getResultAnimal() {
        if let mostFrequentAnimal = determineMostFrequentAnimal() {
                resultAnimalLabel.text = "Вы: \(mostFrequentAnimal.rawValue)"
                resultAnimalDescriptionLabel.text = mostFrequentAnimal.definition
            } 
    }
}
