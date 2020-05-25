//
//  ViewController.swift
//  ProtocolDelegateExercise
//
//  Created by Christoper on 19/05/20.
//  Copyright © 2020 Christoper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    let dataArray = ["bird", "dog", "cat", "turtle", "bear"]
    let dataArrayDesc = ["Desc bird", "Desc dog", "Desc cat", "Desc turtle", "Desc bear"]
    let dataArrayImage = ["at", "be", "de", "el", "fr"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    // MARK: Table View Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the data for this row
        let rowIndex = indexPath.row
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath) as! CountryTableViewCell
        cell.LabelText?.text = dataArray[rowIndex]
        cell.DescriptionText?.text = dataArrayDesc[rowIndex]
        cell.ImagesLandscape?.image = UIImage(named: dataArrayImage[rowIndex])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         // Make the first row larger to accommodate a custom cell.
        if indexPath.row == 0 {
            return 80
         }

         // Use the default size for all other rows.
         return UITableView.automaticDimension
    }

}

