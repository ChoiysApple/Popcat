//
//  DeveloperInfoViewController.swift
//  Popcat
//
//  Created by Daegeon Choi on 2021/06/16.
//

import UIKit

class DeveloperInfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
}

extension DeveloperInfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DeveloperInfoSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: Identifier.DeveloperPageCell)
        guard let section = DeveloperInfoSection(rawValue: indexPath.row) else { return UITableViewCell() }
        
        cell.textLabel?.text = section.title
        cell.detailTextLabel?.text = section.subtitle
        cell.imageView?.image = UIImage(named: section.imageSourceName)
        cell.imageView?.layer.cornerRadius = 13
        cell.imageView?.layer.masksToBounds = true
        
        return cell
    }
    
}

extension DeveloperInfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let section = DeveloperInfoSection(rawValue: indexPath.row) else { return }
        
        if let url = URL(string: section.pageURL) {
            UIApplication.shared.open(url)
        }
        
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
}
