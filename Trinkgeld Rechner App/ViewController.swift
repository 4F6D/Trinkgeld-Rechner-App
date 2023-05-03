//
//  ViewController.swift
//  Trinkgeld Rechner App
//
//  Created by Rene on 02.05.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var betragsTextField: UITextField!
    @IBOutlet weak var personenAnzahlTextField: UITextField!
    @IBOutlet weak var prozentLabel: UILabel!
    @IBOutlet weak var prozentSlider: UISlider!
    @IBOutlet weak var trinkgeldLabel: UILabel!
    @IBOutlet weak var gesamtKostenLabel: UILabel!
    @IBOutlet weak var kostenProPersonLabel: UILabel!
    
    var essenKosten: Double = 0.0
    var trinkgeldProzent: Double = 0.0
    var trinkgeldKosten: Double = 0.0
    var gesamtKosten: Double = 0.0
    var kostenProPerson: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func prozentButtonAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "3%" {
            prozentLabel.text = "3%"
            prozentSlider.value = 3.0
        }
        if sender.titleLabel?.text == "5%" {
            prozentLabel.text = "5%"
            prozentSlider.value = 5.0
        }
        if sender.titleLabel?.text == "7%" {
            prozentLabel.text = "7%"
            prozentSlider.value = 7.0
        }
        ausrechnenDerKosten()
    }
    
    @IBAction func prozentSliderAction(_ sender: UISlider) {
        let prozentAsString = String(format: "%.0f", sender.value)
        
        prozentLabel.text = prozentAsString + "%"
        ausrechnenDerKosten()
    }
    
    func ausrechnenDerKosten() {
        
        if (betragsTextField.text!.isEmpty) || (personenAnzahlTextField.text!.isEmpty) {
            erstelleAnzeige(message: "Bitte die Felder ausfüllen")
        } else {
            
            essenKosten = Double(betragsTextField.text!)!
            trinkgeldProzent = Double(prozentSlider.value)
            
            trinkgeldKosten = (essenKosten * trinkgeldProzent) / 100
            gesamtKosten = essenKosten + trinkgeldKosten
            
            kostenProPerson = gesamtKosten / Double(personenAnzahlTextField.text!)!
            
            printUIElements()
        }
    }
    
    func printUIElements() {
        
        let stringTrinkGeld = String(format: "%.2f", trinkgeldKosten)
        let stringGesamtKosten = String(format: "%.2f", gesamtKosten)
        let stringKostenProPerson = String(format: "%.2f", kostenProPerson)
        
        trinkgeldLabel.text = "Trinkgeld: " + stringTrinkGeld + "€"
        gesamtKostenLabel.text = "Gesamtkosten: " + stringGesamtKosten + "€"
        kostenProPersonLabel.text = "Kosten pro Person: " + stringKostenProPerson + "€"
        
    }
    
    func erstelleAnzeige(message: String) {
        let alert = UIAlertController(title: "Fehler", message: message, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "OK", style: .default) { (action) in }
    
        alert.addAction(action1)
        
        self.present(alert, animated: true, completion: nil)
    }
}

