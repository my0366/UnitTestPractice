//
//  API.swift
//  Maple
//
//  Created by 성제 on 2023/01/11.
//

import Foundation
import Moya

enum CubeHistoryAPI {
    case fetchCubeHistory(date : String, count : Int)
}

extension CubeHistoryAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://public.api.nexon.com/openapi/maplestory")!
    }
    
    var path: String {
        switch self {
        case .fetchCubeHistory:
            return "/v1/cube-use-results"
        }
    }
    
    var task: Task {
        switch self {
        case .fetchCubeHistory(let date, let count):
            let params = ["date": date,
                          "count": count] as [String : Any]

            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchCubeHistory:
            return ["Authorization": UserDefaultsRepository.returnSecretKey]
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchCubeHistory:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .fetchCubeHistory:
            return Data(
                                    """
                                    {
                                        "count": 10,
                                        "cube_histories": [
                                            {
                                                "id": "Qz0lKQ4j8JG3GOfTs1qgFcRy",
                                                "character_name": "탐욕의발",
                                                "create_date": "2022-12-28T11:44:21+09:00",
                                                "cube_type": "카르마 장인의 큐브",
                                                "item_upgrade_result": "실패",
                                                "miracle_time_flag": "이벤트 적용되지 않음",
                                                "item_equip_part": "반지",
                                                "item_level": 120,
                                                "target_item": "이터널 플레임 링",
                                                "potential_option_grade": "유니크",
                                                "additional_potential_option_grade": "노멀",
                                                "before_potential_options": [
                                                    {
                                                        "value": "최대 HP : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "최대 MP : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "STR : +9%",
                                                        "grade": "유니크"
                                                    }
                                                ],
                                                "before_additional_potential_options": [],
                                                "after_potential_options": [
                                                    {
                                                        "value": "올스탯 : +6%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "STR : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "방어력 : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "after_additional_potential_options": []
                                            },
                                            {
                                                "id": "Qz0lKQ4j8JG3GOfTs1qgFGHZ",
                                                "character_name": "탐욕의발",
                                                "create_date": "2022-12-28T11:44:19+09:00",
                                                "cube_type": "카르마 장인의 큐브",
                                                "item_upgrade_result": "실패",
                                                "miracle_time_flag": "이벤트 적용되지 않음",
                                                "item_equip_part": "반지",
                                                "item_level": 120,
                                                "target_item": "이터널 플레임 링",
                                                "potential_option_grade": "유니크",
                                                "additional_potential_option_grade": "노멀",
                                                "before_potential_options": [
                                                    {
                                                        "value": "최대 HP : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "최대 MP : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "최대 MP : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "before_additional_potential_options": [],
                                                "after_potential_options": [
                                                    {
                                                        "value": "최대 HP : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "최대 MP : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "STR : +9%",
                                                        "grade": "유니크"
                                                    }
                                                ],
                                                "after_additional_potential_options": []
                                            },
                                            {
                                                "id": "Qz0lKQ4j8JG3G-fTs1qjHa17",
                                                "character_name": "탐욕의발",
                                                "create_date": "2022-12-28T11:44:17+09:00",
                                                "cube_type": "카르마 장인의 큐브",
                                                "item_upgrade_result": "실패",
                                                "miracle_time_flag": "이벤트 적용되지 않음",
                                                "item_equip_part": "반지",
                                                "item_level": 120,
                                                "target_item": "이터널 플레임 링",
                                                "potential_option_grade": "유니크",
                                                "additional_potential_option_grade": "노멀",
                                                "before_potential_options": [
                                                    {
                                                        "value": "DEX : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "방어력 : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "방어력 : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "before_additional_potential_options": [],
                                                "after_potential_options": [
                                                    {
                                                        "value": "최대 HP : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "최대 MP : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "최대 MP : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "after_additional_potential_options": []
                                            },
                                            {
                                                "id": "Qz0lKQ4j8JG3GufTs1qgFCa9",
                                                "character_name": "탐욕의발",
                                                "create_date": "2022-12-28T11:44:16+09:00",
                                                "cube_type": "카르마 장인의 큐브",
                                                "item_upgrade_result": "실패",
                                                "miracle_time_flag": "이벤트 적용되지 않음",
                                                "item_equip_part": "반지",
                                                "item_level": 120,
                                                "target_item": "이터널 플레임 링",
                                                "potential_option_grade": "유니크",
                                                "additional_potential_option_grade": "노멀",
                                                "before_potential_options": [
                                                    {
                                                        "value": "HP 회복 아이템 및 회복 스킬 효율 : +30%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "STR : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "STR : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "before_additional_potential_options": [],
                                                "after_potential_options": [
                                                    {
                                                        "value": "DEX : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "방어력 : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "방어력 : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "after_additional_potential_options": []
                                            },
                                            {
                                                "id": "Qz0lKQ4j8JG3GufTs1qjHcqY",
                                                "character_name": "탐욕의발",
                                                "create_date": "2022-12-28T11:44:13+09:00",
                                                "cube_type": "카르마 장인의 큐브",
                                                "item_upgrade_result": "실패",
                                                "miracle_time_flag": "이벤트 적용되지 않음",
                                                "item_equip_part": "반지",
                                                "item_level": 120,
                                                "target_item": "이터널 플레임 링",
                                                "potential_option_grade": "유니크",
                                                "additional_potential_option_grade": "노멀",
                                                "before_potential_options": [
                                                    {
                                                        "value": "LUK : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "STR : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "최대 MP : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "before_additional_potential_options": [],
                                                "after_potential_options": [
                                                    {
                                                        "value": "HP 회복 아이템 및 회복 스킬 효율 : +30%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "STR : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "STR : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "after_additional_potential_options": []
                                            },
                                            {
                                                "id": "Qz0lKQ4j8JG3G-fTs1qjEAW8",
                                                "character_name": "탐욕의발",
                                                "create_date": "2022-12-28T11:43:54+09:00",
                                                "cube_type": "카르마 장인의 큐브",
                                                "item_upgrade_result": "실패",
                                                "miracle_time_flag": "이벤트 적용되지 않음",
                                                "item_equip_part": "반지",
                                                "item_level": 120,
                                                "target_item": "이터널 플레임 링",
                                                "potential_option_grade": "유니크",
                                                "additional_potential_option_grade": "노멀",
                                                "before_potential_options": [
                                                    {
                                                        "value": "방어력 : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "올스탯 : +3%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "방어력 : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "before_additional_potential_options": [],
                                                "after_potential_options": [
                                                    {
                                                        "value": "LUK : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "STR : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "최대 MP : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "after_additional_potential_options": []
                                            },
                                            {
                                                "id": "Qz0lKQ4j8JG3GOfTs1qjENDb",
                                                "character_name": "탐욕의발",
                                                "create_date": "2022-12-28T11:43:53+09:00",
                                                "cube_type": "카르마 장인의 큐브",
                                                "item_upgrade_result": "실패",
                                                "miracle_time_flag": "이벤트 적용되지 않음",
                                                "item_equip_part": "반지",
                                                "item_level": 120,
                                                "target_item": "이터널 플레임 링",
                                                "potential_option_grade": "유니크",
                                                "additional_potential_option_grade": "노멀",
                                                "before_potential_options": [
                                                    {
                                                        "value": "LUK : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "DEX : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "최대 MP : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "before_additional_potential_options": [],
                                                "after_potential_options": [
                                                    {
                                                        "value": "방어력 : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "올스탯 : +3%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "방어력 : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "after_additional_potential_options": []
                                            },
                                            {
                                                "id": "Qz0lKQ4j8JG3HefTs1qjF2SW",
                                                "character_name": "탐욕의발",
                                                "create_date": "2022-12-28T11:43:51+09:00",
                                                "cube_type": "카르마 장인의 큐브",
                                                "item_upgrade_result": "실패",
                                                "miracle_time_flag": "이벤트 적용되지 않음",
                                                "item_equip_part": "반지",
                                                "item_level": 120,
                                                "target_item": "이터널 플레임 링",
                                                "potential_option_grade": "유니크",
                                                "additional_potential_option_grade": "노멀",
                                                "before_potential_options": [
                                                    {
                                                        "value": "STR : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "최대 HP : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "방어력 : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "before_additional_potential_options": [],
                                                "after_potential_options": [
                                                    {
                                                        "value": "LUK : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "DEX : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "최대 MP : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "after_additional_potential_options": []
                                            },
                                            {
                                                "id": "Qz0lKQ4j8JG3GOfTs1mqE1tG",
                                                "character_name": "탐욕의발",
                                                "create_date": "2022-12-28T11:42:11+09:00",
                                                "cube_type": "카르마 장인의 큐브",
                                                "item_upgrade_result": "실패",
                                                "miracle_time_flag": "이벤트 적용되지 않음",
                                                "item_equip_part": "펜던트",
                                                "item_level": 120,
                                                "target_item": "매커네이터 펜던트",
                                                "potential_option_grade": "유니크",
                                                "additional_potential_option_grade": "노멀",
                                                "before_potential_options": [
                                                    {
                                                        "value": "STR : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "INT : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "LUK : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "before_additional_potential_options": [],
                                                "after_potential_options": [
                                                    {
                                                        "value": "STR : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "STR : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "LUK : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "after_additional_potential_options": []
                                            },
                                            {
                                                "id": "Qz0lKQ4j8JG3G-fTs1mqE-tp",
                                                "character_name": "탐욕의발",
                                                "create_date": "2022-12-28T11:42:09+09:00",
                                                "cube_type": "카르마 장인의 큐브",
                                                "item_upgrade_result": "실패",
                                                "miracle_time_flag": "이벤트 적용되지 않음",
                                                "item_equip_part": "펜던트",
                                                "item_level": 120,
                                                "target_item": "매커네이터 펜던트",
                                                "potential_option_grade": "유니크",
                                                "additional_potential_option_grade": "노멀",
                                                "before_potential_options": [
                                                    {
                                                        "value": "최대 HP : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "최대 MP : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "방어력 : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "before_additional_potential_options": [],
                                                "after_potential_options": [
                                                    {
                                                        "value": "STR : +9%",
                                                        "grade": "유니크"
                                                    },
                                                    {
                                                        "value": "INT : +6%",
                                                        "grade": "에픽"
                                                    },
                                                    {
                                                        "value": "LUK : +6%",
                                                        "grade": "에픽"
                                                    }
                                                ],
                                                "after_additional_potential_options": []
                                            }
                                        ],
                                        "next_cursor": "Qz0lKQ4j8JG3G-fTs1mqE-tpTk3ez0xKzbsFA0BZUzSHT9eiZA=="
                                    }
                                    """.utf8
            )
        }
    }
}
