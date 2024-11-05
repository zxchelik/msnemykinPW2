//
//  WishMakerViewController.swift
//  msnemykinPW2
//
//  Created by Михаил Немыкин on 26.10.2024.
//

import UIKit

class WishMakerViewController: UIViewController {
    // MARK: - Constants
    enum Constants {
        static let stackBottomConstaint: CGFloat = 40
        static let stackLeadingConstaint: CGFloat = 20
        
        static let labelWidth: CGFloat = 85
        static let labelHeight: CGFloat = 30
        static let labelbottomConstaint: CGFloat = 20
        static let labelTrailingConstaint: CGFloat = 10
        
        static let visableToggleConstarint: CGFloat = 20
    }
    // MARK: - Fields
    var colorSelector = CustomColorSelector()
    var colorLabel = CopyableLabel()
    var visableTogle = UISwitch()
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - Private methods
    private func configureUI() {
        view.addSubview(colorSelector)
        view.addSubview(colorLabel)
        view.addSubview(visableTogle)
        
        configureColorSelector()
        configureColorLAbel()
        configureVisibleToggle()
        
        view.backgroundColor = colorSelector.color
    }
    
    private func configureColorSelector() {
        colorSelector.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constants.stackBottomConstaint)
        colorSelector.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor, Constants.stackLeadingConstaint)
        colorSelector.pinCenterX(to: view.safeAreaLayoutGuide.centerXAnchor)
        
        colorSelector.onColorChange = { [weak self] color in
            self?.colorLabel.label.text = self?.colorSelector.hexColor
            self?.view.backgroundColor = color
        }
    }
    
    private func configureColorLAbel() {
        colorLabel.pinBottom(to: colorSelector.topAnchor, Constants.labelbottomConstaint)
        colorLabel.pinRight(to: colorSelector.trailingAnchor, Constants.labelTrailingConstaint)
        
        colorLabel.label.text = colorSelector.hexColor
        
        colorLabel.setWidth(Constants.labelWidth)
        colorLabel.setHeight(Constants.labelHeight)
        colorLabel.layer.cornerRadius = Constants.labelHeight / 2
    }
    
    private func configureVisibleToggle() {
        visableTogle.addTarget(self, action: #selector (onVisableToggleChanged), for: .valueChanged)
        
        visableTogle.isOn = true
        
        visableTogle.pinRight(to: view.safeAreaLayoutGuide.trailingAnchor, Constants.visableToggleConstarint)
        visableTogle.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.visableToggleConstarint)
        
        visableTogle.backgroundColor = .darkGray
        visableTogle.layer.cornerRadius = visableTogle.frame.height / 2
    }
    
    // MARK: - Objc methods
    @objc
    private func onVisableToggleChanged(sender: UISwitch) {
        self.colorSelector.isHidden = !self.colorSelector.isHidden
        self.colorLabel.isHidden = !self.colorLabel.isHidden
    }
}






