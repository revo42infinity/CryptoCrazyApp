//
//  ViewController.swift
//  CryptoCrazyApp
//
//  Created by owner on 12/20/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //1
        tableView.delegate = self
        tableView.dataSource = self
        //9
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        //10 webservice cagiralim
        WebService().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                
            }
        }
        
   
    }

    //2
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }//3
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        
        return cell
    }
}

