//
//  CryptoViewModel.swift
//  CryptoCrazyApp
//
//  Created by owner on 12/27/20.
//

import Foundation

//11 cryptocurrency i liste halinde tutalim
struct CryptoListViewModel {
    //12 liste halinde tut
    let cryptoCurrencyList : [CryptoCurrency]
    
    //23
    /*
    //23 asagida 16 ve 17 yi extension yazacagimiz icin inaktif ettik
    //16 toplam kac tane cyptocurrency olacagini versin
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    //dizi ile objeyi esitlemek lazim bir yerde.baglamak
    //17 ikisini birbirine bagladik
    func cryptoAtIndex(_ index: Int) -> cryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return cryptoViewModel(cryptoCurrency: crypto)
    }*/
}

//25 ornek
extension String {
    func printMyName() {
        print("Caner")
    }
}
//EXTENSION
//24 extension yaziyoruz ve 23 de inaktif ettigimiz 16 ve 17 yi buraya yaziyoruz.MV model oldugu icin extension yazmak lazim. extension herhangi onceden sinif ya da yapiya eklenti yapma olanagi saglar. kendi deil baska siniflarada yapar stringe mesela
extension CryptoListViewModel {
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    
    func cryptoAtIndex(_ index: Int) -> cryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return cryptoViewModel(cryptoCurrency: crypto)
    }
    
}

//13 ayri view model
struct cryptoViewModel {
    //14 obje olarak
    let cryptoCurrency : CryptoCurrency
    
    //27 extension sonrasi asagi inaktif edip baska yere aldik kodlari
    /*
    //15
    var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String{
        return self.cryptoCurrency.price
    }
 */
    
}
//EXTENSION
//28 extension yaomak icin yukaridan aldik buraya koyduk model icinde extension yaptik. istedigimiz func lari extension ile ekleyebiliyoruz
extension cryptoViewModel {
    var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String{
        return self.cryptoCurrency.price
    }
}
