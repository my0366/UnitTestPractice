//
//  CubeHistoryRouter.swift
//  Maple
//
//  Created by 성제 on 2023/01/10.
//
import Foundation
import Alamofire

enum CubeHistoryRouter : URLRequestConvertible {
    
    // MARK: - Cases
    case getCubeHistory(count : Int, date : String)
    
    // MARK: - Methodsc
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    // MARK: - Paths
    var path: String {
        switch self {
        case .getCubeHistory:
            return "/cube-use-results"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .getCubeHistory(let count, let date):
            return ["count" : count,
                    "date" : date]
        }
    }
    
    // MARK: - Encoding
    var encoding: ParameterEncoding {
        switch self {
        default:
            return URLEncoding.default
        }
    }
    
    
    // MARK: - URL Request
    func asURLRequest() throws -> URLRequest {
        let url = NetworkConstants.baseOpenApiURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        
        // HTTP Method
        urlRequest.method = method
        
        urlRequest.setValue(UserDefaultsRepository.returnSecretKey, forHTTPHeaderField: "Authorization")
        
        // Parameters - 파라미터 Encoding
        if let parameters = parameters {
            return try encoding.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
    
}


