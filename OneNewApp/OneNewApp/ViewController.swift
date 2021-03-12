//
//  ViewController.swift
//  OneNewApp
//
//  Created by Roman on 11/03/2021.
//  Copyright © 2021 Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var numberOfLabels: Int = 0
    var countNumsOfArray: Int = 0
    
    
    
    @IBOutlet weak var usersNumberOfLabels: UITextField!
    
    @IBAction func changeNumberOfLabels(_ sender: UITextField) {

    }
    
    @IBOutlet weak var usersCountNumsOfArray: UITextField!
    
    @IBAction func changeNumsOfArray(_ sender: UITextField) {
        
    }
    
    @IBAction func changeButton(_ sender: UIButton) {
            changeLabels()
    }
    
    @IBOutlet weak var myOwnStackView: UIStackView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfo()
    }
    
    
    func configOfMyStackView() {
        view.addSubview(myOwnStackView)
        myOwnStackView.axis = .vertical
        myOwnStackView.distribution  = .fillEqually
        myOwnStackView.spacing = 10
    }
    
    func configOfMyLabels(someLabel: UILabel) {
        someLabel.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        someLabel.textAlignment = .center
    }
    
    func clearLabels(myNumberOfLabels: Int) {
        while myOwnStackView.arrangedSubviews.count > 0 {
            let myLabelFromView = myOwnStackView.arrangedSubviews[myOwnStackView.arrangedSubviews.count - 1]
            myLabelFromView.removeFromSuperview()
        }
        return
    }
    
    func addLabels(myNumberOfLabels: Int) {
        var index = myNumberOfLabels
        while index > 0 {
            let myLabel = UILabel()
            configOfMyLabels(someLabel: myLabel)
            myLabel.text = "\(createArrayOfRandomCounts(myCountNumsOfArray: countNumsOfArray))"
            myOwnStackView.addArrangedSubview(myLabel)
            index -= 1
        }
    }
    
    func changeLabels() {
        clearLabels(myNumberOfLabels: numberOfLabels)
        if checkWrongValues(newNumberOfLabels: numberOfLabels) == true {
            addLabels(myNumberOfLabels: numberOfLabels)
        } else {
            wrongValues()
        }
        
        configOfMyStackView()
        
    }
    
    func loadInfo() {
        let warningsString = ["Оптимальные значения: ",
                              "Для строк - 1...10 ",
                              "Для элементов 1...14"]
        var index = 0
        for _ in warningsString {
            let warningString = UILabel()
            configOfMyLabels(someLabel: warningString)
            warningString.text = "\(warningsString[index])"
            myOwnStackView.addArrangedSubview(warningString)
            index += 1
        }
        configOfMyStackView()
    }
    
    func wrongValues() {
        let warningsString = ["Неверное значение для параметров",
                              "Оптимальные значения: ",
                              "Для строк - 1...10 ",
                              "Для элементов 1...14"]
        var index = 0
        for _ in warningsString {
            let warningString = UILabel()
            configOfMyLabels(someLabel: warningString)
            warningString.text = "\(warningsString[index])"
            myOwnStackView.addArrangedSubview(warningString)
            index += 1
        }
        configOfMyStackView()
    }
    
    func checkWrongValues(newNumberOfLabels: Int) -> Bool {
        guard let newValueForLabels = usersNumberOfLabels.text else {
            return false
        }
        guard let newValueForElements = usersCountNumsOfArray.text else {
            return false
        }
        countNumsOfArray = Int(newValueForElements) ?? 0
        numberOfLabels = Int(newValueForLabels) ?? 0
        if numberOfLabels < 1 {
            return false
        } else {
            if numberOfLabels > 10 {
                return false
            } else {
                if countNumsOfArray < 1 {
                    return false
                } else {
                    if countNumsOfArray > 14 {
                        return false
                    } else {
                        return true
                    }
                }
            }
        }
    }
    
    func createArrayOfRandomCounts(myCountNumsOfArray: Int) -> Array<Int> {
        var createArray = [Int]()
        var randomValue = 0
        for index in 0...myCountNumsOfArray - 1 {
            randomValue = Int.random(in: 1...100)
            createArray.insert(randomValue, at: index)
        }
        return createArray
    }
}
