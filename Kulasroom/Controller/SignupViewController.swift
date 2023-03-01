//
//  SignupViewController.swift
//  Kulasroom
//
//  Created by ecem kuloglu on 12.01.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var usigneduplabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func sigupbuttonclicked(_ sender: Any) {
        if (emailText.text?.isEmpty != true && passwordText.text?.isEmpty != true){
            print("enter an email and password")
            signup()
            usigneduplabel.text = "You sign up successfully!"
        }
    }
    
    
    func signup(){
        Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { authresult, error in
            guard let user = authresult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
        }
    }
    
}
