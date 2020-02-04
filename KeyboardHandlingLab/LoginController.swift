//
//  LoginController.swift
//  KeyboardHandlingLab
//
//  Created by Brendon Cecilio on 2/3/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet weak var bleededImageView: UIImageView!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var stackViewYConstraint: NSLayoutConstraint!
    
    private var originalConstraint: NSLayoutConstraint!
    private var keyboardIsVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 7
        registerForKeyboardNotifications()
        bleededImageView.image = UIImage(named: "03071R1-R01-2")
        userNameField.delegate = self
        passwordField.delegate = self
    }
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterForKeyBoardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    private func keyboardWillShow(notification: NSNotification) {
        print("willShow")
        
        guard let keyboardFrame = notification.userInfo?["UIKeyboardFrameBeginUserInfoKey"] as? CGRect else {
            return
        }
        moveKeyboardUP(keyboardFrame.size.height)
    }
    
    @objc
    private func keyboardWillHide(notification: NSNotification) {
        resetUI()
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func moveKeyboardUP(_ height: CGFloat) {
        if keyboardIsVisible {return}
        originalConstraint = stackViewYConstraint
        stackViewYConstraint.constant -= (height * 0.20)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        keyboardIsVisible = true
    }
    
    private func resetUI() {
        keyboardIsVisible = false
        stackViewYConstraint.constant = 0
    }
}

extension LoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
