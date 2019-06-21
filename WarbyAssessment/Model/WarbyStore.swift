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
    var description = ""
  //  var schedules : Schedule = Schedue()
    var offersEyeExams : Bool = false
   // var heroImage : HeroImage = HeroImage()
    var phone : String = ""
    
    convenience init(data: [String: Any]) {
        self.init()
        
        self.name = data["name"] as? String ?? ""
        self.shortName = data["short_name"] as? String ?? ""
        
        if let cmsContent = data["cms_content"] as? Dictionary<String,Any> {
            self.cardPhoto = "https:\(cmsContent["card_photo"] as? String ?? "")"
        }
        self.description = data["description"] as? String ?? "N/a"
        self.phone = data["phone"] as? String ?? ""
        self.address = Address(data: data["address"] as? Dictionary<String,String> ?? ["":""])
        self.timezone = data["timezone"] as? String ?? ""
        self.offersEyeExams = data["offers_eye_exams"] as? Bool ?? false

    }
    
}
