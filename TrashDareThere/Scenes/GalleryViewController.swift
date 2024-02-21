//
//  GalleryViewController.swift
//  TrashDareThere
//
//  Created by BoMin Lee on 2/21/24.
//

import UIKit

class GalleryViewController: UIViewController {
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
    
    private var galleryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = TDTImageCollection.galleryImage
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        view.addSubview(galleryImageView)
        
        levelView.addSubview(levelImageView)
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
        
        galleryImageView.snp.makeConstraints{ make in
            make.top.equalTo(levelView.snp.bottom)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.height.equalTo(180)
        }
    }
}
