//
//  SignUpViewController.swift
//  BME261L
//
//  Created by vrunda patel on 1/27/25.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpEmailField: UITextField!
    @IBOutlet weak var signUpPasswordField: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpEmailField.text = " "
        signUpPasswordField.text = " "
        confirmPassword.text = " "
        statusLabel.text = " "

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        // Ensure fields are not empty
        guard let email = signUpEmailField.text, !email.isEmpty,
              let password = signUpPasswordField.text, !password.isEmpty,
              let confirmPassword = confirmPassword.text, !confirmPassword.isEmpty else {
            statusLabel.text = "Please fill in all fields."
            return
        }
        
        // checking if both passwords match
        guard confirmPassword == signUpPasswordField.text else {
            statusLabel.text = "Passwords do not match."
            return
        }
        
        // create a new user
        Auth.auth().createUser(withEmail: signUpEmailField.text!, password: signUpPasswordField.text!) {
            (authResult, error) in
            // NS stands for Next Step
            if let error = error as NSError? {
                self.statusLabel.text = "\(error.localizedDescription)"
            } else {
                self.statusLabel.text = "Success! Return to Login Screen."
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
