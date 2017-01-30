//
//  ViewController.swift
//  mario-plaid-test
//
//  Created by Mario Delgado on 1/29/17.
//  Copyright © 2017 Mario Delgado. All rights reserved.
//

import UIKit
import plaid_ios_link


class ViewController: UIViewController, PLDLinkNavigationControllerDelegate

{
    /**
     Called when a user taps the "I don't see my bank" cell.
     
     Implementing classes should dismiss the PLDLinkNavigationViewController when this is called, and probably give the option to manually enter bank information.
     
     @param navigationController The navigation controller presenting Plaid Link.
     */
    public func linkNavigationControllerDidFinish(withBankNotListed navigationController: PLDLinkNavigationViewController!) {
        print("failed?")

    }

    @IBOutlet weak var plaidButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func plaidConnectButton(sender: AnyObject) {
        let plaidLink = PLDLinkNavigationViewController(environment: .tartan, product: .connect)
        plaidLink?.linkDelegate = self
        plaidLink?.providesPresentationContextTransitionStyle = true
        plaidLink?.definesPresentationContext = true
        plaidLink?.modalPresentationStyle = .custom
        
        self.present(plaidLink!, animated: true, completion: nil)
    }
    
    func linkNavigationContoller(_ navigationController: PLDLinkNavigationViewController!, didFinishWithAccessToken accessToken: String!) {
        print("success \(accessToken)")
        self.dismiss(animated: true, completion: nil)
    }
    
    func linkNavigationControllerDidFinishWithBankNotListed(navigationController: PLDLinkNavigationViewController!) {
        print("Manually enter bank info?")
        self.dismiss(animated: true, completion: nil)
    }
    
    func linkNavigationControllerDidCancel(_ navigationController: PLDLinkNavigationViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}
