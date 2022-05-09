//
//  ViewController.swift
//  Toast_AlertDialog
//
//  Created by Ouriel Bennathan on 24/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var classic_view: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let's make a toast
        toast.show(message: "hello world", controller: self, duration: 1, disapper: 2)
        
    }
    @IBAction func sgmtChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            //classic dialog
            classic_view.isHidden = false
        case 1:
            //Yes or No
            //create AlertController
            let alert = UIAlertController (title: "Title", message: "You want to see me?", preferredStyle: .alert)
            //show Yes button and show image if selected
            alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: { (UIAlertAction) in
                //show the image
                self.classic_view.isHidden = true
            }))
            //show no button and dismiss
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: { (UIAlertAction) in
                //show the image
                self.classic_view.isHidden = false
            }))
            show(alert, sender: nil)
        case 2:
            //simple text entry as text
            let alert = UIAlertController(title: "You have a message", message: "want to scribe?", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.addAction(UIAlertAction(title: "Yes", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: { (myAction) in
                let fields=alert.textFields!
                let txt = fields[0].text!
                print ("\(txt) !!!")
            }))
            present(alert, animated: true, completion: nil)
        case 3:
            //alert controller as login screen
            let alert = UIAlertController(title: "Login", message: "Enter user name and password", preferredStyle: .alert)
            var uName,uPass:UITextField!
            alert.addTextField(configurationHandler: {
                (userName) in
                userName.placeholder = "Enter user name..."
                uName = userName
            })
            alert.addTextField(configurationHandler: {
                (userPass) in
                userPass.placeholder = "Enter user password..."
                //change the input into password input, which mean dot instead of text
                userPass.isSecureTextEntry=true
                uPass = userPass
            })
            
            func okHandler(action: UIAlertAction){
                if (uName.text == "rimon" && uPass.text == "1234"){
                    print ("rimon wants Mais")
                } else {
                    print ("error in user name or password")
                }
            }
            
            alert.addAction(UIAlertAction (title: "Leave me ", style: .destructive, handler: okHandler))
            alert.addAction(UIAlertAction(title: "Marry her", style: .cancel, handler: nil))
            //present with animation, show without animation
            present (alert, animated: true, completion: nil)
        case 4:
            //action sheet as options
            let alert = UIAlertController(title: "who wants Mais", message: "prefered grooms", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Shibel", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Eias", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Rimon", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "Daniel", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        case 5://
            classic_view.isHidden=true
        default:
            classic_view.isHidden=true
        }
    }
    
}


