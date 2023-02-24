//
//  Model.swift
//  Maple
//
//  Created by 성제 on 2023/01/10.
//

import Foundation

struct CubeHistoryResponseDTO : Codable {
    let count : Int
    let cube_histories : [CubeHistoryDTO]?
    let next_cursor : String
}

struct CubeHistoryDTO : Codable,Hashable {
    let id : String
    let character_name : String
    let create_date : String
    let cube_type : String
    let item_upgrade_result : String
    let miracle_time_flag : String
    let item_equip_part : String
    let item_level : Int
    let target_item : String
    let potential_option_grade : String
    let additional_potential_option_grade : String
    let before_potential_options : [CubeResultOptionDTO]
    let before_additional_potential_options: [CubeResultOptionDTO]?
    let after_potential_options : [CubeResultOptionDTO]
}

struct CubeResultOptionDTO : Codable,Hashable {
    let value : String
    let grade : String
}

