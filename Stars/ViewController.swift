//
//  ViewController.swift
//  Stars
//
//  Created by Michael Stoffer on 5/7/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // IBOutlets and Properties
    @IBOutlet weak var starNameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    let starController = StarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.listStars()
    }

    // IBActions and Methods
    @IBAction func addStarButtonTapped(_ sender: Any) {
        guard let name = self.starNameTextField.text,
            let distanceString = self.distanceTextField.text,
            let distance = Double(distanceString) else { return }
        
        self.starController.addStar(named: name, withDistance: distance)
        self.listStars()
        self.clearInput()
    }
    
    private func listStars() {
        var output = ""
        for star in starController.stars {
            output += "\(star.name) is \(star.distance) light years away. \n"
        }
        self.textView.text = output
    }
    
    private func clearInput() {
        self.starNameTextField.text = nil
        self.distanceTextField.text = nil
    }
    
}

