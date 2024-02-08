//
//  MainViewController.swift
//  TrashDareThere
//
//  Created by BoMin Lee on 2/8/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    private var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()
    
    private var levelView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private var characterView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        return view
    }()
    
    private var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private lazy var leftArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(TDTImageCollection.leftArrowImage, for: .normal)
        return button
    }()
    
    private var currentTabImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TDTImageCollection.fish
        return imageView
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
        
        bottomView.addSubview(leftArrowButton)
        bottomView.addSubview(rightArrowButton)
        bottomView.addSubview(currentTabImageView)
    }
    
    private func makeConstraint() {
        topView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(view)
            make.height.equalTo(250)
        }
        
        levelView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(64)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        
        bottomView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view)
            make.height.equalTo(200)
        }
        
        characterView.snp.makeConstraints{ make in
            make.leading.trailing.equalTo(view)
            make.top.equalTo(topView.snp.bottom)
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        currentTabImageView.snp.makeConstraints{ make in
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
        
    }
    
    @objc func showInformationViewController() {
        let informationViewController = InformationViewController()
        informationViewController.modalPresentationStyle = .fullScreen
        self.present(informationViewController, animated: false)
    }
}
