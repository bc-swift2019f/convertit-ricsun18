//
//  ViewController.swift
//  ConvertIt
//
//  Created by Richard Sunden on 10/4/19.
//  Copyright © 2019 Richard Sunden. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var fromUnitsLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var formulaPicker: UIPickerView!
    
    var formulaArray = ["miles to kilometers", "kilometers to miles", "feet to meters",
                        "yards to meters", "meters to feet", "meters to yards"]
    
    var fromUnits = ""
    var toUnits = ""
    var conversionString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func calculateConversion() {
        var outputValue = 0.0
        if let inputValue = Double(userInput.text!) {
            switch conversionString {
            case "miles to kilometers":
                outputValue = inputValue / 0.62137
            case "kilometers to miles":
                outputValue = inputValue * 0.62137
            case "feet to meters":
                outputValue = inputValue / 3.2808
            case "yards to meters":
                outputValue = inputValue / 1.0936
            case "meters to feet":
                outputValue = inputValue * 3.2808
            case "meters to yards":
                outputValue = inputValue * 1.0936
            default:
                print("Show alert here for some reason we didn't have correct string")
            }
            resultsLabel.text = "\(inputValue) \(fromUnits) = \(outputValue) \(toUnits)"
        } else {
            print("Show alert here to show that the value entered was not a number")
        }
    }
    
    @IBAction func convertButtonPressed(_ sender: UIButton) {
        formulaPicker.delegate = self
        formulaPicker.dataSource = self
    }
    
} 

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return formulaArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return formulaArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        conversionString = formulaArray[row]
        let unitsArray = formulaArray[row].components(separatedBy: " to ")
        fromUnits = unitsArray[0]
        toUnits =  unitsArray[1]
        fromUnitsLabel.text = fromUnits
        calculateConversion()
    }
}
