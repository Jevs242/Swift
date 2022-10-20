//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

extension Double
{
    func round(to places: Int) -> Double
    {
        let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}

protocol CoinManagerDelegate {
    func didUpdateCoin(_ CoinManager: CoinManager, coin: Double)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "C4BD0067-4A5D-47ED-A629-66C709613BC7"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String)
    {
        //Use String concatenation to add the selected currency at the end of the baseURL along with the API Key
        let urlString = "\(baseURL)/\(currency)?apiKey=\(apiKey)"
        //Use optional binding to unwrap the url that's created from the urlString
        if let url = URL(string: urlString)
        {
            //Create a new URLSession object with default configuration
            let session = URLSession(configuration: .default)
            //Create a new data task for the URLSession
            let task = session.dataTask(with: url){(data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                //Format the date we got back as a string to be able to print it.
                //let dataAsString = String(data: data!, encoding: .utf8)
                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCoin(self,coin: coin)
                    }
                }
            }
            //Start task to fetch data from bitcoin average's servers.
            task.resume()
        }
    }
    
    func parseJSON(_ data:Data) -> Double?
    {
        
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(CoinData.self , from:data)
            let rates = decodedData.rate
            return rates.round(to: 2)
        }
        catch{
            delegate?.didFailWithError(error:error)
            return nil
        }
    }
}
