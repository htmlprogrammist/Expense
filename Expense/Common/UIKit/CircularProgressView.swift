//
//  CircularProgressView.swift
//  NoStoryboard
//
//  Created by Егор Бадмаев on 17.06.2022.
//

import UIKit

/**
 And here is how to use:
 Create a new progress view
 `let progressView = CircularProgressView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), lineWidth: 15, rounded: false)`
 If you use `nil` for the line width, a filled circle will appear.
 
 Set the progress- and the track color:
 ```
 progressView.progressColor = .blue
 progressView.trackColor = .lightGray
 ```
 If you use `progressView.trackColorToProgressColor()` set a track color to the progress color, but with a less alpha.
 
 Set the position of the progressView (example):
 `progressView.center = view.center`
 You can use this because the progressView is of type UIView.
 
 Add the progressView as a subview of the ViewControllers view:
 `view.addSubview(progressView)`
 Set the progress of the progressView:
 `progressView.progress = 0.6`
 The progress will be animated. If you don't want to animate the progress you can set the `progressView.timeToFill` to `0`. If you want a faster or lower animating you can use this method, too.
 */

final class CircularProgressView: UIView {
    private var progressLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()
    private var rounded: Bool = true
    private var filled: Bool = false
    private var lineWidth: CGFloat? = 15
    
    var timeToFill: Double = 1.3
    
    var progressColor = UIColor.white {
        didSet {
            progressLayer.strokeColor = progressColor.cgColor
        }
    }
    var trackColor = UIColor.white {
        didSet {
            trackLayer.strokeColor = trackColor.cgColor
        }
    }
    var progress: Double = 0 {
        didSet {
            var pathMoved = progress - oldValue
            if pathMoved < 0 {
                pathMoved = 0 - pathMoved
            }
            setProgress(duration: timeToFill * Double(pathMoved), to: progress)
        }
    }
    
    init(frame: CGRect, lineWidth: CGFloat?, rounded: Bool) {
        if lineWidth == nil {
            self.filled = true
            self.rounded = false
        } else {
            self.rounded = rounded
            self.filled = false
        }
        self.lineWidth = lineWidth
        
        super.init(frame: frame)
        createProgressView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        createProgressView()
    }
    
    private func createProgressView() {
        backgroundColor = .clear
        layer.cornerRadius = frame.size.width / 2
        let circularPath = UIBezierPath(arcCenter: center, radius: frame.width / 2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        trackLayer.fillColor = UIColor.blue.cgColor
        
        trackLayer.path = circularPath.cgPath
        trackLayer.fillColor = .none
        trackLayer.strokeColor = trackColor.cgColor
        if filled {
            trackLayer.lineCap = .butt
            trackLayer.lineWidth = frame.width
        } else {
            trackLayer.lineWidth = lineWidth!
        }
        trackLayer.strokeEnd = 1
        layer.addSublayer(trackLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = .none
        progressLayer.strokeColor = progressColor.cgColor
        if filled {
            progressLayer.lineCap = .butt
            progressLayer.lineWidth = frame.width
        } else {
            progressLayer.lineWidth = lineWidth!
        }
        progressLayer.strokeEnd = 0
        if rounded {
            progressLayer.lineCap = .round
        }
        layer.addSublayer(progressLayer)
    }
    
    func setProgress(duration: TimeInterval = 3, to newProgress: Double) -> Void {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = progressLayer.strokeEnd
        animation.toValue = newProgress
        
        progressLayer.strokeEnd = CGFloat(newProgress)
        progressLayer.add(animation, forKey: "animationProgress")
    }
}
