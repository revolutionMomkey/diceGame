//
//  DiceGameVC.swift
//  DiceeLogo
//
//  Created by 杜俊楠 on 2022/10/14.
//

import UIKit

class DiceGameVC: UIViewController {

    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    var rollTurns: Int = 1
    var imageArray = [String]()
    var imageView1: UIImageView = UIImageView()
    var imageView2: UIImageView = UIImageView()
    var resultLab: UITextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
        setData()
    }
}

extension DiceGameVC {
    
    func setUI() {
        self.title = "骰子游戏"
        
        let backgroundImageView:UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage.init(named: "newBackground")
            imageView.frame = UIScreen.main.bounds
            return imageView
        }()

        self.imageView1 = {
            let view = UIImageView()
            view.frame = CGRect(x: 40, y: 250, width: 120, height: 120)
//            view.backgroundColor = UIColor.red
            view.layer.cornerRadius = 3
            view.clipsToBounds = true
            view.image = UIImage.init(named: "dice1")
            return view
        }()
        
        self.imageView2 = {
            let view = UIImageView()
            view.frame = CGRect(x: 215, y: 250, width: 120, height: 120)
//            view.backgroundColor = UIColor.blue
            view.layer.cornerRadius = 3
            view.clipsToBounds = true
            view.image = UIImage.init(named: "dice1")
            return view
        }()
        
        lazy var button: UIButton = {
            let btn = UIButton()
            btn.frame = CGRect(x:140 , y: 550, width: 100, height: 60)
            btn.layer.cornerRadius = 3
            btn.setTitle("掷骰子", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            btn.backgroundColor = .systemPink
            btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
            return btn
        }()
        
        self.resultLab = {
            let lable = UITextView(frame: CGRect(x: 0, y: 700, width: 300, height: 90))
            lable.center = CGPoint(x: view.frame.midX, y: 735)
            lable.isEditable = false
            lable.backgroundColor = .lightGray
            lable.textColor = .white
            lable.textAlignment = .left
            lable.font = UIFont(name: "GillSans", size: 16.0)
            lable.layer.cornerRadius = 3
            return lable
        }()
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(imageView1)
        self.view.addSubview(imageView2)
        self.view.addSubview(button)
        self.view.addSubview(resultLab)
    }
    
    func setData() {
        imageArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    }
}


extension DiceGameVC {
    
    @objc  func btnAction()  {
        updateDiceData()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceData()
    }
    
    func updateDiceData() {
        print("开roll")
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        print("randomDiceIndex1 = \(randomDiceIndex1) \nrandomDiceIndex2 = \(randomDiceIndex2)")
        
        imageView1.image = UIImage.init(named: imageArray[randomDiceIndex1])
        imageView2.image = UIImage.init(named: imageArray[randomDiceIndex2])
        
        resultLab.text = "第\(rollTurns)次开roll\nleft-Dice = \(randomDiceIndex1)  <---------->  right-Dice = \(randomDiceIndex2)\n".appending(resultLab.text)
        rollTurns+=1
    }
}
