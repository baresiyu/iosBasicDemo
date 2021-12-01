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
    
//    var tableView: UITableView?
    @IBOutlet weak var tableView: UITableView!
    
    //DONE - FIXME: [*]create a cuntom object(PersonDAO) with enum instead of Dictionary
    //var list: [String : [PersonDAO]] = [:]
    var list: [Status] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //when this VC have nav, it can set title
        self.title = "aOS Developer Samuel is here!!!"

        //DONE - FIXME: create this tableView in xib file
        //you can change the section header behavior by edit "style"
//        let tableView = UITableView(
//            frame: CGRect(
//                x: 0, //start from x
//                y: 0, //start from y
//                width: UIScreen.main.bounds.width,
//                height: UIScreen.main.bounds.height
//            ),
//            style: .plain
//            //.plain has sticky section header
//            //.grouped has non-sticky section header
//        )
        
        //tableView NEED this two protocol
        tableView.dataSource = self //cell data
        tableView.delegate = self //ui width height & click listener
        
        //no need to addSubView since xib already has
//        self.view.addSubview(tableView)
//        self.tableView = tableView
        
        //tableView NEED register any cell you want to use
        tableView.register(
            UINib(nibName: "CustomTableViewCell", bundle: nil),
            forCellReuseIdentifier: kCellId
        )
        
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
        
        
        tableView.separatorStyle = .singleLine
        // 是否可以點選 cell
        tableView.allowsSelection = true
        // 是否可以多選 cell
        tableView.allowsMultipleSelection = true
        
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
//        let list = ["OnDuty" : ["Samuel", "Denny", "Jacky", "Cynthia"],
//                    "Leave" : ["Jonathan", "Wendy", "Kit", "Kelvin"],
//                    "Other" : ["Polly","Kennix","Esther","John","JIRA","TENET"]]

        //person
        let samuel = PersonDAO(name: "Samuel", photo: "Samuel.jpg", phoneNumber: "12345678")
        let denny = PersonDAO(name: "Denny", photo: nil, phoneNumber: "43532413")
        let jacky = PersonDAO(name: "Jacky", photo: "Jacky.jpg", phoneNumber: nil)
        let cynthia = PersonDAO(name: nil, photo: "Cynthia.jpg", phoneNumber: "58764512")
        
        let jonathan = PersonDAO(name: "Jonathan", photo: "Jonathan.jpg", phoneNumber: "35634234")
        let wendy = PersonDAO(name: "Wendy", photo: "Wendy.jpg", phoneNumber: "32451224")
        let kit = PersonDAO(name: "Kit", photo: "Kit.jpg", phoneNumber: "763452347")
        let kelvin = PersonDAO(name: "Kelvin", photo: "Kelvin.jpg", phoneNumber: "98124354")
        
        let polly = PersonDAO(name: "Polly", photo: "Polly.jpg", phoneNumber: "4656535")
        let kennix = PersonDAO(name: "Kennix", photo: "Kennix.jpg", phoneNumber: "34523414")
        
        //status
        let onDuty = Status.OnDuty(statusName: "On Duty", personList:[samuel, denny, jacky, cynthia])
        let leave =  Status.OnLeave(statusName: "On Leave", personList: [jonathan, wendy, kit, kelvin])
        let Other = Status.Others(statusName: "Other", personList: [polly, kennix])
        
        let personList = [onDuty, leave, Other]
        self.list = personList
        
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
        
        switch self.list[section]{
            case .OnDuty(statusName: _, personList: let personList):
                return personList.count
            case .OnLeave(statusName: _, personList: let personList):
                return personList.count
        case .Others(statusName: _, personList: let personList):
                return personList.count
        }
        
        
//        let sectionKeys = Array(self.list.keys)[section]
//        guard let nameList = self.list[sectionKeys] else { return 0 }
//        return nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //prepare cell view
        let cell = tableView.dequeueReusableCell(withIdentifier: "kCellId") as! CustomTableViewCell
        
        //prepare data
        switch self.list[indexPath.section]{
        case .OnDuty(statusName: _, personList: let personList):
                let person: PersonDAO = personList[indexPath.row]
                let name = person.name ?? "nil name"
                let phoneNumber = person.phoneNumber ?? "nil number"
                let photo = person.photo ?? "nil image"
                cell.configCell(name: name, number: phoneNumber, photo: photo)
        case .OnLeave(statusName: _, personList: let personList):
                let person: PersonDAO = personList[indexPath.row]
                let name = person.name ?? "nil name"
                let phoneNumber = person.phoneNumber ?? "nil number"
                let photo = person.photo ?? "nil image"
                cell.configCell(name: name, number: phoneNumber, photo: photo)
        case .Others(statusName: _, personList: let personList):
                let person: PersonDAO = personList[indexPath.row]
                let name = person.name ?? "nil name"
                let phoneNumber = person.phoneNumber ?? "nil number"
                let photo = person.photo ?? "nil image"
                cell.configCell(name: name, number: phoneNumber, photo: photo)
        }
        
//        let sectionKeys = Array(list.keys)[indexPath.section]
//        if let nameList = self.list[sectionKeys] {
//            let person = nameList[indexPath.row]
//            let name = person.name ?? "nil name"
//            let phoneNumber = person.phoneNumber ?? "nil number"
//            let photo = person.photo ?? "nil image"
//
//            cell.configCell(name: name, number: phoneNumber, photo: photo)
//        }
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
        
        //label.text = Array(self.list.keys)[section]
        switch self.list[section]{
        case .OnDuty(statusName: let statusName, personList: _):
                label.text = statusName
        case .OnLeave(statusName: let statusName, personList: _):
                label.text = statusName
        case .Others(statusName: let statusName, personList: _):
                label.text = statusName
        }
        
        
        label.textAlignment = .center
        label.textColor = .yellow
        label.backgroundColor = .black
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let status = self.list[indexPath.section]
        
        var name = ""
        var number = ""
        var photo = ""
        
        switch status{
        case .OnDuty(statusName: _, personList: let personList):
            let person = personList[indexPath.row]
            name = person.name ?? "nil name"
            number = person.phoneNumber ?? "nil number"
            photo = person.photo ?? "nil image"
        case .OnLeave(statusName: _, personList: let personList):
            let person = personList[indexPath.row]
            name = person.name ?? "nil name"
            number = person.phoneNumber ?? "nil number"
            photo = person.photo ?? "nil image"
        case .Others(statusName: _, personList: let personList):
            let person = personList[indexPath.row]
            name = person.name ?? "nil name"
            number = person.phoneNumber ?? "nil number"
            photo = person.photo ?? "nil image"
        }
        
        promptAlert(
            title: "clicked OnDuty",
            message: "I am \(name) and my number is \(number) and my photo is \(photo)"
        )
    }
    
    func promptAlert(title:String, message: String){
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Oh", style: UIAlertAction.Style.default, handler: { _ in
            //handle click action here
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
