//
//  Photos.swift
//  FlickerClientApp
//
//  Created by AHMET HAKAN YILDIRIM on 25.10.2022.
//

import Foundation

struct Photos : Codable{
  let page: Int?
  let pages: Int?
  let perpage: Int?
  let total: Int?
  let photo: [Photo]?
}
