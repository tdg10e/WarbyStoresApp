//
//  WarbyStore.swift
//  WarbyAssessment
//
//  Created by Mac User on 6/19/19.
//

import Foundation

class WarbyStore {
    var name = ""
    var shortName = ""
    var timezone = ""
    var address : Address?
    var city = ""
    var location = ""
    var cardPhoto = ""
  //  var schedules : Schedule = Schedue()
    var offersEyeExams : Bool = false
    var offersRxCheck : Bool = true
   // var heroImage : HeroImage = HeroImage()
    var phone : String = ""
    
    convenience init(data: [String: Any]) {
        self.init()
        
        self.name = data["name"] as? String ?? ""
        self.shortName = data["short_name"] as? String ?? ""
        self.cardPhoto = data["card_photo"] as? String ?? ""
        self.phone = data["phone"] as? String ?? ""
        self.address = Address(data: data["address"] as? Dictionary<String,String> ?? ["":""])
        self.timezone = data["timezone"] as? String ?? ""
        self.offersEyeExams = data["offersEyeExams"] as? Bool ?? false
        self.offersRxCheck = data["offersRxCheck"] as? Bool ?? false

    }
    
}
