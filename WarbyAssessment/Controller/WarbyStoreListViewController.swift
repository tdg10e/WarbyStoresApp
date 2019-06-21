//
//  WarbyStoreListViewController.swift
//  WarbyAssessment
//
//  Created by Tremaine Grant on 6/20/19.
//

import UIKit
import Alamofire
import AlamofireImage

class WarbyStoreListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var storesTable: UITableView!
    var warbyStores = [WarbyStore]()
    var selectedStore = WarbyStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        storesTable.delegate = self
        storesTable.dataSource = self
        
        self.storesTable.register(UINib(nibName:"StoreTableViewCell", bundle: nil), forCellReuseIdentifier: "storeCell")
        
        StoreService.sharedInstance.getStores { (stores) in
            self.warbyStores = stores
            DispatchQueue.main.async { // Correct
                self.storesTable.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.warbyStores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let storeCell = tableView.dequeueReusableCell(withIdentifier: "storeCell", for:indexPath) as! StoreTableViewCell
        
        let store = warbyStores[indexPath.row]
        storeCell.storeName.text = store.name
        storeCell.street.text = store.address?.streetAddress
       // storeCell.delegate = self
        storeCell.store = store
        
        if let addy = store.address {
             storeCell.cityStateZip.text = addy.genCityStateZip()
        }
       
        if store.cardPhoto != "" {
            if let url = URL(string: (store.cardPhoto)) {
                storeCell.storeImg.af_setImage(withURL: url, placeholderImage: UIImage(named: "storefront"))
            } else {
                storeCell.storeImg.image = UIImage(named: "storeFront")
            }
        } else {
            storeCell.storeImg.image = UIImage(named: "storeFront")
        }
        
        storeCell.selectionStyle = UITableViewCell.SelectionStyle.none
        return storeCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedStore = warbyStores[indexPath.row]
        self.performSegue(withIdentifier: "storeListingToDetails", sender: nil)
    }


    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "storeListingToDetails" {
            let container = segue.destination as! StoreTableViewController
            container.warbyStore = self.selectedStore
        }
        
        
    }
    

}
