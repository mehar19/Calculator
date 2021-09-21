//
//  ViewController.swift
//  Calculator
//
//  Created by Mehar on 16/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var logicManager = LogicManager()
    var clearDisplay = false
    var isValidPress = false
    
    @IBOutlet weak var displayLabel: UILabel!
    
   

    @IBAction func buttonClick(_ sender: UIButton) {
      /*  var number = sender.titleLabel!.text!
        displayLabel.text! += number
        
        print(sender.titleLabel!.text!)*/
        if logicManager.calculateArray.count == 1{
            clearClick(sender)
        }
        
        isValidPress = true
        
        if clearDisplay == true{
            displayLabel.text = ""
            clearDisplay = false
        }
        
        displayLabel.text! += sender.currentTitle!
        logicManager.currentNumber = Double(displayLabel.text!)!
        
    }
    
    
    @IBAction func operatorClick(_ sender: UIButton) {
       
        clearDisplay = true
        
        if isValidPress == true{
            print(logicManager.calculateArray)
            if logicManager.calculateArray.count == 1{
                logicManager.calculateArray.append(Double(sender.tag))
            }else{
        logicManager.calculateArray.append(logicManager.currentNumber)
        logicManager.calculateArray.append(Double(sender.tag))
            }
            print("After: ",logicManager.calculateArray)
            displayLabel.text = String(logicManager.calculateArray[0])
        }
        logicManager.lastOperation = Double(sender.tag)
        
        isValidPress = false
        if let result = logicManager.calculateAndReturn(operation: "operation"){
            displayLabel.text = result
        }
        print(logicManager.calculateArray)
        
    }
    
    @IBAction func equalClicked(_ sender: Any) {
        print("Equal clicked")
        isValidPress = true
        logicManager.lastNuber = logicManager.currentNumber
        if let result = logicManager.calculateAndReturn(operation: "equals"){
            displayLabel.text = result
        }
    }
    
    @IBAction func decimalClick(_ sender: Any) {
        if !((displayLabel.text)?.contains("."))!{
            displayLabel.text! += "."
        }
    }
    
    @IBAction func clearClick(_ sender: Any) {
        clearDisplay = false
        isValidPress = false
        displayLabel.text = ""
        logicManager.clear()
    }
}

