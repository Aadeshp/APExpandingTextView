//
//  APExpandingTextView.swift
//  Pods
//
//  Created by Aadesh Patel on 8/3/15.
//
//

import UIKit

@objc public protocol APExpandingTextViewDelegate: UITextViewDelegate {
    optional func textViewWillExpand(textView: APExpandingTextView!)
    optional func textViewDidExpand(textView: APExpandingTextView!)
}

public class APExpandingTextView: UITextView, UITextViewDelegate {
    static let kDefaultFont: String         = "Arial"
    static let kDefaultFontSize: CGFloat    = 15.0
    
    weak public var _delegate: APExpandingTextViewDelegate?
    
    var animationDuration: NSTimeInterval   = 0.3
    var animationDamping: CGFloat           = 0.6
    var animationSpringVelocity: CGFloat    = 1.0
    
    private var width: CGFloat!
    private var height: CGFloat!
    
    public var maxNumberOfLines: Int!
    
    private var numberOfLines: CGFloat {
        get {
            return floor((self.contentSize.height / self.font.lineHeight) - self.verticalPadding / self.font.lineHeight)
        }
    }
    
    private var maxHeight: CGFloat {
        get {
            return CGFloat(self.maxNumberOfLines) * self.font.lineHeight + self.verticalPadding
        }
    }
    
    private var verticalPadding: CGFloat {
        get {
            return self.textContainerInset.bottom + self.textContainerInset.top
        }
    }
    
    // MARK: View Life Cycle
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        self.width = frame.size.width
        self.height = frame.size.height
        self.maxNumberOfLines = 0
        
        super.init(frame: frame, textContainer: nil)
        self.baseInit()
    }
    
    deinit {
        self.removeTextViewObservers()
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func baseInit() {
        self.addTextViewObservers()
        
        self.delegate = self
        
        self.scrollEnabled = false
        
        self.font = UIFont(name: APExpandingTextView.kDefaultFont, size: APExpandingTextView.kDefaultFontSize)
    }
    
    // MARK: TextView Observers
    
    private func addTextViewObservers() {
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: Selector("APExpandingTextViewDidChange:"),
            name: UITextViewTextDidChangeNotification,
            object: nil)
    }
    
    private func removeTextViewObservers() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextViewTextDidChangeNotification, object: nil)
    }
    
    private func isRespondToSelector(selector: Selector) -> Bool {
        return (self._delegate?.conformsToProtocol(APExpandingTextViewDelegate.self) == true &&
                self._delegate?.respondsToSelector(selector) == true)
    }
}

extension APExpandingTextView: UITextViewDelegate {
    @IBAction private func APExpandingTextViewDidChange(notification: NSNotification) {
        let size: CGSize = self.sizeThatFits(CGSizeMake(self.width, self.height))
        var frame: CGRect = self.frame
        frame.size = CGSizeMake(self.width, size.height)
        
        if (self.height != size.height &&
            self.isRespondToSelector(Selector("textViewWillExpand:"))) {
            self._delegate?.textViewWillExpand!(self)
        }
        
        UIView.animateWithDuration(
            self.animationDuration,
            delay: 0.0,
            usingSpringWithDamping: self.animationDamping,
            initialSpringVelocity: self.animationSpringVelocity,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: { () -> Void in
                self.frame = frame
            }, completion: { (finished: Bool) -> Void in
                if (finished) {
                    if (self.height != size.height && self.isRespondToSelector(Selector("textViewDidExpand:"))) {
                        self._delegate?.textViewDidExpand!(self)
                    }
                    
                    self.height = size.height
                }
        })
    }
}
