//
//  ViewController.swift
//  Animal Food
//
//  Created by Idan Moshe on 02/08/2020.
//  Copyright © 2020 Idan Moshe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var animalName: UILabel!
    @IBOutlet private weak var speakerButton: UIButton!
    @IBOutlet private weak var animalSpeakerButton: UIButton!
    @IBOutlet private weak var answerLabel1: UILabel!
    @IBOutlet private weak var answerLabel2: UILabel!
    @IBOutlet private weak var answerLabel3: UILabel!
    @IBOutlet private weak var answerLabel4: UILabel!
    @IBOutlet private weak var answerButton1: RoundedButton!
    @IBOutlet private weak var answerButton2: RoundedButton!
    @IBOutlet private weak var answerButton3: RoundedButton!
    @IBOutlet private weak var answerButton4: RoundedButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var previousButton: UIButton!
    @IBOutlet weak var animalWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var animalHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var answersLabelStackViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var answersImagesStackViewConstraint: NSLayoutConstraint!
        
    private var alertController: AlertViewController!
    
    private var numberOfQuestions: Int = AppDelegate.sharedDelegate().animals.count
    
    private var currentAnimal: Animal = AppDelegate.sharedDelegate().animals[0] {
        willSet {
            self.animalName.text = newValue.name
            self.showPossibleAnswers(for: newValue)
        }
    }
    
    private var currentIndex: Int = 0 {
        willSet {
            self.previousButton.isHidden = !(newValue > 0)
            self.nextButton.isHidden = !(newValue < AppDelegate.sharedDelegate().animals.count-1)
        }
    }
    
    private var answers: [FoodTypeEnum] = []
    private var answersDictionary: [String: Bool] = [:]
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.overrideUserInterfaceStyle = .light
                
        SoundManager.shared.speak(text: "מה אני אוכל?")
        
        let defaultImage = UIImage(systemName: "speaker.3", withConfiguration: UIImage.SymbolConfiguration(pointSize: Application.Configurations.speakerPointSize, weight: .regular))
        
        let selectedImage = UIImage(systemName: "speaker.slash", withConfiguration: UIImage.SymbolConfiguration(pointSize: Application.Configurations.speakerPointSize, weight: .regular))
        
        self.animalWidthConstraint.constant = Application.Configurations.animalImageSize.width
        self.animalHeightConstraint.constant = Application.Configurations.animalImageSize.height
        
        self.answersLabelStackViewConstraint.constant = Application.Configurations.answersLabelHeight
        self.answersImagesStackViewConstraint.constant = Application.Configurations.answersImageHeight
        
        self.answerLabel1.font = Application.Configurations.answersLabelFont
        self.answerLabel2.font = Application.Configurations.answersLabelFont
        self.answerLabel3.font = Application.Configurations.answersLabelFont
        self.answerLabel4.font = Application.Configurations.answersLabelFont
        
        let nextGesture = UISwipeGestureRecognizer(target: self, action: #selector(onPressNext(_:)))
        nextGesture.direction = .left
        self.view.addGestureRecognizer(nextGesture)
        
        let previousGesture = UISwipeGestureRecognizer(target: self, action: #selector(onPressPrevious(_:)))
        previousGesture.direction = .right
        self.view.addGestureRecognizer(previousGesture)
        
        self.speakerButton.setImage(defaultImage, for: .normal)
        self.speakerButton.setImage(selectedImage, for: .selected)
        
        self.alertController = AlertViewController()
        
        self.nextButton.transform = CGAffineTransform(scaleX: -1, y: 1)
        self.resetScreen()
    }
    
    @IBAction func onPressSpeaker(_ sender: Any) {
        self.speakerButton.isSelected.toggle()
    }
    
    @IBAction func onPressAnimalSpeaker(_ sender: Any) {
        SoundManager.shared.play(soundName: self.currentAnimal.name)
        // self.speak(text: self.currentAnimal.name)
    }
    
    @IBAction func onPressNext(_ sender: Any) {
        if self.currentIndex < self.numberOfQuestions - 1 {
            self.showNextQuestion()
        }
    }
    
    @IBAction func onPressPrevious(_ sender: Any) {
        if self.currentIndex > 0 {
            self.showPreviousQuestion()
        }
    }
    
    @IBAction func onPressAnswer1(_ sender: Any) {
        // self.speak(text: self.answerLabel1.text ?? "")
        
        if let answer: String = self.answerLabel1.text {
            SoundManager.shared.play(soundName: answer)
        }
        
        self.answerButton1.isSelected = (self.answers[0] == self.currentAnimal.food)
        self.onUserDidAnswer(isCorrectAnswer: self.answerButton1.isSelected, sender: sender)
    }
    
    @IBAction func onPressAnswer2(_ sender: Any) {
        // self.speak(text: self.answerLabel2.text ?? "")
        
        if let answer: String = self.answerLabel2.text {
            SoundManager.shared.play(soundName: answer)
        }
        
        self.answerButton2.isSelected = (self.answers[1] == self.currentAnimal.food)
        self.onUserDidAnswer(isCorrectAnswer: self.answerButton2.isSelected, sender: sender)
    }
    
    @IBAction func onPressAnswer3(_ sender: Any) {
        // self.speak(text: self.answerLabel3.text ?? "")
        
        if let answer: String = self.answerLabel3.text {
            SoundManager.shared.play(soundName: answer)
        }
        
        self.answerButton3.isSelected = (self.answers[2] == self.currentAnimal.food)
        self.onUserDidAnswer(isCorrectAnswer: self.answerButton3.isSelected, sender: sender)
    }
    
    @IBAction func onPressAnswer4(_ sender: Any) {
        // self.speak(text: self.answerLabel4.text ?? "")
        
        if let answer: String = self.answerLabel4.text {
            SoundManager.shared.play(soundName: answer)
        }
        
        self.answerButton4.isSelected = (self.answers[3] == self.currentAnimal.food)
        self.onUserDidAnswer(isCorrectAnswer: self.answerButton4.isSelected, sender: sender)
    }
    
    private func resetScreen() {
        self.currentIndex = 0
        self.currentAnimal = AppDelegate.sharedDelegate().animals[0]
        self.imageView.image = UIImage(named: self.currentAnimal.image)
    }
    
    private func showNextQuestion() {
        self.currentIndex += 1
        self.currentAnimal = AppDelegate.sharedDelegate().animals[self.currentIndex]
        self.imageView.image = UIImage(named: self.currentAnimal.image)
    }
    
    private func showPreviousQuestion() {
        self.currentIndex -= 1
        self.currentAnimal = AppDelegate.sharedDelegate().animals[self.currentIndex]
        self.imageView.image = UIImage(named: self.currentAnimal.image)
    }
    
    private func showPossibleAnswers(for animal: Animal) {
        // Reset buttons answers state
        self.resetButtonsAnswersState()
        
        // Get all answers
        var shuffeled: [FoodTypeEnum] = AppDelegate.sharedDelegate().animals.map { $0.food }
        
         // Remove correct answer
        shuffeled.removeAll(where: { $0 == animal.food })
        
        // Shuffle all answers
        shuffeled.shuffle()
        
        // Add correct answer
        shuffeled.insert(animal.food, at: 0)
        
        shuffeled = shuffeled.unique()
        
        self.answers = Array(shuffeled.prefix(through: 3))
        
        // Shuffle all answers
        self.answers.shuffle()
        
        // Show appropriate image
        for (index, type) in self.answers.enumerated() {
            if index == 0 {
                self.answerLabel1.text = type.localized
                self.answerButton1.setBackgroundImage(UIImage(named: type.rawValue), for: .normal)
            } else if index == 1 {
                self.answerLabel2.text = type.localized
                self.answerButton2.setBackgroundImage(UIImage(named: type.rawValue), for: .normal)
            } else if index == 2 {
                self.answerLabel3.text = type.localized
                self.answerButton3.setBackgroundImage(UIImage(named: type.rawValue), for: .normal)
            } else if index == 3 {
                self.answerLabel4.text = type.localized
                self.answerButton4.setBackgroundImage(UIImage(named: type.rawValue), for: .normal)
            }
        }
    }
    
    private func onUserDidAnswer(isCorrectAnswer: Bool, sender: Any) {
        self.answersDictionary[self.currentAnimal.name] = isCorrectAnswer
        
        if isCorrectAnswer {
            self.present(self.alertController, animated: true, completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.onPressNext(weakSelf.nextButton as Any)
            }
        } else {
            if let button = sender as? RoundedButton {
                button.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
    
    private func resetButtonsAnswersState() {
        self.answerButton1.isSelected = false
        self.answerButton2.isSelected = false
        self.answerButton3.isSelected = false
        self.answerButton4.isSelected = false
    }
    
    private func speak(text: String) {
        if !self.speakerButton.isSelected {
            SoundManager.shared.speak(text: text)
        }
    }
    
}

fileprivate extension Sequence where Element: Hashable {
    func unique() -> [Element] {
        NSOrderedSet(array: self as! [Any]).array as! [Element]
    }
}
