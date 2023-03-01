//
//  SigninViewController.swift
//  Kulasroom
//
//  Created by ecem kuloglu on 12.01.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class SigninViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func signinbuttonclicked(_ sender: Any) {
//        if (emailText.text != nil && passwordText.text != nil){
//            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { data, error  in
//                if error != nil {
//                    print("error")
//                }else{
//                    self.performSegue(withIdentifier: "login", sender: nil)
//                }
//            }
//        }
        Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { data, error  in
                if error != nil {
                        return
                }
                else {
                    print("Giriş yapıldı")
                    self.performSegue(withIdentifier: "searchpage", sender: nil)
                }
            }
        }
}
