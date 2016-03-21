//
//  TapToLoginViewController.swift
//  PasswordApp
//
//  Created by Dmytrii Sinko on 21.03.16.
//  Copyright © 2016 Dmytrii Sinko. All rights reserved.
//

import UIKit
import LocalAuthentication

class TapToLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func showAlertViewIfNoBiometricSensorHasBeenDetected() {
        showAlertWithTitle("Error", message: "This device does not have a TouchID sensor.")
    }


    func showAlertWithTitle( title:String, message:String ) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertVC.addAction(okAction)
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            
            self.presentViewController(alertVC, animated: true, completion: nil)
            
        }
        
    }

    
    @IBAction func tap(sender: UITapGestureRecognizer) {
        switch sender.state{
        case .Ended:
            let authenticationContext = LAContext()
            guard authenticationContext.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: nil) else {
                showAlertViewIfNoBiometricSensorHasBeenDetected()
                return
            }
            
            authenticationContext.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "Only authorised person may enter", reply: { [unowned self] (success, error) -> Void in
                if ( success ) {
                    self.performSegueWithIdentifier("Show Password", sender: self)
                }
                
            })
        default: break
        }
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
