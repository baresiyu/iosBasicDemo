//
//  PersonDAO.swift
//  iOSBasicDemo
//
//  Created by Franz Yu on 12/11/2021.
//  Copyright © 2021 Franz Yu. All rights reserved.
//

import Foundation

//please study the diff between struct and class
struct PersonDAO: Hashable {
    var name: String?
    var photo: String?
    var phoneNumber: String?
   
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(photo)
        hasher.combine(phoneNumber)
    }
}

struct PersonListDAO: Hashable {
    var status: Status?
    var personList: [PersonDAO]?
   
    func hash(into hasher: inout Hasher) {
        hasher.combine(status)
        hasher.combine(personList)
    }
}

enum Status: Equatable, Hashable {
    case OnDuty(statusName:String, personList:[PersonDAO])
    case OnLeave(statusName:String, personList:[PersonDAO])
    case Others(statusName:String, personList:[PersonDAO])
}
