//
//  ViewController.swift
//  doctor-appointment
//
//  Created by Khan hafizur rahman on 25/5/19.
//  Copyright © 2019 Khan hafizur rahman. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

    var tableView = UITableView(frame: .zero)
    var doctors: [DoctorSummary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        layout()
        // Do any additional setup after loading the view, typically from a nib.
        fetchData()
    }
    
    private func setTableView(){
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = UIColor.rgb(r: 124, g: 185, b: 232, a: 1)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func layout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func fetchData() {
        NetworkHelper.shared.fetchData(url: "http://localhost:8080/doctor/get-short-desc",
                                           onSuccess: dataDidFetch(data:),
                                           onFailure: handle(error:))
    }
    
//    private func fetchJsonData() {
//        NetworkHelper.shared.requestFullNameNCategory();
//    }
    
//    private func dataDidFetch(value: String) {
//        self.data = value
//        tableView.reloadData()
//    }
    
    private func dataDidFetch(data: Data) {
        do {
            doctors.removeAll()
            doctors.append(contentsOf: try PayloadParser.shared.getParsedData(data: data, type: [DoctorSummary].self))
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func handle(error: Error) {
        print(error.localizedDescription)
    }

  
    
    private func buttonTapped(cell: CustomTableViewCell, doctor_id: Int64) {
        let nextVc = IndividualDocViewController()
        nextVc.doc_id = doctor_id
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else {
            fatalError("Unable to create cell")
        }
        
        let doctor = doctors[indexPath.row]
        cell.namelbl.text =  doctor.fullName
        cell.doctypelbl.text = doctor.category
        cell.detailsButton.setTitle("Details", for: .normal)
        cell.detailsButton.addAction(for: .touchUpInside) {
            self.buttonTapped(cell: cell, doctor_id: doctor.docId)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122
    }
}

