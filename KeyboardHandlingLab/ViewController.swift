//
//  ViewController.swift
//  KeyboardHandlingLab
//
//  Created by Brendon Cecilio on 2/3/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bleededImageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        bleededImageView.alpha = 0.0
        loginButton.alpha = 0.0
        buttonDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        animateImageView()
    }
    
    private func buttonDesign() {
        loginButton.layer.cornerRadius = 7
    }
    
    private func animateImageView() {
        UIView.animate(withDuration: 1.5, delay: 1.0, options: [], animations: {
            self.bleededImageView.image = UIImage(named: "03071R1-R01-10")
            self.bleededImageView.alpha = 1.0
            self.loginButton.isHidden = true
        }) { (done) in
            UIView.animate(withDuration: 0.7) {
                self.loginButton.isHidden = false
                self.loginButton.alpha = 1.0
            }
        }
    }
}


