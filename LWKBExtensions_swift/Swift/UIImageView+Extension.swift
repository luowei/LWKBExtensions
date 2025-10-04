//
// UIImageView+Extension.swift
// MyInputMethod
//
// Created by luowei on 15/8/11.
// Copyright (c) 2015 luowei. All rights reserved.
//

import UIKit
import QuartzCore

// MARK: - UIImageView Rotation Animation
public extension UIImageView {
    /// Rotate the image view 360 degrees
    /// - Parameters:
    ///   - duration: The duration of one rotation cycle
    ///   - repeatCount: The number of times to repeat. Use 0 for infinite
    func rotate360(duration: CGFloat, repeatCount: Float) {
        let fullRotation = CABasicAnimation(keyPath: "transform.rotation")
        fullRotation.fromValue = 0.0
        fullRotation.toValue = Double.pi * 2
        fullRotation.duration = CFTimeInterval(duration)
        fullRotation.repeatCount = repeatCount == 0 ? .greatestFiniteMagnitude : repeatCount

        self.layer.add(fullRotation, forKey: "360")
    }

    /// Stop all animations on the image view
    func stopAllAnimations() {
        self.layer.removeAllAnimations()
    }

    /// Pause all animations on the image view
    func pauseAnimations() {
        pauseLayer(self.layer)
    }

    /// Resume paused animations on the image view
    func resumeAnimations() {
        resumeLayer(self.layer)
    }

    // MARK: - Private Helper Methods

    private func pauseLayer(_ layer: CALayer) {
        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }

    private func resumeLayer(_ layer: CALayer) {
        let pausedTime = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
}

// MARK: - UIImageView Border Styling
public extension UIImageView {
    /// Set a circular border on the image view
    /// - Parameters:
    ///   - borderWidth: The width of the border
    ///   - color: The color of the border
    /// - Note: This method assumes the image view has equal width and height
    func setBorder(_ borderWidth: CGFloat, color: UIColor) {
        assert(self.frame.size.width == self.frame.size.height,
               "UIImageView must have equal width and height for circular border")

        // Remove existing border layer if present
        for sublayer in self.layer.sublayers ?? [] {
            if sublayer.name == "border-shape" {
                sublayer.removeFromSuperlayer()
                break
            }
        }

        let borderHalf = floor(borderWidth * 0.5)
        self.layer.cornerRadius = self.layer.bounds.size.width * 0.5

        // Create circular border layer
        let circleLayer = CAShapeLayer()
        circleLayer.name = "border-shape"
        circleLayer.bounds = self.bounds.insetBy(dx: borderHalf, dy: borderHalf)
        circleLayer.position = CGPoint(
            x: self.layer.bounds.midX,
            y: self.layer.bounds.midY
        )

        let circlePath = UIBezierPath(ovalIn: circleLayer.bounds)
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = color.cgColor
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineWidth = borderWidth

        // Add shadow effect
        circleLayer.shadowOffset = .zero
        circleLayer.shadowColor = UIColor.white.cgColor
        circleLayer.shadowRadius = borderWidth
        circleLayer.shadowOpacity = 0.9

        // Add the sublayer to the image view's layer tree
        self.layer.addSublayer(circleLayer)
    }

    /// Update border layer frame when layout changes
    /// - Parameter layer: The layer being laid out
    func layoutSublayers(of layer: CALayer) {
        for sublayer in layer.sublayers ?? [] {
            if sublayer.name == "border-shape", let shapeLayer = sublayer as? CAShapeLayer {
                let borderHalf = floor(shapeLayer.lineWidth * 0.5)
                sublayer.frame = layer.bounds
                sublayer.bounds = layer.bounds.insetBy(dx: borderHalf, dy: borderHalf)
                sublayer.position = CGPoint(
                    x: layer.bounds.midX,
                    y: layer.bounds.midY
                )
            }
        }
    }
}
