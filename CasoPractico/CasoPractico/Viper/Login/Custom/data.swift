//
//  data.swift
//  CasoPractico
//
//  Created by Joseph Antonio Garcia Hernandez on 04/12/23.
//

import Foundation

enum StringOrInt {
    case string(String)
    case int(Int)
}

struct root: Decodable {
    let results : [results]
}

struct results: Decodable {
    let gender: String?
    let name: name?
    let location: location?
    let email: String?
    let login: login?
    let dob: dob?
    let registered: registered?
    let phone : String?
    let cell : String?
    let id : id?
    let picture : picture?
    let nat : String?
}

struct name : Decodable {

    let title : String?
    let first : String?
    let last : String?

}

struct street : Decodable {
    let number : Int?
    let name : String?
}

struct coordinates : Decodable {
    let latitude : String?
    let longitude : String?
}

struct timezone : Decodable {
    let offset : String?
    let description : String?
}

struct location : Decodable {
    let street : street?
    let city : String?
    let state : String?
    let country : String?
    let postcode : MetadataType?
    let coordinates : coordinates?
    let timezone : timezone?
}

struct login : Decodable {
    let uuid : String?
    let username : String?
    let password : String?
    let salt : String?
    let md5 : String?
    let sha1 : String?
    let sha256 : String?
}

struct dob : Decodable {
    let date : String?
    let age : Int?
}

struct registered : Decodable {
    let date : String?
    let age : Int?
}

struct id : Decodable {
    let name : String?
    let value : String?
}

struct picture : Decodable {
    let large : String?
    let medium : String?
    let thumbnail : String?
}


enum MetadataType: Codable {
  case int(Int)
  case string(String)

  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    do {
      self = try .int(container.decode(Int.self))
    } catch DecodingError.typeMismatch {
      do {
        self = try .string(container.decode(String.self))
      } catch DecodingError.typeMismatch {
        throw DecodingError.typeMismatch(MetadataType.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: ""))
      }
    }
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    switch self {
    case .int(let int):
      try container.encode(int)
    case .string(let string):
      try container.encode(string)
    }
  }
}
