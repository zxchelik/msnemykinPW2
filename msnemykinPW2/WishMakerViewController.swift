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
        static let title: String = "WishMaker"
        static let titleFontSize: CGFloat = 20
        static let titleLeading: CGFloat = 20
        static let titleTop: CGFloat = 20
        
        static let description: String = "This app will bring joy and will fulfill three of your wishes!\n\t - The first wish is to change the background color."
        static let descriptionFontSize: CGFloat = 15
        static let descriptionLeading: CGFloat = 20
        static let descriptionTop: CGFloat = 10
        static let descriptionLabelNumberOfLines: Int = 0
        static let descriptionLabelLineBreakMode: NSLineBreakMode = .byWordWrapping
        
        static let stackBottomConstraint: CGFloat = 40
        static let stackLeadingConstraint: CGFloat = 20
        
        static let labelWidth: CGFloat = 85
        static let labelHeight: CGFloat = 30
        static let labelBottomConstraint: CGFloat = 20
        static let labelTrailingConstraint: CGFloat = 10
        
        static let visibleToggleConstraint: CGFloat = 20
        static let visibleToggleTitle: String = "Visible"
        static let visibleTitelConstraint: CGFloat = 10
        
        static let textViewCornerRadius: CGFloat = 20
        static let textViewBAlpha: CGFloat = 1
        static let textViewHorizontalConstraint: CGFloat = 20
        
        static let backgroundColor: UIColor = .darkGray
        static let borderColor: CGColor = CGColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        static let borderWidth: CGFloat = 2
        static let textColor: UIColor = .white
        
    }
    // MARK: - Fields
    var colorSelector = CustomColorSelector()
    var colorLabel = CopyableLabel()
    var visibleToggle = UISwitch()
    var textView = UIView()
    var titleLabel = UILabel()
    var descriptionLabel = UILabel()
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    // MARK: - Private methods
    private func configureUI() {
        view.backgroundColor = colorSelector.color

        configureColorSelector()
        configureColorLAbel()
        configureTextView()
        configureTitle()
        configureDescription()
        configureVisibleToggle()
    }
    
    private func configureColorSelector() {
        view.addSubview(colorSelector)
        
        colorSelector.backgroundColor = Constants.backgroundColor
        colorSelector.layer.borderWidth = Constants.borderWidth
        colorSelector.layer.borderColor = Constants.borderColor
        
        colorSelector.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constants.stackBottomConstraint)
        colorSelector.pinLeft(to: view.safeAreaLayoutGuide.leadingAnchor, Constants.stackLeadingConstraint)
        colorSelector.pinCenterX(to: view.safeAreaLayoutGuide.centerXAnchor)
        
        colorSelector.onColorChange = { [weak self] color in
            self?.colorLabel.label.text = self?.colorSelector.hexColor
            self?.view.backgroundColor = color
        }
    }
    
    private func configureColorLAbel() {
        view.addSubview(colorLabel)
        
        colorLabel.backgroundColor = Constants.backgroundColor
        colorLabel.layer.borderWidth = Constants.borderWidth
        colorLabel.layer.borderColor = Constants.borderColor
        
        colorLabel.pinBottom(to: colorSelector.topAnchor, Constants.labelBottomConstraint)
        colorLabel.pinRight(to: colorSelector.trailingAnchor, Constants.labelTrailingConstraint)
        
        colorLabel.label.text = colorSelector.hexColor
        
        colorLabel.setWidth(Constants.labelWidth)
        colorLabel.setHeight(Constants.labelHeight)
        colorLabel.layer.cornerRadius = Constants.labelHeight / 2
    }
    
    private func configureVisibleToggle() {
        let titel = UILabel()
        titel.text = Constants.visibleToggleTitle
        titel.textColor = Constants.textColor
        
        textView.addSubview(titel)
        textView.addSubview(visibleToggle)
        
        visibleToggle.addTarget(self, action: #selector (onVisibleToggleChanged), for: .valueChanged)
        
        visibleToggle.isOn = true
        
        visibleToggle.pinRight(to: textView.trailingAnchor, Constants.visibleToggleConstraint)
        visibleToggle.pinTop(to: descriptionLabel.bottomAnchor, Constants.visibleToggleConstraint)
        visibleToggle.pinBottom(to: textView.bottomAnchor, Constants.visibleToggleConstraint)
        
        visibleToggle.backgroundColor = Constants.backgroundColor
        visibleToggle.layer.cornerRadius = visibleToggle.frame.height / 2
        
        titel.pinCenterY(to: visibleToggle)
        titel.pinRight(to: visibleToggle.leadingAnchor, Constants.visibleTitelConstraint)
    }
    
    private func configureTextView() {
        view.addSubview(textView)
        
        textView.backgroundColor = Constants.backgroundColor
        textView.layer.borderWidth = Constants.borderWidth
        textView.layer.borderColor = Constants.borderColor
        textView.layer.cornerRadius = Constants.textViewCornerRadius
        textView.alpha = Constants.textViewBAlpha
        
        textView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.visibleTitelConstraint)
        textView.pinHorizontal(to: view, Constants.textViewHorizontalConstraint)
    }
    
    private func configureTitle() {
        textView.addSubview(titleLabel)
        
        titleLabel.textColor = Constants.textColor
        titleLabel.text = Constants.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)
        
        titleLabel.pinHorizontal(to: textView, Constants.titleLeading)
        titleLabel.pinTop(to: textView.topAnchor, Constants.titleTop)
    }
    
    private func configureDescription() {
        textView.addSubview(descriptionLabel)
        
        descriptionLabel.textColor = Constants.textColor
        descriptionLabel.text = Constants.description
        descriptionLabel.font = UIFont.systemFont(ofSize: Constants.descriptionFontSize)
        
        descriptionLabel.numberOfLines = Constants.descriptionLabelNumberOfLines
        descriptionLabel.lineBreakMode = Constants.descriptionLabelLineBreakMode
        
        descriptionLabel.pinCenterX(to: titleLabel.centerXAnchor)
        descriptionLabel.pinLeft(to: titleLabel.leadingAnchor, Constants.descriptionLeading)
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor, Constants.descriptionTop)
    }
    // MARK: - Objc methods
    @objc
    private func onVisibleToggleChanged(sender: UISwitch) {
        self.colorSelector.isHidden = !self.colorSelector.isHidden
        self.colorLabel.isHidden = !self.colorLabel.isHidden
    }
}






