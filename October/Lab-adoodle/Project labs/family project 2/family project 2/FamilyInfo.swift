//
//  FamilyInfo.swift
//  family project 2
//
//  Created by mac on 11/1/22.
//

import Foundation
import UIKit

struct FamilyInfo {
    var name: String
    var description: String
    var image: UIImage
    
    
    static let descriptionOfFam: [FamilyInfo] = [
        FamilyInfo(name: "Dad(Bryan) & Mom(Diana", description: "They're pretty dope, my Dad loves the beach, my Mom loves to garden haha.", image: UIImage(named: "Los Padres")!),
        FamilyInfo(name: "Jennessa", description: "She's got 2 kids and a pretty cool husband who loves to hunt!", image: UIImage(named: "nessa")!),
    FamilyInfo(name: "Kaylee", description: "She travels a lot and does not like utah haha.", image: UIImage(named: "Kaylee")!),
    FamilyInfo(name: "Jordyn", description: "She's also got 2 kids and is pretty rad, she's studying to be like nurse...I kinda forgot...", image: UIImage(named: "jordyn")!),
    FamilyInfo(name: "Connor", description: "He's dope, also goes to Mtech. We also work together at gas station. Sooooo cooool I know.", image: UIImage(named: "Connor")!),
    FamilyInfo(name: "Jakob(me)", description: "I'm cool just got married to my amazing wife and I'm struggling to learn this code hahaaaa....",image: UIImage(named: "Me and the Wifey")!)
    ]
    
}
