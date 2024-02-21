//
//  CameraViewController.swift
//  TrashDareThere
//
//  Created by BoMin Lee on 2/20/24.
//

import UIKit

class CameraViewController: UIViewController {
    private var topView: UIView = {
        let view = UIView()
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
    
    private var beforeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TDTImageCollection.before
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private var afterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TDTImageCollection.after
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private var bottomView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var leftArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(TDTImageCollection.leftArrowImage, for: .normal)
        button.addTarget(self, action: #selector(showInformationViewController), for: .touchUpInside)
        return button
    }()
    
    private var currentTabImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TDTImageCollection.camera
        return imageView
    }()
    
    private lazy var rightArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(TDTImageCollection.rightArrowImage, for: .normal)
        button.addTarget(self, action: #selector(showMainViewController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        makeConstraint()
    }
    
    private func configure() {
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(levelView)
        view.addSubview(beforeImageView)
        view.addSubview(afterImageView)
        view.addSubview(bottomView)
        
        levelView.addSubview(levelImageView)
        
                
        bottomView.addSubview(leftArrowButton)
        bottomView.addSubview(rightArrowButton)
        bottomView.addSubview(currentTabImageView)
    }
    
    private func makeConstraint() {
        levelView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(64)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.height.equalTo(54)
        }
        
        levelImageView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
        }
        
        beforeImageView.snp.makeConstraints{ make in
            make.top.equalTo(levelView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(250)
        }
        
        afterImageView.snp.makeConstraints{ make in
            make.top.equalTo(beforeImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(250)
        }
        
        bottomView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view)
            make.height.equalTo(150)
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
    
    @objc func showInformationViewController() {
        let informationViewController = InformationViewController()
        informationViewController.modalPresentationStyle = .fullScreen
        self.present(informationViewController, animated: false)
    }
    
    @objc func showMainViewController() {
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: false)
    }
}
