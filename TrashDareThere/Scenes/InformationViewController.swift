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
        view.backgroundColor = .gray
        return view
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
                                    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubviews()
        makeConstraint()
    }
    
    private func configure() {
        
    }
    
    private func addSubviews() {
        view.addSubview(levelView)
        view.addSubview(bottomView)
        
        bottomView.addSubview(leftArrowButton)
    }
    
    private func makeConstraint() {
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
        
        leftArrowButton.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
    }
    
    @objc func showMainViewController() {
        let mainViewController = MainViewController()
        mainViewController.modalPresentationStyle = .fullScreen
        self.present(mainViewController, animated: false)
    }
}
