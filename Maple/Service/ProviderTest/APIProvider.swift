////
////  APIProvider.swift
////  Maple
////
////  Created by 성제 on 2023/02/28.
////
//
//import Foundation
//import Moya
//
//struct APIManager {
//    fileprivate let provider = MoyaProvider<CubeHistoryAPI>()
//    
//    let serverErrorEndpointClosure = { (target: CubeHistoryAPI) -> Endpoint<CubeHistoryAPI> in
//      return Endpoint(url: URL(target: target).absoluteString,
//                      sampleResponseClosure: { .networkResponse(200 , /* data relevant to 500 error */) },
//                      method: target.method,
//                      task: target.task,
//                      httpHeaderFields: target.headers)
//    }
//    let serverErrorProvider = MoyaProvider<CubeHistoryAPI>(endpointClosure: serverErrorEndpointClosure, stubClosure: MoyaProvider.immediatelyStub)
//
//    
//    let stubbingProvider = MoyaProvider<CubeHistoryAPI>(stubClosure: MoyaProvider.immediatelyStub)
//
//    func version(date : String, count : Int, completion: @escaping (CubeHistoryResponseDTO) -> (), failure: @escaping (String) -> ()) {
//        provider.request(.fetchCubeHistory(date: date, count: count)) { result in
//            switch result {
//            case let .success(response):
//                do {
//                    let version = try JSONDecoder().decode(CubeHistoryResponseDTO.self, from: response.data)
//                    
//                    completion(version)
//                } catch let error {
//                    failure(error.localizedDescription)
//                }
//            case let .failure(error):
//                failure(error.localizedDescription)
//            }
//        }
//    }
//}
