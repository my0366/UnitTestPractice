//
//  ProviderProtocol.swift
//  Maple
//
//  Created by 성제 on 2023/01/11.
//

import Foundation
import Moya

public protocol ProviderProtocol {
    associatedtype T: TargetType

    init(isStub: Bool, sampleStatusCode: Int, customEndpointClosure: ((T) -> Endpoint)?)
}

public extension ProviderProtocol {
    
    static func consProvider(
        _ isStub: Bool = false,
        _ sampleStatusCode: Int = 200,
        _ customEndpointClosure: ((T) -> Endpoint)? = nil) -> MoyaProvider<T> {
            
            if isStub == false {
                return MoyaProvider<T>(
                    endpointClosure: {
                        MoyaProvider<T>.defaultEndpointMapping(for: $0).adding(newHTTPHeaderFields: $0.headers ?? [:])
                    },
                    session: MoyaProvider<T>.defaultAlamofireSession(),
                    plugins: [NetworkLoggerPlugin.default]
                )
            } else {
                // 테스트 시에 호출되는 stub 클로져
                let endPointClosure = { (target: T) -> Endpoint in
                    let sampleResponseClosure: () -> EndpointSampleResponse = {
                        EndpointSampleResponse.networkResponse(sampleStatusCode, target.sampleData)
                    }
                    
                    return Endpoint(
                        url: URL(target: target).absoluteString,
                        sampleResponseClosure: sampleResponseClosure,
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers
                    )
                }
                return MoyaProvider<T>(
                    endpointClosure: customEndpointClosure ?? endPointClosure,
                    stubClosure: MoyaProvider.immediatelyStub
                )
            }
        }
}
