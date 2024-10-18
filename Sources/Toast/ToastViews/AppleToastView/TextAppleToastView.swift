//
//  TextToastView.swift
//  Toast
//
//  Created by Bastiaan Jansen on 29/06/2021.
//

import Foundation
import UIKit

public class TextToastView : UIStackView {
    
    private let action: (() -> Void)?
    
    private lazy var vStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 2
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        UILabel()
    }()
    
    private lazy var subtitleLabel: UILabel = {
        UILabel()
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(actionButtonPressed(_ :)), for: .touchUpInside)
        button.setTitleColor(UIColor(named: "SystemBlue"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        button.layer.cornerRadius = 12
        button.layer.backgroundColor = UIColor.white.cgColor
        return button
    }()
    
    public init(_ title: NSAttributedString,
                subtitle: NSAttributedString? = nil,
                titleColorLight: UIColor? = nil,
                titleColorDark: UIColor? = nil,
                subTitleColorLight: UIColor? = nil,
                subTitleColorDark: UIColor? = nil,
                actionTitle: String? = nil,
                actionButtonTitleColor: UIColor? = nil,
                actionButtonBackgroundColor: UIColor? = nil,
                actionButtonRadius: CGFloat? = nil,
                action: (() -> Void)? = nil,
                viewConfig: ToastViewConfiguration) {
        
        self.action = action
        super.init(frame: CGRect.zero)
        commonInit()
        
        self.titleLabel.attributedText = title
        self.titleLabel.numberOfLines = viewConfig.titleNumberOfLines
        self.vStack.addArrangedSubview(self.titleLabel)
        
        if let subtitle = subtitle {
            self.subtitleLabel.attributedText = subtitle
            self.subtitleLabel.numberOfLines = viewConfig.subtitleNumberOfLines
            self.vStack.addArrangedSubview(self.subtitleLabel)
        }
        
        if #available(iOS 12.0, *) {
            self.titleLabel.textColor  = traitCollection.userInterfaceStyle == .light ? viewConfig.titleDarkColor: 
            viewConfig.titleLightColor
            self.subtitleLabel.textColor = traitCollection.userInterfaceStyle == .light ? viewConfig.subTitleDarkColor: 
            viewConfig.subTitleLightColor
        } else {
            
        }
        
        if let titleColorLight = titleColorLight, let titleColorDark = titleColorDark {
            self.titleLabel.textColor = traitCollection.userInterfaceStyle == .light ? titleColorLight :
            titleColorDark
        }
        
        if let subTitleColorLight = subTitleColorLight, let subTitleColorDark = subTitleColorDark {
            self.subtitleLabel.textColor = traitCollection.userInterfaceStyle == .light ? subTitleColorLight :
            subTitleColorDark
        }
        
        addArrangedSubview(self.vStack)
        
        if let actionTitle = actionTitle {
            setCustomSpacing(25, after: self.vStack)
            self.actionButton.setTitle(actionTitle, for: .normal)
            addArrangedSubview(self.actionButton)
            setCustomSpacing(15, after: self.actionButton)
        }
        
        if let actionButtonTitleColor = actionButtonTitleColor {
            actionButton.setTitleColor(actionButtonTitleColor, for: .normal)
        }
        
        if let actionButtonBackgroundColor = actionButtonBackgroundColor {
            actionButton.layer.backgroundColor = actionButtonBackgroundColor.cgColor
        }
    }
    
    public init(_ title: String,
                subtitle: String? = nil,
                titleColorLight: UIColor? = nil,
                titleColorDark: UIColor? = nil,
                subTitleColorLight: UIColor? = nil,
                subTitleColorDark: UIColor? = nil,
                actionTitle: String? = nil,
                actionButtonTitleColor: UIColor? = nil,
                actionButtonBackgroundColor: UIColor? = nil,
                actionButtonRadius: CGFloat? = nil,
                action: (() -> Void)? = nil,
                viewConfig: ToastViewConfiguration) {
        self.action = action
        super.init(frame: CGRect.zero)
        commonInit()
        
        self.titleLabel.text = title
        self.titleLabel.numberOfLines = viewConfig.titleNumberOfLines
        self.titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        self.vStack.addArrangedSubview(self.titleLabel)
        
        if let subtitle = subtitle {
            self.subtitleLabel.textColor = .systemGray
            self.subtitleLabel.text = subtitle
            self.subtitleLabel.numberOfLines = viewConfig.subtitleNumberOfLines
            self.subtitleLabel.font = .systemFont(ofSize: 12, weight: .bold)
            self.vStack.addArrangedSubview(self.subtitleLabel)
        }
        
        if #available(iOS 12.0, *) {
            self.titleLabel.textColor  = traitCollection.userInterfaceStyle == .light ? viewConfig.titleLightColor :
            viewConfig.titleDarkColor
            self.subtitleLabel.textColor = traitCollection.userInterfaceStyle == .light ? viewConfig.subTitleDarkColor:
            viewConfig.subTitleLightColor
        } else {
            
        }
        
        if let titleColorLight = titleColorLight, let titleColorDark = titleColorDark {
            self.titleLabel.textColor = traitCollection.userInterfaceStyle == .light ? titleColorLight :
            titleColorDark
        }
        
        if let subTitleColorLight = subTitleColorLight, let subTitleColorDark = subTitleColorDark {
            self.subtitleLabel.textColor = traitCollection.userInterfaceStyle == .light ? subTitleColorLight :
            subTitleColorDark
        }
        
        addArrangedSubview(self.vStack)
        
        if let actionTitle = actionTitle {
            setCustomSpacing(25, after: self.vStack)
            self.actionButton.setTitle(actionTitle, for: .normal)
            addArrangedSubview(self.actionButton)
            setCustomSpacing(15, after: self.actionButton)
        }
        
        if let actionButtonTitleColor = actionButtonTitleColor {
            actionButton.setTitleColor(actionButtonTitleColor, for: .normal)
        }
        
        if let actionButtonBackgroundColor = actionButtonBackgroundColor {
            actionButton.backgroundColor = actionButtonBackgroundColor
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        axis = .horizontal
        spacing = 15
        alignment = .center
        distribution = .fill
    }
    
    @objc private func actionButtonPressed(_ sender: UIButton) {
        action?()
    }
}
