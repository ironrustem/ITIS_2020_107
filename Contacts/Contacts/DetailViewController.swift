//
//  DetailViewController.swift
//  Contacts
//
//  Created by Рустем on 25.10.2020.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var firstName: UILabel!
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var company: UILabel!
  @IBOutlet weak var number: UILabel!

  var firstName1: String!
  var name1: String!
  var company1: String!
  var number1: String!

  override func viewDidLoad() {
    super.viewDidLoad()

    firstName.text = firstName1
    name.text = name1
    company.text = company1
    number.text = number1

  }

}

