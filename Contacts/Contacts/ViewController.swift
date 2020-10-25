//
//  ViewController.swift
//  Contacts
//
//  Created by Рустем on 25.10.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var contacts: UITableView!
    
    let defaults = UserDefaults.standard

    let chars = [Character]("abcdefghijklmnopqrstuvwxyz")
    
    var numberOfRows:[Int] = []
    
    var numberOfRows1:[Int] = []
    
    var charsContact:[Character] = []
    
    var numberOfSections = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        contacts.delegate = self
        contacts.dataSource = self
        contacts?.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "cellID")
        
        UserDefaults.standard.removeObject(forKey: "Contacts")
        UserDefaults.standard.synchronize()
        
        ContactsClass.share.addContact(name: "Rustem", surname: "Saifullin", company: "itis", numbers: ["7787342488"])
        ContactsClass.share.addContact(name: "Ramil", surname: "Lelyavin", company: "google", numbers: ["3434324234"])
        ContactsClass.share.addContact(name: "Ruslan", surname: "Valeev", company: "yandex", numbers: ["79685764"])
        ContactsClass.share.addContact(name: "Rinat", surname: "Vafin", company: "apple", numbers: ["23245678"])
        ContactsClass.share.addContact(name: "Railina", surname: "Galieva", company: "samsung", numbers: ["356789076"])
        ContactsClass.share.addContact(name: "Aida", surname: "Usmanova", company: "sony", numbers: ["654324578"])
        ContactsClass.share.addContact(name: "Danil", surname: "Iliadi", company: "s7", numbers: ["5678976009"])
        ContactsClass.share.addContact(name: "Timur", surname: "Batrishin", company: "d5", numbers: ["564356789"])
        ContactsClass.share.addContact(name: "Emil", surname: "Fakhreev", company: "amd", numbers: ["778788766546"])
        ContactsClass.share.addContact(name: "Edik", surname: "Krmakov", company: "itis", numbers: ["768654678"])
        ContactsClass.share.addContact(name: "Alsu", surname: "Shagieva", company: "kfu", numbers: ["77878867765"])
        
        prepareData()
        
    }
    
    func prepareData(){
        
        numberOfRows = []
        numberOfRows1 = []
        charsContact = []
        numberOfSections = 0
        
        for _ in chars{
            numberOfRows.append(0)
        }
        
        for j in ContactsClass.share.allContacts{
            let x = j.name.lowercased()
            if((j.name.count > 1)){
                if(!charsContact.contains(x[j.name.startIndex])){
                charsContact.append(x[j.name.startIndex])
                }
                let i1 = chars.firstIndex(of: x[j.name.startIndex])!
                numberOfRows[i1] = numberOfRows[i1] + 1
        }
        }
        ContactsClass.share.allContacts  = ContactsClass.share.allContacts.sorted { (con1, con2) -> Bool in
            let conName1 = con1.name
            let conName2 = con2.name
                    return (conName1.localizedCaseInsensitiveCompare(conName2) == .orderedAscending)
        }
        
        var i = 0;
        numberOfSections = 0;
        for _ in chars{
            if(numberOfRows[i] != 0){
                numberOfSections = numberOfSections + 1
            }
            i = i + 1
        }
        
        for k in numberOfRows{
            if(k != 0){
            numberOfRows1.append(k)
            }
        }
        
        print(chars)
        print(numberOfRows)
        print(charsContact)
        print(numberOfSections)
        print(numberOfRows1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.prepareData()
        self.contacts.reloadData()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goAdd" {
        let newVC = segue.destination as! AddContactViewController
            newVC.mainViewController = self
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let g =  chars.firstIndex(of:charsContact[section])!
        return numberOfRows[g];
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var h = 0;
        for i in 0..<indexPath.section{
            h = h + numberOfRows1[i]
        }
        h = h + indexPath.item;

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! ContactTableViewCell
    
        cell.name.text = ContactsClass.share.allContacts[h].name
        cell.firstName.text = ContactsClass.share.allContacts[h].surname
        return cell

    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var t:String?
        t = String(charsContact[section])
        return t
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var h = 0;
        for i in 0..<indexPath.section{
            h = h + numberOfRows1[i]
        }
        h = h + indexPath.item;
        
        print("h \(h)")
        
        print("name \(ContactsClass.share.allContacts[h].name)")
        
        let newVC = self.storyboard!.instantiateViewController(withIdentifier: "Detail") as! DetailViewController;
        
        newVC.name1 = ContactsClass.share.allContacts[h].name
        newVC.firstName1 = ContactsClass.share.allContacts[h].surname
        newVC.company1 = ContactsClass.share.allContacts[h].company
        newVC.number1 = ContactsClass.share.allContacts[h].numbers[0]
        
        self.navigationController?.pushViewController(newVC, animated: true)
        
    }
    
}

    

