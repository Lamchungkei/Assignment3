// Created by: Kay Lin
// Created on: 15-Oct-2017
// Created for: ICS3U
// This program calculates the cost of a pizza
import PlaygroundSupport

import UIKit

class ViewController : UIViewController, UITextFieldDelegate {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    var largePizzaLabel : UILabel!
    var extraLargePizzaLabel : UILabel!
    var numberOfToppingsLabel : UILabel!
    var subTotalLabel : UILabel!
    var hstLabel : UILabel!
    var totalLabel : UILabel!
    var pizzaCodeTextField : UITextField!
    var numberOfToppingsTextField : UITextField!
    var calculateButton : UIButton!
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        //largePizzaLabel
        largePizzaLabel = UILabel()
        largePizzaLabel.text = "Larger Pizza = 1"
        view.addSubview(largePizzaLabel)
        largePizzaLabel.translatesAutoresizingMaskIntoConstraints = false
        largePizzaLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        largePizzaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        //extralargePizzaLabel
        extraLargePizzaLabel = UILabel()
        extraLargePizzaLabel.text = "Extra Large Pizza = 2"
        view.addSubview(extraLargePizzaLabel)
        extraLargePizzaLabel.translatesAutoresizingMaskIntoConstraints = false
        extraLargePizzaLabel.topAnchor.constraint(equalTo: largePizzaLabel.bottomAnchor, constant: 20).isActive = true
        extraLargePizzaLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // pizzaCodeTextField
        pizzaCodeTextField = UITextField()
        pizzaCodeTextField.bounds = CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: 50)
        pizzaCodeTextField.backgroundColor = UIColor.lightGray
        pizzaCodeTextField.borderStyle = UITextBorderStyle.roundedRect
        pizzaCodeTextField.font = UIFont.systemFont(ofSize: 17)
        pizzaCodeTextField.textAlignment = .center
        pizzaCodeTextField.placeholder = "Enter pizza code"
        pizzaCodeTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        pizzaCodeTextField.delegate = self
        view.addSubview(pizzaCodeTextField)
        pizzaCodeTextField.translatesAutoresizingMaskIntoConstraints = false
        pizzaCodeTextField.topAnchor.constraint(equalTo: extraLargePizzaLabel.bottomAnchor, constant: 20).isActive = true
        pizzaCodeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // numberOfToppingsLabel
        numberOfToppingsLabel = UILabel()
        numberOfToppingsLabel.text = "Select how many toppings you would like"
        view.addSubview(numberOfToppingsLabel)
        numberOfToppingsLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfToppingsLabel.topAnchor.constraint(equalTo: pizzaCodeTextField.bottomAnchor, constant: 20).isActive = true
        numberOfToppingsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // TOPPINGS TEXTFIELD
        numberOfToppingsTextField = UITextField()
        numberOfToppingsTextField.bounds = CGRect(x: 0, y: 0, width: view.bounds.width / 2, height: 50)
        numberOfToppingsTextField.backgroundColor = UIColor.lightGray
        numberOfToppingsTextField.borderStyle = UITextBorderStyle.roundedRect
        numberOfToppingsTextField.font = UIFont.systemFont(ofSize: 17)
        numberOfToppingsTextField.textAlignment = .center
        numberOfToppingsTextField.placeholder = "#toppings"
        numberOfToppingsTextField.clearButtonMode = UITextFieldViewMode.whileEditing
        numberOfToppingsTextField.delegate = self
        view.addSubview(numberOfToppingsTextField)
        numberOfToppingsTextField.translatesAutoresizingMaskIntoConstraints = false
        numberOfToppingsTextField.topAnchor.constraint(equalTo: numberOfToppingsLabel.bottomAnchor, constant: 20).isActive = true
        numberOfToppingsTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // calculate button
        calculateButton = UIButton()
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.setTitleColor(.blue, for: .normal)
        calculateButton.addTarget(self, action: #selector(total), for: .touchUpInside)
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.topAnchor.constraint(equalTo: numberOfToppingsTextField.bottomAnchor, constant: 20).isActive = true
        calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // subTotalLabel
        subTotalLabel = UILabel()
        subTotalLabel.text = "Sub Total: "
        view.addSubview(subTotalLabel)
        subTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        subTotalLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20).isActive = true
        subTotalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        
        // HST LABEL
        hstLabel = UILabel()
        hstLabel.text = "HST: "
        view.addSubview(hstLabel)
        hstLabel.translatesAutoresizingMaskIntoConstraints = false
        hstLabel.topAnchor.constraint(equalTo: subTotalLabel.bottomAnchor, constant: 10).isActive = true
        hstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // TOTAL LABEL
        totalLabel = UILabel()
        totalLabel.text = "Total"
        view.addSubview(totalLabel)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.topAnchor.constraint(equalTo: hstLabel.bottomAnchor, constant: 10).isActive = true
        totalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    
     func total () { 
        // constants
        
        let LARGE_COST = Float(6.00)
        let EXTRA_LARGE_COST = Float(10.00)
        let ONE_TOPPING_COST = Float(1.00)
        let TWO_TOPPINGS_COST = Float(1.75)
        let THREE_TOPPINGS_COST = Float(2.50)
        let FOUR_TOPPINGS_COST = Float(3.25)
        let HST = Float(0.13)
        
        var PIZZA_COST: Float = 0.00
        var TOPPINGS_COST: Float = 0.00
        
        // input
        var PIZZA_OPTION = Float(pizzaCodeTextField.text!)
        var THE_NUMBER_OF_TOPPINGS = Float(numberOfToppingsTextField.text!)
        
        // pizzaCost
        if PIZZA_OPTION == 1 {
            PIZZA_COST = 6.00
        }
        else if PIZZA_OPTION == 2 {
            PIZZA_COST = 10.00
        }
        
        
        //toppingsCost
        if THE_NUMBER_OF_TOPPINGS == 1 {
            TOPPINGS_COST = 1.00
        }
        else if THE_NUMBER_OF_TOPPINGS == 2 {
            TOPPINGS_COST = 1.75
        }
        else if THE_NUMBER_OF_TOPPINGS == 3 {
            TOPPINGS_COST = 2.25
        }
        else if THE_NUMBER_OF_TOPPINGS == 4 {
            TOPPINGS_COST = 3.25
        }
        
        // subtotal
        var SUB_TOTAL = PIZZA_COST + TOPPINGS_COST
        var TAX = SUB_TOTAL * HST
        var TOTAL = SUB_TOTAL + TAX
        // output
        subTotalLabel.text = "Sub Total: " + "$" + String(format:"%.2f", SUB_TOTAL)
        hstLabel.text = "HST: " + "$" + String(format:"%.2f", TAX)
        totalLabel.text = "Total: " + "$" + String(format:"%.2f", TOTAL)
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

PlaygroundPage.current.liveView = ViewController()
