//
//  PasswordManagerViewController.swift
//  PasswordApp
//
//  Created by Dmytrii Sinko on 21.03.16.
//  Copyright © 2016 Dmytrii Sinko. All rights reserved.
//

import UIKit

class PasswordManagerViewController: UIViewController {
    let defaults = NSUserDefaults.standardUserDefaults()
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let password = defaults.stringForKey("password") {
            passwordField.text = password
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func save(sender: AnyObject) {
        defaults.setValue(passwordField.text, forKey: "password")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
