//
//  MainViewController.swift
//  TrashDareThere
//
//  Created by BoMin Lee on 2/8/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private var levelCount = 0
    
    private var topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 177/255, green: 249/255, blue: 254/255, alpha: 1)
        return view
    }()
    
    private var levelView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var levelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TDTImageCollection.levelLow
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var characterView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TDTImageCollection.turtle
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 73/255, green: 147/255, blue: 225/255, alpha: 1)
        return view
    }()
    
    private lazy var leftArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(TDTImageCollection.leftArrowImage, for: .normal)
        button.addTarget(self, action: #selector(showCameraViewController), for: .touchUpInside)
        return button
    }()
    
    private var currentTabImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TDTImageCollection.broom
        return imageView
    }()
    
    private lazy var broomButton: UIButton = {
        let button = UIButton()
        button.setImage(TDTImageCollection.broom, for: .normal)
        button.addTarget(self, action: #selector(broomPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(TDTImageCollection.rightArrowImage, for: .normal)
        button.addTarget(self, action: #selector(showInformationViewController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        makeConstraint()
    }
    
    private func configure() {
        
    }
    
    private func addSubviews() {
        view.addSubview(topView)
        view.addSubview(characterView)
        view.addSubview(bottomView)
        
        topView.addSubview(levelView)
        
        levelView.addSubview(levelImageView)
        
        characterView.addSubview(characterImageView)
        
        bottomView.addSubview(leftArrowButton)
        bottomView.addSubview(rightArrowButton)
        bottomView.addSubview(broomButton)
    }
    
    private func makeConstraint() {
        topView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(view)
            make.height.equalTo(250)
        }
        
        levelView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(64)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.height.equalTo(54)
        }
        
        levelImageView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view)
            make.height.equalTo(150)
        }
        
        characterView.snp.makeConstraints{ make in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(topView.snp.bottom)
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        characterImageView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        broomButton.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
        
        leftArrowButton.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        rightArrowButton.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    @objc func showCameraViewController() {
        let cameraViewController = CameraViewController()
        cameraViewController.modalPresentationStyle = .fullScreen
        self.present(cameraViewController, animated: false)
    }
    
    @objc func showInformationViewController() {
        let informationViewController = InformationViewController()
        informationViewController.modalPresentationStyle = .fullScreen
        self.present(informationViewController, animated: false)
    }
    
    @objc func broomPressed() {
        if levelCount == 0 {
            self.levelImageView.image = TDTImageCollection.level
            self.characterImageView.image = TDTImageCollection.turtleClean
            self.levelCount += 1
        } else if levelCount == 1 {
            self.levelImageView.image = TDTImageCollection.levelHigh
            self.characterImageView.image = TDTImageCollection.turtleCleaner
            self.levelCount += 1
        } else if levelCount == 2 {
            self.levelImageView.image = TDTImageCollection.levelLow
            self.characterImageView.image = TDTImageCollection.turtle
            self.levelCount = 0
        }
    }
}
