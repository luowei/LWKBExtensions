//
// NSString+Ext.swift
// MyInputMethod
//
// Created by luowei on 15/8/11.
// Copyright (c) 2015 luowei. All rights reserved.
//

import UIKit

// MARK: - String Size Calculations
public extension String {
    /// Calculate the width of the string with a given font
    /// - Parameter font: The font to use for calculation
    /// - Returns: The width of the string
    func width(with font: UIFont) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let attributedString = NSAttributedString(string: self, attributes: attributes)
        return attributedString.size().width
    }

    /// Calculate the height of the string with a given width and font
    /// - Parameters:
    ///   - width: The maximum width available
    ///   - font: The font to use for calculation
    /// - Returns: The height of the string
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let attributedString = NSAttributedString(string: self, attributes: attributes)
        let rect = attributedString.boundingRect(
            with: CGSize(width: width, height: .greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            context: nil
        )
        return rect.size.height
    }

    /// Enumerate each character in the string
    /// - Parameter block: A closure that takes the character, index, and a stop pointer
    func enumerateCharacters(using block: (_ character: String, _ index: Int, _ stop: inout Bool) -> Void) {
        var shouldStop = false
        for (index, char) in self.enumerated() {
            guard !shouldStop else { break }
            let character = String(char)
            block(character, index, &shouldStop)
        }
    }
}

// MARK: - URL Encoding/Decoding
public extension String {
    /// Decode URL encoded string
    /// - Returns: The decoded string, or the original string if decoding fails
    func urlDecode() -> String {
        return self.removingPercentEncoding ?? self
    }

    /// Encode string for URL
    /// - Returns: The URL encoded string, or the original string if encoding fails
    func urlEncode() -> String {
        let allowedCharacters = CharacterSet(charactersIn: "!*'\"();:@&=+$,/?%#[]% ").inverted
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters) ?? self
    }
}

// MARK: - String to Image Conversion
public extension String {
    /// Convert string to image
    /// - Parameter size: The size of the image to create
    /// - Returns: An image with the string drawn in it
    func image(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer { UIGraphicsEndImageContext() }

        UIColor.clear.set()
        UIRectFill(CGRect(origin: .zero, size: size))

        let fontSize = floor(size.width * 0.9)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: fontSize)
        ]

        let rect = CGRect(origin: .zero, size: size)
        (self as NSString).draw(in: rect, withAttributes: attributes)

        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
