//
//  Contact.swift
//  My Fitness Contacts
//
//  Created by Tatiana Looby on 02/02/2017.
//  Copyright © 2017 Tatiana Looby. All rights reserved.
//

import UIKit

class Contact: NSObject, NSCoding {
    
    // Properties
    var firstName: String
    var lastName: String
    var email: String
    var age: Int
    var bmi: Double
    
    // Initialiser
    init(firstName: String, lastName: String, email: String, age: Int, bmi: Double) {
        
        // Set all the properties
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.age = age
        self.bmi = bmi
        
        // Init on super
        super.init()
        
    }
    
    override var description: String {
        
        return "name: \(firstName) \(lastName) email: \(email) age: \(age) bmi: \(bmi)"
    }
    
    required init?(coder decoder: NSCoder) {
        
        self.firstName = decoder.decodeObject(forKey: "firstName") as! String
        self.lastName = decoder.decodeObject(forKey: "lastName") as! String
        self.email = decoder.decodeObject(forKey: "email") as! String
        self.age = decoder.decodeInteger(forKey: "age") as Int
        self.bmi = decoder.decodeDouble(forKey: "bmi")
        
        super.init()
    }
    
    func encode(with encoder: NSCoder) {
        
        encoder.encode(firstName, forKey: "firstName")
        encoder.encode(lastName, forKey: "lastName")
        encoder.encode(email, forKey: "email")
        encoder.encode(age, forKey: "age")
        encoder.encode(bmi, forKey: "bmi")
                
    }

}
