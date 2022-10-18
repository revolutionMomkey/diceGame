//
//  MagicEightGameVC.swift
//  DiceeLogo
//
//  Created by 杜俊楠 on 2022/10/18.
//
let ScreenMId = UIScreen.main.bounds.width/2


import UIKit

class MagicEightGameVC: UIViewController {

    let backgroundImg: UIImageView = {
        let background = UIImageView(frame: UIScreen.main.bounds)
        background.image = UIImage.init(named: "newBackground")
        return background
    }()
    
    let contentLab: UILabel = {
        let lab = UILabel(frame: CGRect(x: 0, y: 0, width: 180, height: 40))
        lab.center = CGPoint(x: ScreenMId, y: 160)
        lab.textAlignment = .center
        lab.textColor = .white
        lab.text = "请问出你心中的困惑"
        lab.font = .boldSystemFont(ofSize: 22)
        lab.adjustsFontSizeToFitWidth = true
        return lab
    }()
    
    lazy var magicImgView: UIImageView = UIImageView()
    lazy var askBtn: UIButton = UIButton()
    
    var imageDataSource = [String]()
    var isReadyToAsk: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
    }
}

extension MagicEightGameVC {
    
    func setUI() {
        self.title = "神奇魔力8"
        self.view.addSubview(backgroundImg)
        self.view.addSubview(contentLab)
        
        self.magicImgView = {
            let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 270))
            imgView.center = CGPoint(x: ScreenMId, y: UIScreen.main.bounds.height/2)
            imgView.image = UIImage.init(named: "magicDef")
            imgView.contentMode = .scaleAspectFill
            return imgView
        }()
        self.view.addSubview(self.magicImgView)
        
        self.askBtn = {
            let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 220, height: 60))
            btn.center = CGPoint(x: ScreenMId, y: 700)
            btn.backgroundColor = UIColor.lightGray
            btn.layer.cornerRadius = 5
            btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
            btn.setTitle("我需要一个答案", for: .normal)
            btn.setTitleColor(.white, for: .normal)
            return btn
        }()
        self.view.addSubview(self.askBtn)
    }
    
    
    func setData()  {
        for index in 1...15 {
            let str: String = "ball"+"\(index)"
            self.imageDataSource.append(str)
        }
    }
}

extension MagicEightGameVC {
    
    @objc func btnAction() {
        magicGame()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        magicGame()
    }
    
    func magicGame() {
        if isReadyToAsk {
            self.magicImgView.image = UIImage.init(named: self.imageDataSource[Int(arc4random_uniform(6))])
            self.askBtn.setTitle("我又产生了一个困惑", for: .normal)
            self.contentLab.text = "不知答案是否让你释然"
            isReadyToAsk.toggle()
        }
        else {
            self.magicImgView.image = UIImage.init(named: "magicDef")
            self.askBtn.setTitle("我需要一个答案", for: .normal)
            self.contentLab.text = "请问出你心中的困惑"
            isReadyToAsk.toggle()
        }
    }
    
}
