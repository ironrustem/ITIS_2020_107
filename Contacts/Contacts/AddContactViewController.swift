//
//  AddContactViewController.swift
//  Contacts
//
//  Created by Рустем on 25.10.2020.
//

import UIKit

class AddContactViewController: UIViewController {

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var number: UITextField!
    
    var mainViewController:UIViewController!
    
    var timer1 : Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer1 = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(colorButtonDone), userInfo: nil, repeats: true)
       
    }

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func done(_ sender: Any) {
        if(doneButton.isEnabled){
            ContactsClass.share.addContact(name: name.text!, surname: firstName.text!, company: company.text!, numbers: [number.text!])
            mainViewController.viewWillAppear(true)
            timer1?.invalidate();
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func colorButtonDone(){
        print(111111)
        if (name.text == "")&&(firstName.text == "") {
            doneButton.isEnabled = false
        } else {
            doneButton.isEnabled = true
        }
    }
}
