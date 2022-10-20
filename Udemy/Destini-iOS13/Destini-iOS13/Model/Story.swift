//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    
    var title:String
    var choice:[String] = [String](repeating: "", count: 2)
    var choiceDestination:[Int] = [Int](repeating: 0, count: 2)
    
    init(title:String , choice1:String , choice1Destination:Int ,choice2:String, choice2Destination:Int)
    {
        self.title = title
        self.choice[0] = choice1
        self.choice[1] = choice2
        self.choiceDestination[0] = choice1Destination
        self.choiceDestination[1] = choice2Destination
    }
}
