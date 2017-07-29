//
//  ViewController.swift
//  ConversionCalculator
//
//  Created by Alex Testin on 7/27/17.
//  Copyright © 2017 Alex Testin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var mode: Int = 1
    var posORneg: String = ""
    var num: String = ""
    var input = ""
    var decimalCount = 0

    @IBOutlet weak var inputLabel: UITextField!
    @IBOutlet weak var outputLabel: UITextField!
    
    @IBAction func clear(_ sender: UIButton) {
        posORneg = ""
        num = ""
        inputLabel.text = ""
        outputLabel.text = ""
        decimalCount = 0
    }
    @IBAction func negative(_ sender: UIButton) {
        if(posORneg == "") {
            posORneg = "-"
        } else if(posORneg == "-") {
            posORneg = ""
        }
        if(num != "") {
            calculate()
        }
    }
    @IBAction func numbers(_ sender: UIButton) {
        num = num + String(sender.tag - 1)
        calculate()
    }
    @IBAction func decimal(_ sender: UIButton) {
        if(decimalCount == 0) {
            num = num + "."
            decimalCount += 1
        }
    }
    
    func calculate() {
        switch(mode) {
            case 1:
                if(num.characters.count <= 20) {
                    input = posORneg + num
                }
                inputLabel.text = input + " mi"
                if(input.characters.count <= 20) {
                    outputLabel.text = String(Float(input)! * 1.609344) + " km"
                }
            case 2:
                if(num.characters.count <= 20) {
                    input = posORneg + num
                }
                inputLabel.text = input + " km"
                outputLabel.text = String(Float(input)! * 0.62137) + " mi"
            case 3:
                if(num.characters.count <= 20) {
                    input = posORneg + num
                }
                inputLabel.text = input + " F"
                outputLabel.text = String((Float(input)! - 32) * (5/9)) + " C"
            case 4:
                if(num.characters.count <= 20) {
                    input = posORneg + num
                }
                inputLabel.text = input + " C"
                outputLabel.text = String(Float(input)! * (9/5) + 32) + " F"
            default:
                outputLabel.text = inputLabel.text
        }
    }
    
    @IBAction func selectMode(_ sender: UIButton) {
        let alert = UIAlertController(title: "Conversion Mode", message: "", preferredStyle: .alert)
        let convertMItoKM = UIAlertAction(title: "Miles to Kilometers", style: .default) { (alert: UIAlertAction!) -> Void in
            self.mode = 1
            self.calculate()
        }
        let convertKMtoMI = UIAlertAction(title: "Kilometers to Miles", style: .default) { (alert: UIAlertAction!) -> Void in
            self.mode = 2
            self.calculate()
        }
        let convertFtoC = UIAlertAction(title: "Fahrenheit to Celsius", style: .default) { (alert: UIAlertAction!) -> Void in
            self.mode = 3
            self.calculate()
        }
        let convertCtoF = UIAlertAction(title: "Celsius to Fahrenheit", style: .default) { (alert: UIAlertAction!) -> Void in
            self.mode = 4
            self.calculate()
        }
        alert.addAction(convertMItoKM)
        alert.addAction(convertKMtoMI)
        alert.addAction(convertFtoC)
        alert.addAction(convertCtoF)
        present(alert, animated: true, completion:nil)
    }
}

