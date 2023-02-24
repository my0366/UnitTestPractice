//
//  UserDefaultsRepository.swift
//  Maple
//
//  Created by 성제 on 2023/01/10.
//

import Foundation

struct UserDefaultsRepository {
    static func saveSecretKey(value: String) {
        UserDefaults.standard.set(value, forKey: UserDefaultsKeys.secretKey.rawValue)
    }

    static var returnSecretKey: String {
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.secretKey.rawValue) ?? ""
    }

}
