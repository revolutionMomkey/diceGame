//
//  ViewController.swift
//  diceGame
//
//  Created by 杜俊楠 on 2022/10/18.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dataSourceArray = ["骰子游戏","神奇魔力8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        setData()
    }
}

extension ViewController {
    
    func setUI() {
        lazy var tableView: UITableView = {
            let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
            tableView.delegate = self;
            tableView.dataSource = self;
            tableView.tableFooterView = UIView()
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            return tableView
        }()
        
        
        self.view.addSubview(tableView)
    }
    
    func setData() {
        
    }
    
}


extension ViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = dataSourceArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc = DiceGameVC()
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = MagicEightGameVC()
            self.navigationController?.pushViewController(vc, animated: true)
        default: break
            
        }
    }
    
    
}

