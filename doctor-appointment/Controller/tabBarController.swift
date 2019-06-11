//
//  tabBarController.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 27/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

class TabBarController : UITabBarController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let addDoctorViewController = AddDoctorViewController()
        let tableViewController = TableViewController()
//        let addDoctorNavController = UINavigationController(rootViewController: addDoctorViewController)
//        addDoctorNavController.tabBarItem.title = "Add"
//        addDoctorNavController.tabBarItem.image = UIImage(named: "add")?.withRenderingMode(.alwaysOriginal)
//
//        viewControllers = [addDoctorNavController]
        
        addDoctorViewController.tabBarItem = UITabBarItem(title: "Add Doctor", image: UIImage(named: "add")?.withRenderingMode(.alwaysOriginal), tag: 0)
        tableViewController.tabBarItem = UITabBarItem(title: "All Doctors", image: UIImage(named: "all_doctors")?.withRenderingMode(.alwaysOriginal), tag: 0)
        let viewControllerList = [addDoctorViewController, tableViewController]
        self.viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
}


