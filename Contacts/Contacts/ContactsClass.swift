//
//  ContactsClass.swift
//  Contacts
//
//  Created by Рустем on 25.10.2020.
//

import Foundation

class ContactsClass {
    
    let defaults = UserDefaults.standard
    static let share = ContactsClass()

    struct Contact:Codable {
        var name:String
        var surname:String
        var company:String
        var numbers:[String]
    }
    
    var allContacts:[Contact]{
        get{
            if let data = defaults.value(forKey: "Contacts") as? Data{
                return try! PropertyListDecoder().decode([Contact].self, from: data)
            } else {
                return [Contact]()
            }
        }
        set{
            if let data = try? PropertyListEncoder().encode(newValue) {
            defaults.set(data, forKey: "Contacts")
            }
        }
    }
    
    func addContact(name:String, surname:String, company:String, numbers:[String]){
        let contact = Contact(name: name,surname: surname, company: company,numbers: numbers)
        allContacts.insert(contact, at: 0)
    }
    
    func deleteContat(index: Int){
        allContacts.remove(at: index)
    }
}
