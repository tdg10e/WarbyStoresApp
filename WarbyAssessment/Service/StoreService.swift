//
//  StoreService.swift
//  WarbyAssessment
//
//  Created by Mac User on 6/19/19.
//

import Foundation

class StoreService {
    static let sharedInstance = StoreService()
    
    func getStores(completion: @escaping (_ stores: Array<WarbyStore>) -> ()) {
        var storeArray = [WarbyStore]()
        var endpoint : String = "https://www.warbyparker.com/api/v2/retail/locations"
        
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            // check for any errors
            guard error == nil else {
                print("error calling locations api")
                print(error!)
                return
            }
            
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            
            // parse the result as JSON, since that's what the API provides
            do {
                if let data = data {
                    let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                
                    if let locations = json?["locations"] as? [[String: Any]] {
                        for location in locations {
                            var warbyStore = WarbyStore(data: location)
                            storeArray.append(warbyStore)
                        }
                    }
                }
                completion(storeArray)
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()    
    }
}
