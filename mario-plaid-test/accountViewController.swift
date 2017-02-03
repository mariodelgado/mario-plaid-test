//
//  accountViewController.swift
//  mario-plaid-test
//
//  Created by Mario Delgado on 1/29/17.
//  Copyright © 2017 Mario Delgado. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AFNetworking



class accountViewController: UITableViewController
 {
    
    @IBOutlet var tblJSON: UITableView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary


 
    override func viewDidLoad() {
        super.viewDidLoad()
        let todoEndpoint: String = "https://tartan.plaid.com/connect?client_id=test_id&secret=test_secret&username=plaid_test&password=plaid_good&type=citi"
        Alamofire.request( todoEndpoint , method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                 debugPrint(responseData)
                if let resData = swiftyJsonVar["accounts"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                   
                }
                debugPrint(self.arrRes.count)
                if self.arrRes.count > 0 {
                    self.tblJSON.reloadData()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell")!
        var dict = arrRes[indexPath.row]
        cell.textLabel?.text = dict["meta"]?["name"] as? String
        cell.detailTextLabel?.text = dict["subtype"] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
