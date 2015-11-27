import UIKit

class MachineTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var buildingNameLabel: UILabel! // Building washing rooms
    
    @IBOutlet weak var washingMachineLabel: UILabel! // # of Washing Machines available
    
    @IBOutlet weak var dryerLabel: UILabel! // # of dryers available
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
