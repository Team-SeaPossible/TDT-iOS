//
//  InformationViewController.swift
//  TrashDareThere
//
//  Created by BoMin Lee on 2/8/24.
//

import UIKit

class InformationViewController: UIViewController {
                                    
    private var levelView: UIView = {
        let view = UIView()
        return view
    }()
    
    private var levelImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TDTImageCollection.levelHigh
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var middleView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.setImage(TDTImageCollection.profile, for: .normal)
        return button
    }()
    
    private lazy var mapButton: UIButton = {
        let button = UIButton()
        button.setImage(TDTImageCollection.map, for: .normal)
        button.addTarget(self, action: #selector(showMapViewController), for: .touchUpInside)
        return button
    }()
    
    private lazy var galleryButton: UIButton = {
        let button = UIButton()
        button.setImage(TDTImageCollection.gallery, for: .normal)
        button.addTarget(self, action: #selector(showGalleryViewController), for: .touchUpInside)
        return button
    }()
    
    private var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var leftArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(TDTImageCollection.leftArrowImage, for: .normal)
        button.addTarget(self, action: #selector(showMainViewController), for: .touchUpInside)
        return button
    }()
    
    private var currentTabImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TDTImageCollection.information
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var rightArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(TDTImageCollection.rightArrowImage, for: .normal)
        button.addTarget(self, action: #selector(showCameraViewController), for: .touchUpInside)
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
        view.addSubview(middleView)
        view.addSubview(bottomView)
        
        levelView.addSubview(levelImageView)
        
        middleView.addSubview(profileButton)
        middleView.addSubview(mapButton)
        middleView.addSubview(galleryButton)
        
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
        
        bottomView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view)
            make.height.equalTo(150)
        }
        
        middleView.snp.makeConstraints{ make in
            make.top.equalTo(levelView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
                
        profileButton.snp.makeConstraints{ make in
            make.width.equalTo(350)
            make.height.equalTo(170)
            make.centerX.top.equalToSuperview()
        }
        
        galleryButton.snp.makeConstraints{ make in
            make.width.equalTo(350)
            make.height.equalTo(170)
            make.centerX.bottom.equalToSuperview()
        }
        
        mapButton.snp.makeConstraints{ make in
            make.width.equalTo(350)
            make.height.equalTo(170)
            make.center.equalToSuperview()
        }
        
        currentTabImageView.snp.makeConstraints{ make in
            make.center.equalToSuperview()
            make.width.height.equalTo(75)
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
    
    @objc func showMainViewController() {
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: false)
    }
    
    @objc func showCameraViewController() {
        let cameraViewController = CameraViewController()
        cameraViewController.modalPresentationStyle = .fullScreen
        self.present(cameraViewController, animated: false)
    }
    
    @objc func showMapViewController() {
        let mapViewController = MapViewController()
//        mapViewController.modalPresentationStyle = .fullScreen
        self.present(mapViewController, animated: false)
    }
    
    @objc func showGalleryViewController() {
        let galleryViewController = GalleryViewController()
//        galleryViewController.modalPresentationStyle = .fullScreen
        self.present(galleryViewController, animated: false)
    }
}
