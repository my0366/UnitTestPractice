//
//  CubeHistoryViewModel.swift
//  Maple
//
//  Created by 성제 on 2023/01/11.
//

import Foundation


class CubeHistoryViewModel {
    
//    var disposeBag = DisposeBag()
    
    init() {
        fetchCubeHistory(count: 10, date: "2022-12-28")
    }
    
    var cubeHistoryData : [CubeHistoryDTO] = []
    var errMsg : String = ""
    
    func fetchCubeHistory(count : Int, date : String) {
        print(#fileID, #function, #line, "- fetchCubeHistory")
        
        CubeHistoryAPIProvider().fetchCubeHistory(date: date, count: count) { res in
            switch res {
            case .success(let value):
                self.cubeHistoryData += value.cube_histories ?? []
            case .failure(let error):
                self.errMsg = error.localizedDescription
            }
        }
    }
}
