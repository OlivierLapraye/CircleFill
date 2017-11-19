import UIKit

extension UIView: CAAnimationDelegate {
    
    private func getDiagonal() -> CGFloat {
        let origin = self.frame.origin
        let opposite = CGPoint(x: origin.x + self.frame.width,
                               y: origin.y + self.frame.height)
        
        let distanceX = origin.x - opposite.x
        let distanceY = origin.y - opposite.y
        let diagonal = sqrt(pow(distanceX, 2) + pow(distanceY, 2))
        return diagonal
    }
    
    /* FILL BACKGROUND */
    func fillBackgroundFrom(point: CGPoint, with color: UIColor, in time: CFTimeInterval = 1.0) {
        let initialDiameter: CGFloat = 10.0
        let diagonal = getDiagonal()
        let fullViewValue = (diagonal / initialDiameter) + 2
        
        // Create layer
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: initialDiameter,
                             height: initialDiameter)
        layer.position = point
        layer.cornerRadius = initialDiameter / 2
        layer.backgroundColor = color.cgColor
        layer.name = "color"
        
        // Create animation
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.0
        animation.toValue = fullViewValue
        animation.duration = time
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        animation.setValue("fill", forKey: "name")
        
        // Add animation to layer and layer to view
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
        
        for subLayer in subLayers {
            if subLayer.name == "color" {
                guard let presentationLayer = subLayer.presentation(),
                let value = presentationLayer.value(forKeyPath: "transform.scale") else {
                    return
                }
                let animation = CABasicAnimation(keyPath: "transform.scale")
                animation.fromValue = value
                animation.toValue = 1.0
                animation.duration = time
                animation.delegate = self
                animation.setValue("empty", forKey: "name")
                subLayer.add(animation, forKey: "fillAnimation")
            }
        }
    }
    
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard let name = anim.value(forKey: "name") as? String else {
            return
        }
        if name == "fill" {
            // DELEGATE METHOD HERE... BUT IT'S A EXTENSION, CAN'T HAVE STORED PROPERTIES
        }
        else {
            // DELEGATE METHOD HERE AGAIN
            print("empty is done")
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
}
