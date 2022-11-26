//
//  RegisterViewController.swift
//  LoginFirebase
//
//  Created by Sévio Basilio Corrêa on 26/11/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = senhaTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alert = UIAlertController(title: "Oops!", message: e.localizedDescription, preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Ok", style: .cancel)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                    print(e.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "loged", sender: self)
                }
            }
            
        }
    }
}
