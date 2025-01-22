//
//  CheckBoxView.swift
//  meditation_appUI
//
//  Created by cao duc tin  on 21/1/25.
//

import UIKit

class CheckBoxView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private var isChecked = false {
        didSet{
            updateImage()
        }
    }
    
    var didToggled: ((Bool)-> Void)?
    
    private func setupView(){
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)])
        
        updateImage()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleCheck))
        addGestureRecognizer(tapGesture)
        isUserInteractionEnabled = true
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    @objc private func toggleCheck(){
        isChecked.toggle()
        updateImage()
        didToggled?(isChecked)
    }
    
    private func updateImage(){
        imageView.image = UIImage(systemName: isChecked ? "checkmark.square.fill" : "square")
        imageView.tintColor = .systemBlue
    }
    
    private func setChecked(checked: Bool){
        isChecked = checked
    }
    
    private func getChecked() -> Bool{
        return isChecked
    }
}
