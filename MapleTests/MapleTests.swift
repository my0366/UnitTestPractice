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

    func test_fetchCubeHistory_success() {
        //When
        sut = CubeHistoryAPIProvider(isStub: true,sampleStatusCode: 200, customEndpointClosure: nil)
        
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
    
    func test_fetchCubeHistory_badRequest() {

        //When
        sut = CubeHistoryAPIProvider(isStub: true,sampleStatusCode: 400, customEndpointClosure: nil)
        
        
        sut.fetchCubeHistory(date: "", count: 10) { res in
            switch res {
            case .success(_):
                print("success")
            case .failure(let moyaError):
                //then
                XCTAssertEqual("\(moyaError)", "badRequest")
            }
        }
    }
    
    func test_fetchCubeHistory_UnAuthorized() {

        UserDefaultsRepository.saveSecretKey(value: "")
        //When
        sut = CubeHistoryAPIProvider(isStub: true,sampleStatusCode: 401, customEndpointClosure: nil)
        
        sut.fetchCubeHistory(date: "2022-12-28", count: 10) { res in
            switch res {
            case .success(_):
                print("success")
            case .failure(let moyaError):
                //then
                XCTAssertEqual("\(moyaError)", "unauthorized")
            }
        }
    }
}

