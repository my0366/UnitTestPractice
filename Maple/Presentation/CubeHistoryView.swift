//
//  CubeHistoryView.swift
//  Maple
//
//  Created by 성제 on 2023/01/10.
//

import Foundation
import UIKit

class CubeHistoryView : UIViewController {
    
    var cubeDataList : [CubeHistoryDTO] = []
    
    @IBOutlet weak var cubeHistoryTableView: UITableView!
    let cube = CubeHistoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cubeHistoryTableView.dataSource = self
        bindData()
    }
    
    func bindData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.cubeDataList = self.cube.cubeHistoryData
            self.cubeHistoryTableView.reloadData()
        }
    }
}

extension CubeHistoryView : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cubeDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CubeHistoryTableViewCell", for: indexPath) as? CubeHistoryTableViewCell else {
            return UITableViewCell()
        }
        
        let cubeData = cubeDataList[indexPath.row]
        
        cell.usedEquipment.text = cubeData.target_item
        cell.additional_potential_option_grade.text = cubeData.additional_potential_option_grade
        cell.potential_option_grade.text = cubeData.potential_option_grade
        cell.cubeResult.text = "결과 : \(cubeData.item_upgrade_result)"
        if cubeData.item_upgrade_result == "실패" {
            cell.cubeResult.textColor = UIColor.red
        } else {
            cell.cubeResult.textColor = UIColor.blue
        }
        cell.usedDate.text = "\(cubeData.create_date.toDate()!)"
        cell.cubeType.text = cubeData.cube_type
        
        return cell
    }
}
