//
//  StoreDetailContainerViewController.swift
//  WarbyAssessment
//
//  Created by Tremaine Grant on 6/21/19.
//

import UIKit

class StoreDetailContainerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var detailsTable: UITableView!
    var store = WarbyStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        detailsTable.delegate = self
        detailsTable.dataSource = self
        
        self.detailsTable.register(UINib(nibName:"AddressCardTableViewCell", bundle: nil), forCellReuseIdentifier: "storeAddressCard")
        self.detailsTable.register(UINib(nibName:"AboutStoreTableViewCell", bundle: nil), forCellReuseIdentifier: "aboutStoreCard")
        self.detailsTable.register(UINib(nibName:"ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "serviceCard")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        let addressCard = tableView.dequeueReusableCell(withIdentifier: "storeAddressCard", for:indexPath) as! AddressCardTableViewCell
        let aboutCard = tableView.dequeueReusableCell(withIdentifier: "aboutStoreCard", for:indexPath) as! AboutStoreTableViewCell
        let serviceCard = tableView.dequeueReusableCell(withIdentifier: "serviceCard", for:indexPath) as! ServiceTableViewCell
        
        switch indexPath.row {
        case 0:
            if let addy = store.address {
                addressCard.street.text = addy.streetAddress
                addressCard.cityStateZip.text = addy.genCityStateZip()
            }
            cell = addressCard
        case 1:
            aboutCard.aboutStore.text = store.description
            cell = aboutCard
        default:
            serviceCard.service.text = "Optical Services"
            serviceCard.isAvailableIcon.image = UIImage(named: "no")

            if store.offersEyeExams {
                serviceCard.isAvailableIcon.image = UIImage(named: "yes")
            }
            
            cell = serviceCard
        }
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "storeListingToDetails", sender: nil)
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
