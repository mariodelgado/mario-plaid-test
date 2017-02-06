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
        print("Failed?")

    }

    @IBOutlet weak var bg1: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var plaidButton: UIButton!
    @IBOutlet weak var accessTokenLabel: UILabel!
    @IBOutlet weak var bindingBG: UIView!
    @IBOutlet weak var intro: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bindingBG.layer.cornerRadius = 8
        bindingBG.layer.shadowOpacity = 0.3
        bindingBG.layer.shadowRadius = 28
        bindingBG.layer.position.y = bindingBG.layer.position.y+100
    }
    @IBAction func startScreen(_ sender: Any) {
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { 
            self.bindingBG.layer.position.y = self.bindingBG.layer.position.y - 670
            self.intro.layer.position.y = self.intro.layer.position.y - 700
            self.intro.layer.opacity = 0
            self.bg1.layer.position.y = self.bg1.layer.position.y - 300
        }, completion: nil)
        
    }

    @IBAction func plaidConnectButton(sender: AnyObject) {
        let plaidLink = PLDLinkNavigationViewController(environment: .tartan, product: .auth)
        plaidLink?.linkDelegate = self
        plaidLink?.providesPresentationContextTransitionStyle = true
        plaidLink?.definesPresentationContext = true
        plaidLink?.modalPresentationStyle = .custom
    
        
        self.present(plaidLink!, animated: true, completion: nil)
    }
    
    func linkNavigationContoller(_ navigationController: PLDLinkNavigationViewController!, didFinishWithAccessToken accessToken: String!) {
        print("success \(accessToken)")
        self.dismiss(animated: true, completion: nil)
        let tokenString = "" + accessToken
        self.accessTokenLabel.text = tokenString
        
    }
    
    func linkNavigationControllerDidFinishWithBankNotListed(navigationController: PLDLinkNavigationViewController!) {
        print("Manually enter bank info?")
        self.dismiss(animated: true, completion: nil)
    }
    
    func linkNavigationControllerDidCancel(_ navigationController: PLDLinkNavigationViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}
