//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var imageViewOfCondition: UIImageView!
    @IBOutlet weak var labelOfTemperature: UILabel!
    @IBOutlet weak var LabelOfCity: UILabel!
    
    @IBOutlet weak var searchEngine: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchButton(_ sender: UIButton) { //user will type the city and press the search button
        searchEngine.text
    }
    
}

