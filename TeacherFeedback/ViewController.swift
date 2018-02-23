//
//  ViewController.swift
//  TeacherFeedback
//
//  Created by Cory Barton on 2/23/18.
//  Copyright © 2018 Cory Barton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var yesLabel: UILabel!
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var answerSwitch: UISwitch!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
   var response: Response? = nil

    @IBAction func anserSwitchChanged(_ sender: UISwitch) {
        updateAnswerSwitch()
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        sliderValueLabel.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func textFieldDidEnd(_ sender: UITextField) {
        sender.endEditing(false)
    }
    
    
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let question = questionLabel.text else { return }
        let response = Response(questions: question, didAnswerYes: answerSwitch.isOn, rating: Int(slider.value), maximumPossibleRating: Int(slider.maximumValue), comments: textField.text)
        self.response = response
        reset()
    }
    
    func updateAnswerSwitch(_ isOn: Bool? = nil) {
        let isOn = isOn ?? answerSwitch.isOn
        yesLabel.isHidden = !isOn
        noLabel.isHidden = isOn
        answerSwitch.isOn = isOn
        
    }
    
    func reset() {
        updateAnswerSwitch(true)
        sliderValueLabel.text = "\(Int(slider.maximumValue/2))"
        slider.value = slider.maximumValue/2
        textField.text = nil
    }
}

