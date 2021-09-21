//
//  LogicManager.swift
//  Calculator
//
//  Created by Mehar on 18/09/2021.
//

import Foundation
class LogicManager{
    
    var calculateArray = [Double]()
    var lastNuber = 0.0
    var lastOperation = 0.0
    var currentNumber = 0.0
    
    func calculate(firstNumber: Double, secondNumber: Double, operation: Int) -> Double{
        
        var total = 0.0
        
        if let operations = Enumerations.Operations(rawValue: operation){
        
        switch operations{
        case .add:
            total = firstNumber + secondNumber
        case .subtract:
            total = firstNumber - secondNumber
        case .multiply:
            total = firstNumber * secondNumber
        case .divide:
            total = firstNumber / secondNumber
        }
        }
        return Double(floor(1000*total)/1000)
    }
    func calculateAndReturn(operation: String) -> String?{
        if operation == "operation"{
            if calculateArray.count >= 3{
                //calculate and return number
                let newValue = calculate(firstNumber: calculateArray[0], secondNumber: calculateArray[2], operation: Int(calculateArray[1]))
                calculateArray.removeAll()
                calculateArray.append(newValue)
                calculateArray.append(lastOperation)
                return String(calculateArray[0])
                
            }
        }else if operation == "equals"{
            if calculateArray.count >= 1{
                //calculate and return number
                let newValue = calculate(firstNumber: calculateArray[0], secondNumber: lastNuber, operation: Int(lastOperation))
                calculateArray.removeAll()
                calculateArray.append(newValue)
                  return String(calculateArray[0])
                
            }
        }
        return nil
    }
    
    func clear(){
         calculateArray = []
         lastNuber = 0.0
         lastOperation = 0.0
         currentNumber = 0.0
       
    }
}
