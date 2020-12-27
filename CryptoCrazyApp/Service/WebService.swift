//
//  WebService.swift
//  CryptoCrazyApp
//
//  Created by owner on 12/20/20.
//

import Foundation

//5
class WebService {
    //escaping closuredan escape kullanarak func tamamlandiktan sonra cagrilan ve arguman yollayabildigimiz func.gercekten tamamlanmasini bekliyorsak sonunda birsey dondurmek istiyorsak...veri indirkten sonra sonucu gormek istiyorsak ve kendimiz dondurmek istiyorsak.veri ile calisirken dondurme islemi yapacaksak escape kullanacagim.incelikle ne datasi dondureceginin datasi yaz...biz cryptocurrency datasi donduruecegiz. bize gelen dizi icinde binlerce data var. bir adet currency olsaydi parantez icine almaya gerek yoktu dizi seklinde.
    //6
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) ->()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription) //hata varsa nil ver
                completion(nil) //hata varsa nil seklinde verdik yoksa asagida cryptolistiverdik
            } else if let data = data { //datayi aldiktan sonra direk datayi verebiliriz
                //datayi nasil alcaz?
                //7 json formatindaki veriyi islemeye yardimci olan sinif.hangi datadan cekecgini soruyor
                let cryptolist = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                //completion(cryptolist)
                print(cryptolist)
                if let cryptolist = cryptolist {
                    completion(cryptolist)
                }
            }
        }.resume() //8
        
    }
    
    
    
    
}
