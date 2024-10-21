//
//  ToastViewConfiguration.swift
//  Toast
//
//  Created by Thomas Maw on 12/9/2023.
//

import Foundation
import UIKit

public struct ToastViewConfiguration {
    public var minHeight: CGFloat
    public var minWidth: CGFloat
    
    public var darkBackgroundColor: UIColor
    public var lightBackgroundColor: UIColor
    
    public let titleNumberOfLines: Int
    public let subtitleNumberOfLines: Int
    
    public let titleLightColor: UIColor
    public let titleDarkColor: UIColor
    public let subTitleLightColor: UIColor
    public let subTitleDarkColor: UIColor
    
    public var cornerRadius: CGFloat?
    
    public init(
        minHeight: CGFloat = 58,
        minWidth: CGFloat = 150,
        darkBackgroundColor: UIColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00),
        lightBackgroundColor: UIColor = UIColor(red: 0.99, green: 0.99, blue: 0.99, alpha: 1.00),
        titleLightColor: UIColor = UIColor(red: 0.13, green: 0.13, blue: 0.13, alpha: 1.00),
        titleDarkColor: UIColor = UIColor(red: 0.99, green: 0.99, blue: 0.99, alpha: 1.00),
        subTitleLightColor: UIColor = .systemGray,
        subTitleDarkColor: UIColor = .systemGray,
        titleNumberOfLines: Int = 0,
        subtitleNumberOfLines: Int = 0,
        cornerRadius: CGFloat? = nil
    ) {
        self.minHeight = minHeight
        self.minWidth = minWidth
        self.darkBackgroundColor = darkBackgroundColor
        self.lightBackgroundColor = lightBackgroundColor
        self.titleLightColor = titleLightColor
        self.titleDarkColor = titleDarkColor
        self.subTitleLightColor = subTitleLightColor
        self.subTitleDarkColor = subTitleDarkColor
        self.titleNumberOfLines = titleNumberOfLines
        self.subtitleNumberOfLines = subtitleNumberOfLines
        self.cornerRadius = cornerRadius
    }
}
