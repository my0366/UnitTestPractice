//
//  Provider.swift
//  Maple
//
//  Created by 성제 on 2023/01/11.xg
//

import Foundation
import Moya


class CubeHistoryAPIProvider : ProviderProtocol {
    
    required init(isStub: Bool, sampleStatusCode: Int, customEndpointClosure: ((CubeHistoryAPI) -> Moya.Endpoint)?) {
        provider = Self.consProvider(isStub, sampleStatusCode, customEndpointClosure)
    }
    
    typealias T = CubeHistoryAPI
    
    let provider : MoyaProvider<CubeHistoryAPI>
    init(provider: MoyaProvider<CubeHistoryAPI> = .init()) {
        self.provider = provider
    }


    func fetchCubeHistory(date : String,
                         count : Int,
                          completion : @escaping (Result<CubeHistoryResponseDTO, Error>) -> Void)  {
        provider.request(.fetchCubeHistory(date: date, count: count)) { result in
            switch result {
            case .success(let moyaResponse):
                completion(.success(try! moyaResponse.map(CubeHistoryResponseDTO.self)))
            case .failure(let moyaError):
                completion(.failure(moyaError))
            }
        }
    }
}
