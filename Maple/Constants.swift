//
//  Constatns.swift
//  Maple
//
//  Created by 성제 on 2023/01/10.
//

enum Constants {
    static let baseURL = "https://public.api.nexon.com/openapi/maplestory/v1/cube-use-results"
}
import Foundation
//enum MyError : String, Error {
//    case urlNotFound = "url을 찾을 수 없습니다."
//}
enum UserDefaultsKeys : String {
    case secretKey
}

enum ApiError : Error {
    case notfound // 404
    case notAllowed // 405
    case badStatus(_ code: Int) // 400
    case unauthorized // 401
    case badRequest // 400
    case tooLarge // 413
    case tooManyRequest // 425
    case decodingError // errorType
    case timeout
    case forbidden
    case serverError(_ error : ErrorResponse?)
    
    var info : String {
        switch self {
        case .notfound:
            return "컨텐츠가 존재하지 않습니다"
        case .badStatus(let code):
            return "상태 코드 : \(code)"
        case .decodingError:
            return "디코딩 에러입니다"
        case .unauthorized:
            return "인증되지 않은 사용자입니다"
        case .timeout:
            return "요청 시간을 초과했습니다."
        case .tooLarge:
            return "너무 많은 데이터를 요청했습니다."
        case .tooManyRequest:
            return "짧은 시간에 너무 많은 요청이 있습니다. 잠시후에 시도해주세요"
        case .badRequest:
            return "요청 형식에 오류가 있습니다."
        case .serverError(let err):
            return err?.message ?? ""
        case .forbidden:
            return "허용되지 않은 사용자 정보입니다."
        case .notAllowed:
            return "허용되지 않은 요청입니다."
        }
    }
}

struct ErrorResponse: Codable {
    let message: String?
    //    let hey : String
}
