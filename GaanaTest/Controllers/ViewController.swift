//
//  ViewController.swift
//  GaanaTest
//
//  Created by KingpiN on 27/07/19.
//  Copyright © 2019 KingpiN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var modelData: GaanaResult?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DataStore.shared.createGetRequestForGaanaFeed(parameters: nil, success: { [weak self](modelData) in
            print(modelData)
            self?.modelData = modelData
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }) { (error) in
            print("Something went wrong : \(error.description)")
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelData?.sections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let modelData = modelData, section < modelData.sections.count else { return UIView() }
        let currentSectionName = modelData.sections[section].name
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionHeaderViewCell") as! SectionHeaderViewCell
        cell.lblSectionName.text = currentSectionName ?? "Section Header"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section < (modelData?.sections.count ?? 0) {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstSectionTableViewCell") as? FirstSectionTableViewCell else { return UITableViewCell() }
            cell.trackModel = modelData?.sections[indexPath.section].tracks ?? []
            cell.cvCollection.reloadData()
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SecondSectionTableViewCell") as? SecondSectionTableViewCell else { return UITableViewCell() }
            cell.trackModel = modelData?.sections[indexPath.section].tracks ?? []
            cell.cvCollection.reloadData()
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdSectionTableViewCell") as? ThirdSectionTableViewCell else { return UITableViewCell() }
            cell.trackModel = modelData?.sections[indexPath.section].tracks ?? []
            cell.cvCollection.reloadData()
            return cell
        } else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FourthSectionTableViewCell") as? FourthSectionTableViewCell else { return UITableViewCell() }
            cell.trackModel = modelData?.sections[indexPath.section].tracks ?? []
            cell.cvCollection.reloadData()
            return cell
        } else if indexPath.section == 4 {
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 212
        } else if indexPath.section == 1 {
            return 120
        } else if indexPath.section == 2 {
            return 212
        } else if indexPath.section == 3 {
            return 156
        } else if indexPath.section == 4 {
            
        }
        return UITableView.automaticDimension
    }
}
