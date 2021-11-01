//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var imageViewOfCondition: UIImageView!
    @IBOutlet weak var labelOfTemperature: UILabel!
    @IBOutlet weak var LabelOfCity: UILabel!
    @IBOutlet weak var searchEngine: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchEngine.delegate = self // let the text field know how it has been interacted
    }

    @IBAction func searchButton(_ sender: UIButton) { //user will type the city and press the search button
        print(searchEngine.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // take action when 'return' key pressed.
        print(searchEngine.text!)
        return true
    }
    
}

