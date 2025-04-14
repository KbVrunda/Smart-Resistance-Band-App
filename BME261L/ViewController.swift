//
//  ViewController.swift
//  BME261L
//
//  Created by vrunda patel on 1/27/25.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Creating default values for the text fields
        EmailTextField.text = ""
        PasswordTextField.text = ""
        statusLabel.isHidden = false
        statusLabel.text = "Label"
        setGradientBackground()
        // Do any additional setup after loading the view.
    }
    
    // Segue to Sign In screen if the sign up button is pressed
    @IBAction func SignInButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueToSignUp", sender: self)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        
        // Making sure none of the fields are empty
        guard let email = EmailTextField.text, !email.isEmpty,
              let password = PasswordTextField.text, !password.isEmpty else {
            statusLabel.text = "Please enter email and password."
            return
        }
        
        // Checking if User is Registered
        Auth.auth().signIn(withEmail: EmailTextField.text!, password: PasswordTextField.text!) {
            (authResult, error) in
            if let error = error as NSError? {
                self.statusLabel.text = "\(error.localizedDescription)"
            } else {
                self.statusLabel.text = ""
                // runs the segue on the main thread
                //DispatchQueue.main.async {
                self.performSegue(withIdentifier: "segueToHomeScreen", sender: sender)

            }
        }
    }
    
    // Adding a cute background
    func setGradientBackground() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1).cgColor, // Baby Blue
            UIColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1).cgColor  // Lavender
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}

