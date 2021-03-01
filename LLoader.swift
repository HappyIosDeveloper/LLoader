//
//  LLoader.swift
//  laoder
//
//  Created by Ahmadreza on 12/6/1399 AP.
//

import UIKit

class LLoader: UIView {
    
    public var color = UIColor.red
    public var isAnimating = true {
        didSet {
            DispatchQueue.main.async { [self] in
                if !isAwakeFromNibCalled {
                    awakeFromNib()
                }
                startAnimate()
            }
        }
    }
    private var leftCircle = UIView()
    private var rightCircle = UIView()
    private var centerCircle = UIView()
    private var circleSize = CGSize.zero
    private var style1 = true
    private var isAwakeFromNibCalled = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !isAwakeFromNibCalled {
            circleSize = CGSize(width: frame.width / 5, height: frame.width / 5)
            clipsToBounds = true
            setupCiscles()
        }
    }
    
    private func setupCiscles() {
        if !isAwakeFromNibCalled {
            isAwakeFromNibCalled = true
            let space = (frame.width - (circleSize.width * 3)) / 4
            let yPosition = (frame.height - circleSize.height) / 2
            leftCircle = UIView(frame: CGRect(origin: CGPoint(x: space, y: yPosition), size: circleSize))
            centerCircle = UIView(frame: CGRect(origin: CGPoint(x: circleSize.height + (space * 2), y: yPosition), size: circleSize))
            rightCircle = UIView(frame: CGRect(origin: CGPoint(x: (circleSize.height * 2) + (space * 3), y: yPosition), size: circleSize))
            small(view: centerCircle)
            setupCircle(leftCircle)
            setupCircle(centerCircle)
            setupCircle(rightCircle)
        }
    }
    
    private func setupCircle(_ circle: UIView) {
        circle.clipsToBounds = true
        circle.backgroundColor = color
        circle.layer.cornerRadius = circleSize.height / 2
        addSubview(circle)
    }
    
    private func startAnimate() {
        UIView.animate(withDuration: 0.4) { [self] in
            if style1 {
                small(view: leftCircle)
                small(view: rightCircle)
                reset(view: centerCircle)
            } else {
                reset(view: leftCircle)
                reset(view: rightCircle)
                small(view: centerCircle)
            }
            style1.toggle()
        } completion: { [weak self] _ in
            if self?.window != nil {
                if self?.isAnimating ?? false {
                    self?.startAnimate()
                    self?.isHidden = false
                } else {
                    self?.isHidden = true
                }
            }
        }
    }
    
    private func small(view: UIView) {
        view.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
    }
    
    private func reset(view: UIView) {
        view.transform = CGAffineTransform(scaleX: 1, y: 1)
    }
}
