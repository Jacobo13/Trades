//
//  NewsFeedViewController.swift
//  Trades
//
//  Created by Programación Daniel on 20/03/17.
//  Copyright © 2017 Jacobo Sacal. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class NewsFeedViewController : UIViewController {
    
    var locationManager = CLLocationManager()
    var categoria : String!
    var currentLocation : CLLocationCoordinate2D!
    var objetos : [NSDictionary] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        print(objetos)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getInfo(notification:)), name: NSNotification.Name(rawValue: "showPoints"), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func getInfo (notification : Notification) {
        self.objetos = notification.userInfo? ["objects"] as! [NSDictionary]
        tableView.reloadData()
    }
    
}


extension NewsFeedViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print (objetos.count)
        if objetos.count <= 100 {
            return objetos.count
        } else{
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! NewsFeedViewControllerCell
        let item = objetos[indexPath.row]
        cell.descriptionLabel.text = item["Description"] as? String
        cell.nameProductLabel.text = item["Name"] as? String
        let url = URL(string: "\(item["Image"]!)" )
        let data = NSData(contentsOf: url!)
        cell.imageProduct.image = UIImage(data: data as! Data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let numeroDeCell = indexPath.row
        print(numeroDeCell)
        
        performSegue(withIdentifier: "llevame", sender: nil)
    }
}
