//
//  ChecklistModel.swift
//  Hey-Do!
//
//  Created by babykang on 15/5/14.
//  Copyright (c) 2015年 Fiona. All rights reserved.
//

import Foundation

class ChecklistModel: NSObject, NSCoding{
    var text = ""
    var checked = false
    
    func toggleChecked(){
        checked = !checked
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(text, forKey:"Text")
    aCoder.encodeBool(checked, forKey : "Checked")
    }
    
    required init(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked")
        super.init()
    }
    
    override init() {
        super.init()
    }

}
