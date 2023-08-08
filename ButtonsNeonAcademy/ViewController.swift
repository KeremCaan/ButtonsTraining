//
//  ViewController.swift
//  NeonAcademyButton
//
//  Created by Kerem Caan on 30.07.2023.
//

import UIKit
import SnapKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    let box : UIView = UIView()
    let specialsButton : UIButton = UIButton()
    let menuButton : UIButton = UIButton()
    let thirdButton : UIButton = UIButton()
    let fourthButton : UIButton = UIButton()
    let disappearingButton: UIButton = UIButton()
    let robberyButton: UIButton = UIButton()
    
    var stateOfButton = true
    let image = UIImage(named: "robber")

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func getSpecials() {
        print("Today's specials are:\nMeat with curry sauce\nBeer made by Pinkertons")
    }
    
    @objc func blacksmithButton() {
        stateOfButton = !stateOfButton
        disappearingButton.isHidden = stateOfButton
    }
    
    func addMenuItems() -> UIMenu {
        let menuItems = UIMenu(title: "", options: .displayInline, children: [
            UIAction(title: "Call for backup", image: UIImage(systemName: "heart"), handler: { _ in
            print("çalıştı")
        }),
            UIAction(title: "Let townies know about the incident.", image: UIImage(systemName: "heart"), handler: { _ in
            print("çalıştı")
        })])
        return menuItems
    }
    
    @objc func whenPressed() {
        thirdButton.backgroundColor = .yellow
    }
    @objc func whenReleased() {
        thirdButton.backgroundColor = .purple
    }
    
    @objc func robberyStarted() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: view.center.x - 5, y: view.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: view.center.x + 5, y: view.center.y))
        view.layer.add(animation, forKey: "position")
        robberyButton.setImage(image, for: .normal)
        let url = Bundle.main.url(forResource: "a1", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func configureUI(){

        
        view.addSubview(box)
        box.backgroundColor = .white
        box.translatesAutoresizingMaskIntoConstraints = false
        box.snp.makeConstraints { make in
            make.width.equalTo(view)
            make.height.equalTo(view)
            make.center.equalTo(view.snp.center)
        }
        
        view.addSubview(menuButton)
        menuButton.setTitle("Select an action.", for: .normal)
        menuButton.titleLabel?.numberOfLines = 0
        menuButton.setTitleColor(.white, for: .normal)
        menuButton.backgroundColor = .black
        menuButton.addAction(UIAction(title: "", handler: { _ in
            print("çalıştı")
        }), for: .touchDown)
        menuButton.menu = addMenuItems()
        menuButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        view.addSubview(fourthButton)
        fourthButton.setTitle("Blacksmith", for: .normal)
        fourthButton.setTitleColor(.white, for: .normal)
        fourthButton.backgroundColor = .black
        fourthButton.addTarget(self, action: #selector(blacksmithButton), for: .touchUpInside)
        fourthButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(600)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        view.addSubview(robberyButton)
        robberyButton.setTitle("Robbery", for: .normal)
        robberyButton.setTitleColor(.white, for: .normal)
        robberyButton.backgroundColor = .black
        robberyButton.addTarget(self, action: #selector(robberyStarted), for: .touchUpInside)
        robberyButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(750)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        view.addSubview(disappearingButton)
        disappearingButton.setTitle("Button", for: .normal)
        disappearingButton.setTitleColor(.white, for: .normal)
        disappearingButton.backgroundColor = .black
        disappearingButton.isHidden = true
        disappearingButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(600)
            make.centerX.equalTo(350)
            make.height.width.equalTo(100)
        }
        
        view.addSubview(specialsButton)
        specialsButton.setTitle("Specials", for: .normal)
        specialsButton.setTitleColor(.white, for: .normal)
        specialsButton.backgroundColor = .black
        specialsButton.addTarget(self, action: #selector(getSpecials), for: .touchUpInside)
        specialsButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(300)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        view.addSubview(thirdButton)
        thirdButton.setTitle("Press and hold", for: .normal)
        thirdButton.setTitleColor(.white, for: .normal)
        thirdButton.titleLabel?.numberOfLines = 0
        thirdButton.backgroundColor = .purple
        thirdButton.addTarget(self, action: #selector(whenPressed), for: .touchDown)
        thirdButton.addTarget(self, action: #selector(whenReleased), for: .touchUpInside)
        thirdButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(450)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
    }


}




