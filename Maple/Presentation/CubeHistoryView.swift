//
//  CubeHistoryView.swift
//  Maple
//
//  Created by 성제 on 2023/01/10.
//

import Foundation
import UIKit

class CubeHistoryView : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cube = CubeHistoryViewModel()
        cube.fetchCubeHistory(count: 10, date: "2022-12-28")
        
        print("count = \(cube.cubeHistoryData.count)")
    }
    
}
