//
//  accountViewController.swift
//  mario-plaid-test
//
//  Created by Mario Delgado on 2/5/17.
//  Copyright © 2017 Mario Delgado. All rights reserved.
//

import UIKit
import AFNetworking

class accountViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var names: [String]!
    var data: [NSDictionary]!

    override func viewDidLoad() {
        super.viewDidLoad()


        
        let url = NSURL(string: "https://tartan.plaid.com/connect?client_id=test_id&secret=test_secret&username=plaid_test&password=plaid_good&type=citi")!
        let request = NSMutableURLRequest(url:url as URL);
        request.httpMethod = "POST";

       
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            
            if error != nil {
                print("thers an error in the log")
            } else {
                
                DispatchQueue.main.async() {
                    let json = try! JSONSerialization.jsonObject(with: data! , options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                   print(json)
                    
                    self.data = json["accounts"] as! [NSDictionary]
                    self.tableView.reloadData()

                    
                    print(self.data.count)
                    
                }
            }
    
    
    
        }
        
        task.resume()

        
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
    func numberOfObjectsInMyArray() -> Int {
        if self.data?.count != nil {
            print("There are objects!")
 return self.data.count        }

        return 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfObjectsInMyArray()
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "AccountsTableViewCell")! as! AccountsTableViewCell
        
        
       // let photo = self.data[indexPath.row]
        //let user = photo["user"] as! NSDictionary
        
       // let username = photo.value(forKeyPath: "user.username") as! String
      //  let photourl = photo.value(forKeyPath: "images.low_resolution.url") as! String
        
        
        // cell.usernameLabel.text = user["username"] as! String
        
       // cell.accountName.text = username
       // cell.accountImage.setImageWith(NSURL(string: photourl)! as URL)
        
        return cell
    }


}
