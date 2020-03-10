//
//  Helpers.swift
//  DiaAPISwift
//
//  Created by John Patrick Teruel on 3/10/20.
//

import SwiftyJSON

extension Dictionary{
    func toJSONString() -> String{
        if let jsonString = JSON(self).rawString(){
            return jsonString
        }else{
            return "{}"
        }
    }
}
