//
//  ViewController.swift
//  ContainerScrollViewSample
//
//  Created by mogmet on 2019/06/06.
//  Copyright © 2019 mogmet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    private var items = [Date()]
    private let formatter = DateFormatter()
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = "YYYY/MM/DD HH:MM:SS"
        // Do any additional setup after loading the view.
    }

    @IBAction func onTouchAppend(_ sender: Any) {
        items.append(Date())
        tableView.reloadData()
        heightConstraint.constant = tableView.contentSize.height
    }
    
    @IBAction func onTouchDecrease(_ sender: Any) {
        guard items.count > 0 else { return }
        items.removeLast()
        tableView.reloadData()
        heightConstraint.constant = tableView.contentSize.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let item = items[indexPath.row]
        cell.textLabel?.text = formatter.string(from: item)
        return cell
    }
}

