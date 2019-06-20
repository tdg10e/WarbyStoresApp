//
//  StoreTableContainerViewController.swift
//  WarbyAssessment
//
//  Created by Tremaine Grant on 6/20/19.
//

import UIKit

protocol StoreContainerDelegate: class {
    func select(store: WarbyStore)
    func reload()
}
class StoreTableContainerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var warbyStores = [WarbyStore]()
    
    @IBOutlet weak var storesTable: UITableView!
    weak var delegate: StoreContainerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        storesTable.delegate = self
        storesTable.dataSource = self
        
        self.storesTable.register(UINib(nibName:"StoreTableViewCell", bundle: nil), forCellReuseIdentifier: "storeCell")
        
        StoreService.sharedInstance.getStores { (stores) in
            self.warbyStores = stores
            self.storesTable.reloadData()
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
        storeCell.cityStateZip.text = "\(store.address?.locality),\(store.address?.regionCode), \(store.address?.postalCode)"
        
        storeCell.imageView?.downloaded(from: store.cardPhoto)
        
        storeCell.selectionStyle = UITableViewCell.SelectionStyle.none
        return storeCell
        
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
