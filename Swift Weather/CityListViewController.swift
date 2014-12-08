//
//  CityListViewController.swift
//  Swift Weather
//
//  Created by Bruce Lee on 4/12/14.
//  Copyright (c) 2014 rushjet. All rights reserved.
//

import UIKit

@objc protocol CityListViewControllerDelegate{
    func cityDidSelected(cityKey: String)
}

class CityListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedIndex: Int?
    @IBOutlet weak var delegate: CityListViewControllerDelegate?
    
    var cityList: Dictionary<String, String>{
        return ["beijing": "北京", "shanghai": "上海", "guangzhou": "广州"
            , "shenzhen": "深圳", "hangzhou": "杭州", "suzhou": "苏州"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // IBActoins
    @IBAction func returnCityNameAction(segue: UIStoryboardSegue){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDelegate & Datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cityList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cityListCell = tableView.dequeueReusableCellWithIdentifier("cityCell", forIndexPath: indexPath) as CityListTableViewCell
        cityListCell.cityNameLabel.text = self.cityList.values.array[indexPath.row]
        return cityListCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("did select row \(indexPath.row)")
        
        // set current selected index of city list
        self.selectedIndex = indexPath.row
        if self.selectedIndex != nil && self.delegate != nil {
            var cityKey = self.cityList.keys.array[self.selectedIndex!]
            self.delegate?.cityDidSelected(cityKey)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "backToMain" {
            println("CityListViewController: back to main \(segue.sourceViewController.description) destination: \(segue.destinationViewController.description)")
        }
    }
}
