//
//  ViewController.swift
//  MallelaGautamCalculatorApp
//
//  Created by Mallela,Gautam Sagar on 2/10/23.
//

import UIKit
import MathExpression

class CalculatorVC: UIViewController {

    @IBOutlet weak var mathExpressionLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.mathExpressionLBL.text = ""
        self.mathExpressionLBL.numberOfLines = 0
        
    }

    @IBAction func clearExpression(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
            return
        }

        if buttonText == "AC"{
            let value = self.evaluate(exp: buttonText)
            self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
            return
        }
    }
    
    
    @IBAction func backspace(_ sender: UIButton) {

        
        self.mathExpressionLBL.text!.remove(at: self.mathExpressionLBL.text!.index(before: self.mathExpressionLBL.text!.endIndex))
//        self.mathExpressionLBL.text = "0"
        
    }
    
    
    
    @IBAction func flipSign(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
            return
        }

        guard let expression = self.mathExpressionLBL.text else{
            return
        }
        if buttonText == "+/-"{
            let value = self.evaluate(exp: expression + "")
            if Int(value) > 0 {
                //self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
                self.mathExpressionLBL.text = self.isInteger(value: value) ? "-\(Int(value))" : "-\(value)"
//                self.mathExpressionLBL.text! = "-\(value)"
                return
            }
            else{
                self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(abs(value)))" : "\(abs(value))"
//                self.mathExpressionLBL.text! = "\(abs(value))"
                return
            }
            
        }
        
        
    }
    
    
    
    @IBAction func percent(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
            return
        }

        guard let expression = self.mathExpressionLBL.text else{
            return
        }

        if buttonText == "%"{
            let value = self.evaluate(exp: expression + "")
            self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
            self.mathExpressionLBL.text! = "\(value/100.0)*"
            return
        }
    }
    
    
    
    
    @IBAction func naturalLog(_ sender: UIButton) {
        
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
                   return
               }
       
               guard let expression = self.mathExpressionLBL.text else{
                   return
               }
        
        if buttonText == "㏑"{
            let value = self.evaluate(exp: expression + "")
           // if isInteger(value: value){
                if value > 0{
                    let output = log(Double(value))
                    self.mathExpressionLBL.text = "\(output)"
                    return
                }else{
                    self.mathExpressionLBL.text = "0"
                }
                
            //}
            //else{
              //  self.mathExpressionLBL.text = "0"
//            }
            
        }

    }
    
    
    
    
    @IBAction func factorial(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
                   return
               }
       
               guard let expression = self.mathExpressionLBL.text else{
                   return
               }
        
        if buttonText == "x!"{
            let value = self.evaluate(exp: expression + "")
//            value = self.isInteger(value: value) ? Int(value) : Int(value)
            if isInteger(value: value){
                if value > 0{
                    let output = factorialValue(fNo: Int(value))
                    self.mathExpressionLBL.text = "\(output)"
                    return
                }else{
                    self.mathExpressionLBL.text = "0"
                }
                
            }
            else{
                self.mathExpressionLBL.text = "0"
            }
            
        }
        
        
    }
    
    
    @IBAction func tenPow(_ sender: UIButton) {

        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
                   return
               }
       
               guard let expression = self.mathExpressionLBL.text else{
                   return
               }
        
        if buttonText == "10ˣ"{
            let value = self.evaluate(exp: expression + "")
            if isInteger(value: value){
                if value > 0{
                    let output = pow(10.0, Double(value))
                    self.mathExpressionLBL.text = "\(Int(output))"
                    return
                }else{
                    self.mathExpressionLBL.text = "0"
                }
                
            }
            else{
                self.mathExpressionLBL.text = "0"
            }
            
        }

        
    }
    
    
    @IBAction func calcSin(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
                   return
               }
       
               guard let expression = self.mathExpressionLBL.text else{
                   return
               }
        
        if buttonText == "sin"{
            let value = self.evaluate(exp: expression + "")
            
                
                    let output = sin(Double(value))
                    self.mathExpressionLBL.text = "\(output)"
                    return
               
            
        }

    }
    
    
    @IBAction func calcCos(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
                   return
               }
       
               guard let expression = self.mathExpressionLBL.text else{
                   return
               }
        
        if buttonText == "cos"{
            let value = self.evaluate(exp: expression + "")
            
                
                    let output = cos(Double(value))
                    self.mathExpressionLBL.text = "\(output)"
                    return
                
            
        }
    }
    
    @IBAction func calcTan(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
                   return
               }
       
               guard let expression = self.mathExpressionLBL.text else{
                   return
               }
        
        if buttonText == "tan"{
            let value = self.evaluate(exp: expression + "")
            
                
                    let output = tan(Double(value))
                    self.mathExpressionLBL.text = "\(output)"
                    return
               
            
        }
    }
    
    
    
    
    @IBAction func inverse(_ sender: UIButton) {
        
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
            return
        }

        guard let expression = self.mathExpressionLBL.text else{
            return
        }

        if buttonText == "1/x"{
            let value = self.evaluate(exp: expression + "")
            self.mathExpressionLBL.text = self.isInteger(value: value) ? "1/\(Int(value))" : "1/\(value)"
            return
        }
        
    }
    
    
    @IBAction func result(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
            return
        }

        guard let expression = self.mathExpressionLBL.text else{
            return
        }

        if buttonText == "="{
            let value = self.evaluate(exp: expression + "")
            self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
            return
        }
        
    }
    
    
    @IBAction func tappedChar(_ sender: UIButton) {
            
        guard let buttonTitle = sender.titleLabel, let buttonText = buttonTitle.text else{
            return
        }

        
        switch buttonText{
        case "+":
            fallthrough
        case "-":
            let value = self.evaluate(exp: self.mathExpressionLBL.text!)
            self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
            self.mathExpressionLBL.text! += buttonText == "-" ? "-" : "+"
        case "x":
            fallthrough
        case "÷":
            let value = self.evaluate(exp: self.mathExpressionLBL.text! + "")
            self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
            self.mathExpressionLBL.text! += buttonText == "x" ? "*" : "/"
        default:
            if self.mathExpressionLBL.text == "0"{
                self.mathExpressionLBL.text! = buttonText
            }else{
                            
                self.mathExpressionLBL.text! += buttonText
            }
        }
        
        
//        if buttonText == "+" || buttonText == "-" {
//            let value = self.evaluate(exp: self.mathExpressionLBL.text! + "")
//            self.mathExpressionLBL.text = self.isInteger(value: value) ? "\(Int(value))" : "\(value)"
//            self.mathExpressionLBL.text! += buttonText == "-" ? "-" : "+"
//
//        }else{
//            if self.mathExpressionLBL.text == "0"{
//                self.mathExpressionLBL.text! = buttonText
//            }else{
//                self.mathExpressionLBL.text! += buttonText
//            }
//        }

    }
    

    private func evaluate(exp: String) -> Double{
        
        do{
            let expression = try MathExpression(exp)
            return expression.evaluate()
        }catch{
            print("Invalid Expression")
        }
        
        return 0.0
    }
    
    private func isInteger(value: Double) -> Bool{
        value.truncatingRemainder(dividingBy: 1.0).isZero
    }
    
    
    
    private func factorialValue(fNo: Int) -> Int{
        if fNo == 0{
           return 1
        } else {
           return fNo * factorialValue(fNo:fNo-1)
        }
     }
    
}

