import Foundation
import UIKit
import SwiftyJSON
import Alamofire

class MachineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var laundryInfo : SwiftyJSON.JSON = [] {
        didSet { tableView.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let laundry = LaundryInformation().getLaundryInformation()
        
        Alamofire.request(.GET, "http://23.23.147.128/homes/mydata/urba7723").validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    self.laundryInfo = json
                }
            case .Failure(let error):
                print(error)
            }
        }
        
        self.tableView.rowHeight = 105.0
        self.tableView.estimatedRowHeight = 105.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laundryInfo?.count ?? 30
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MachineTableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as! MachineTableViewCell
//        cell.buildingNameLabel?.text = "lol"
        cell.buildingNameLabel?.text = laundryInfo["location"]["rooms"][indexPath.row]["name"].stringValue
//        cell.washingMachineLabel?.text = "nah"
        
        // run a function that for loops and counts
        var laundryMachineCount : Int = 0
        var dryerCount : Int = 0
        for i in 1...laundryInfo["location"]["rooms"][indexPath.row]["machines"].count {
            if (laundryInfo["location"]["rooms"][indexPath.row]["machines"][i]["status"]) == "Available" {
//                if () {
//                    
//                }
//                elsif() {
            }
         }
        

        
        cell.washingMachineLabel?.text = String(laundryMachineCount)
//        cell.dryerLabel?.text = "pls"
        cell.dryerLabel?.text = laundryInfo["location"]["rooms"][indexPath.row]["name"].stringValue
        
        return cell
    }
    
    
}

