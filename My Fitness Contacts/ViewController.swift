//
//  ViewController.swift
//  My Fitness Contacts
//
//  Created by Tatiana Looby on 02/02/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var bmiTextField: UITextField!
    
    var myContact: Contact?
    
    // Locate the path in the Documents Folder
    
    var filePath: String? {
        
        do {
            let fileManager = FileManager.default
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let savePath = documentDirectory.appendingPathComponent("contact.plist")
            
            return savePath.path
            
        } catch {
            print("Error getting path")
            return nil
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addContactTapped(_ sender: Any) {
        print("addContact")
        
        if let contact = createContactFromUI() {
            print("Valid contact: \(contact)")
            
            myContact = contact
            
        } else {
            print("Error invalid contact")
        }
    }
    
    func createContactFromUI() -> Contact? {
        
        var contact: Contact? = nil
        
        if !(firstNameTextField.text?.isEmpty)! {
            
            if !(lastNameTextField.text?.isEmpty)! {
                
                if !(emailTextField.text?.isEmpty)! {
                    
                    let numberFormatter = NumberFormatter()
                    
                    numberFormatter.numberStyle = NumberFormatter.Style.decimal
                    
                    if let age = numberFormatter.number(from: ageTextField.text!)?.intValue {
                        
                        if let bmi = numberFormatter.number(from: bmiTextField.text!)?.doubleValue
                        {
                            contact = Contact(firstName: firstNameTextField.text!, lastName: lastNameTextField.text!, email: emailTextField.text!, age: age, bmi: bmi)
                        }
                        
                    }
                    
                }
                
            }
            
        } else {
            
            print("Invalid contact")
        }
        
        return contact
        
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        emailTextField.text = ""
        ageTextField.text = ""
        bmiTextField.text = ""
    
    }
    
    @IBAction func savedButtonTapped(_ sender: Any) {
        
        // NSKeyedArchiver
        
        var success = false
        
        if let contact = myContact, let filePath = filePath {
            
            print("filePath: \(filePath)")
            
            success = NSKeyedArchiver.archiveRootObject(contact, toFile: filePath)
            
            if success {
                
                print("Saved successfully")
                print (contact)
                
            } else {
                
                print("Save failed")
                
            }
            
            
        }
        
    }
    
    @IBAction func loadButtonTapped(_ sender: Any) {
        
        if let filePath = filePath {
            
            let contact = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as! Contact
            
            firstNameTextField.text = contact.firstName
            lastNameTextField.text = contact.lastName
            emailTextField.text = contact.email
            ageTextField.text = String(contact.age)
            bmiTextField.text = String(contact.bmi)
            
        }
        
    }
    
}














