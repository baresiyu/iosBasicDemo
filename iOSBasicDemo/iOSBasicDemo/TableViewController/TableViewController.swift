//
//  TableViewController.swift
//  iOSBasicDemo
//
//  Created by Franz Yu on 11/11/2021.
//  Copyright © 2021 Franz Yu. All rights reserved.
//

import UIKit

let kCellId: String = "kCellId"
let KSectionViewHeight: CGFloat = 100

class TableViewController: UIViewController {
    
    var tableView: UITableView?
    //FIXME: [*]create a cuntom object(PersonDAO) with enum instead of Dictionary
    var list: [String : [String]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //when this VC have nav, it can set title
        self.title = "aOS Developer"

        //FIXME: create this tableView in xib file
        //you can change the section header behavior by edit "style"
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
        //tableView NEED this two protocol
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        self.tableView = tableView
        
        //tableView NEED register any cell you want to use
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: kCellId)
        
        //FIXME: try to set frame using constriant
        //FIXME: try to create a new custom view file instead of UIView
        let tableViewHeader = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
        //here is a example of image asset
        imageView.image = UIImage(named: "aOS_logo")
        //scaleAspectFit mean image will auto scale to fix the iamgeView frame
        imageView.contentMode = .scaleAspectFit
        tableViewHeader.addSubview(imageView)
        //tableHeaderView is set in here
        tableView.tableHeaderView = imageView
        
        //simulate call api
        self.callApi()
    }
    
}

//MARK: API
extension TableViewController {
    func callApi() {
        //simulate after call api
        self.afterCallApi()
    }
    
    func afterCallApi() {
        //FIXME: [*]create a cuntom object(PersonDAO) with enum instead of Dictionary
        let list = ["OnDuty" : ["Samuel", "Denny", "Jacky", "Cynthia"],
                    "Leave" : ["Jonathan", "Wendy", "Kit", "Kelvin"],
                    "Other" : ["Polly","Kennix","Esther","John","JIRA","TENET"]]
        self.list = list
        //a important function of tableview, it will redisplays visible rows, and update all data that you set in UITableViewDataSource/UITableViewDelegate. Ensure call this when got the success result when using async func (i.e. API)
        self.tableView?.reloadData()
    }
}

//MARK: UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionKeys = Array(self.list.keys)[section]
        guard let nameList = self.list[sectionKeys] else { return 0 }
        return nameList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kCellId") as! CustomTableViewCell
        let sectionKeys = Array(list.keys)[indexPath.section]
        if let nameList = self.list[sectionKeys] {
            cell.configCell(name: nameList[indexPath.row])
        }
        return cell
    }
}

//MARK: UITableViewDelegate
extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //automaticDimension is IMPORTANT, xcode will auto calculate the cell height though cell constriant, if you set corrent constriant, you got right height
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return KSectionViewHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //FIXME: try to set frame using constriant
        //FIXME: try to create a new custom view file instead of UIView
        let headerView = UIView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: KSectionViewHeight))
        let label = UILabel()
        //FIXME: try to set frame using constriant
        label.frame = CGRect(x: 0, y: 0, width: headerView.frame.width, height: headerView.frame.height)
        label.text = Array(self.list.keys)[section]
        label.textAlignment = .center
        label.textColor = .yellow
        label.backgroundColor = .black
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionKeys = Array(list.keys)[indexPath.section]
        let nameList = self.list[sectionKeys]
        guard let name = nameList?[indexPath.row] else { return }
        let alert = UIAlertController(title: "Hihi", message: "I am \(name)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Oh", style: UIAlertAction.Style.default, handler: { _ in
            //handle click action here
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
