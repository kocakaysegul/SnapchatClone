//
//  ViewController.swift
//  SnapchatClone
//
//  Created by Ayşegül Koçak on 26.03.2023.
//

import UIKit
import Firebase
import FirebaseFirestore

class SignInVC: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().signIn(withEmail: self.emailText.text!, password: self.passwordText.text!) { result, error in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error!")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
            self.makeAlert(title: "Error!", message: "email/password??")
        }
        
    }
   
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && usernameText.text != "" && passwordText.text != "" {
            
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { auth, error in
                if error != nil {
                    self.makeAlert(title: "Erroré", message: error?.localizedDescription ?? "Error!")
                } else {
                    
                    let firestore = Firestore.firestore()
                    let userDictionary = ["email" : self.emailText.text!, "username" : self.usernameText.text!] as [String : String]
                    firestore.collection("UserInfo").addDocument(data: userDictionary) { error in
                        if error != nil {
                            
                        }
                    }
                    
                    
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
            self.makeAlert(title: "Error!!", message: "Email/Username/Password??")
        }
    }
    
    func makeAlert(title : String, message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    
}

