//
//  MapleTests.swift
//  MapleTests
//
//  Created by 성제 on 2023/01/11.
//

import XCTest
@testable import Maple

class CubeHistoryAPITests: XCTestCase {
    
    var sut: CubeHistoryAPIProvider!
    
    override func setUpWithError() throws {
        sut = CubeHistoryAPIProvider(isStub: true,sampleStatusCode: 200, customEndpointClosure: nil)
    }
    
    
    func test_fetchCubeHistory_success() {
        
        sut.fetchCubeHistory(date: "2022-12-28", count: 10) { res in
            switch res {
            case .success(let value):
                //then
                XCTAssertEqual(value.count, 10)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
