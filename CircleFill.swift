import UIKit

extension UIView: CAAnimationDelegate {
    
    /* FILL BACKGROUND */
    func fillBackgroundFrom(point: CGPoint, with color: UIColor, in time: CFTimeInterval = 1.0) {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        layer.position = point
        layer.cornerRadius = 5
        layer.backgroundColor = color.cgColor
        layer.name = "color"
        
        // TODO: REMOVE THE HARDCODED "70"
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.0
        animation.toValue = 70.0
        animation.duration = time
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        layer.add(animation, forKey: "fillAnimation")
        
        guard let firstSubView = self.subviews.first else {
            return
        }
        self.layer.insertSublayer(layer, below: firstSubView.layer)
        self.layer.masksToBounds = true
    }
    
    /* EMPTY BACKGROUND */
    func emptyBackgroundTo(point: CGPoint, with color: UIColor, in time: CFTimeInterval = 1.0) {
        guard let subLayers = self.layer.sublayers else {
            return
        }
        
        // TODO: REMOVE THE HARDCODED "70"
        for subLayer in subLayers {
            if subLayer.name == "color" {
                let animation = CABasicAnimation(keyPath: "transform.scale")
                animation.fromValue = 70.0
                animation.toValue = 1.0
                animation.duration = time
                animation.delegate = self
                subLayer.add(animation, forKey: "fillAnimation")
            }
        }
    }
    
    // TODO: DO NOT HARDCODE THIS CALLBACK FOR THE EMPTY ACTION ONLY
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard let subLayers = self.layer.sublayers else {
            return
        }
        for subLayer in subLayers {
            if subLayer.name == "color" {
                subLayer.removeFromSuperlayer()
            }
        }
    }
}
