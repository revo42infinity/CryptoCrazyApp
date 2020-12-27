//
//  ViewController.swift
//  CryptoCrazyApp
//
//  Created by owner on 12/20/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    //18
    private var cryptoListViewModel : CryptoListViewModel!
    
    //30
    var colorArray = [UIColor]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //1
        tableView.delegate = self
        tableView.dataSource = self
        //31 ornek olarak 6 tanesi icin yaptik
        self.colorArray = [
            UIColor(red: 50/255, green: 100/255, blue: 111/255, alpha: 1.0),
            UIColor(red: 75/255, green: 140/255, blue: 123/255, alpha: 1.0),
            UIColor(red: 100/255, green: 160/255, blue: 134/255, alpha: 1.0),
            UIColor(red: 125/255, green: 170/255, blue: 156/255, alpha: 1.0),
            UIColor(red: 150/255, green: 180/255, blue: 167/255, alpha: 1.0),
            UIColor(red: 175/255, green: 190/255, blue: 169/255, alpha: 1.0),
        ]
        
        
        getData()
        
        //26
        let myString = "ddd"
        myString.printMyName()
        
       //19. kodda asagiyi aldik baska yere yazdik o yuzden inaktif ettim
       /* //9
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        //10 webservice cagiralim
        WebService().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                
                //19
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                
            }
        }
        
   */
        
        
        
    }
    //19 buraya yapistirdik
    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        //10 webservice cagiralim
        WebService().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                
                //19
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                //21 tableview reloaddata calistirmak lazim.internetten indilirelecegi icin dispatchqueue
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    

    //2
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 10
        //22 actiginda app cokmemesi icin varmi yokmu dondurelim once...nil ise 0 ver yoksa numberofrows
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
        
        
    }//3
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        
        //20 her cell icin yeni cryptoviewmodel olusturulacak sonra name ve price lari bagladik
       let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
       cell.priceLabel.text = cryptoViewModel.price
       cell.currencyLabel.text = cryptoViewModel.name
        
        //32 31 den sonra burayi yeniden yazdik
        //29 renk degistirmek cellde
        //cell.backgroundColor = UIColor(red: 100/255, green: 150/255, blue: 170/255, alpha: 1.0)
        //32
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        //indexpathde cokebilir cunku cok fazla color var. 6 tane den cok fazla sey isteyecek. o yuzden ne gelirse gelsin 6 ya bol ve kalanini yazdir diyoruz
        
        //3
        return cell
    }
}

