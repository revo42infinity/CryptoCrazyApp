//
//  CryptoCurrency.swift
//  CryptoCrazyApp
//
//  Created by owner on 12/20/20.
//

import Foundation

//4 uzun koddaki currency ve price isimleri ile ayni yapmam lazim.apiden cekilecek olanlar...decodable internneten cekilenleri decodable yapmak.encodable kod yollarken datayi encode edebilirim...birde codable...model yaparken hem get hem post islemleri yaparken lazim
struct CryptoCurrency : Decodable {
    let currency : String
    let price : String
}
