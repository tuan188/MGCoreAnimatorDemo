//
// TrashBinView.swift
// Generated by Core Animator version 1.3.1 on 8/27/16.
//
// DO NOT MODIFY THIS FILE. IT IS AUTO-GENERATED AND WILL BE OVERWRITTEN
//

import UIKit

@IBDesignable
class TrashBinView : UIView {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle

	convenience init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 54, height: 68))
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	// - MARK: Scaling

	override func layoutSubviews() {
		super.layoutSubviews()

		if let scalingView = self.viewsByName["__scaling__"] {
			var xScale = self.bounds.size.width / scalingView.bounds.size.width
			var yScale = self.bounds.size.height / scalingView.bounds.size.height
			switch contentMode {
			case .ScaleToFill:
				break
			case .ScaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransformMakeScale(xScale, yScale)
			scalingView.center = CGPoint(x:CGRectGetMidX(self.bounds), y:CGRectGetMidY(self.bounds))
		}
	}

	// - MARK: Setup

	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = NSBundle(forClass:self.dynamicType)
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:54, height:68)
		__scaling__.center = CGPoint(x:27.4, y:34.3)
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let trashBin = UIView()
		trashBin.bounds = CGRect(x:0, y:0, width:44.3, height:59.6)
		trashBin.layer.position = CGPoint(x:27.981, y:34.502)
		__scaling__.addSubview(trashBin)
		viewsByName["trash bin"] = trashBin

		let trash = UIImageView()
		trash.bounds = CGRect(x:0, y:0, width:41.0, height:55.0)
		var imgTrash: UIImage!
		if let imagePath = bundle.pathForResource("trash.png", ofType:nil) {
			imgTrash = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'trash.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		trash.image = imgTrash
		trash.contentMode = .Center
		trash.layer.position = CGPoint(x:21.643, y:35.347)
		trash.transform = CGAffineTransformMakeScale(0.96, 0.88)
		trashBin.addSubview(trash)
		viewsByName["trash"] = trash

		let trashlid = UIImageView()
		trashlid.bounds = CGRect(x:0, y:0, width:46.0, height:9.0)
		trashlid.layer.anchorPoint = CGPoint(x:0.029, y:0.848)
		var imgTrashlid: UIImage!
		if let imagePath = bundle.pathForResource("trashlid.png", ofType:nil) {
			imgTrashlid = UIImage(contentsOfFile:imagePath)
		}else {
			print("** Warning: Could not create image from 'trashlid.png'. Please make sure that it is added to the project directly (not in a folder reference).")
		}
		trashlid.image = imgTrashlid
		trashlid.contentMode = .Center
		trashlid.layer.position = CGPoint(x:1.285, y:6.728)
		trashlid.transform = CGAffineTransformMakeScale(0.96, 0.88)
		trashBin.addSubview(trashlid)
		viewsByName["trashlid"] = trashlid

		self.viewsByName = viewsByName
	}

	// - MARK: close

	func addCloseAnimation() {
		addCloseAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addCloseAnimation(completion: ((Bool) -> Void)?) {
		addCloseAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addCloseAnimation(removedOnCompletion removedOnCompletion: Bool) {
		addCloseAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addCloseAnimation(removedOnCompletion removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addCloseAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addCloseAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 0.500
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "Close")
			self.animationCompletions[layer.animationForKey("Close")!] = complete
		}

		let trashlidRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		trashlidRotationAnimation.duration = 0.500
		trashlidRotationAnimation.values = [0.000 as Float, -2.094 as Float, 0.000 as Float]
		trashlidRotationAnimation.keyTimes = [0.000 as Float, 0.000 as Float, 1.000 as Float]
		trashlidRotationAnimation.timingFunctions = [linearTiming, linearTiming]
		trashlidRotationAnimation.beginTime = beginTime
		trashlidRotationAnimation.fillMode = fillMode
		trashlidRotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["trashlid"]?.layer.addAnimation(trashlidRotationAnimation, forKey:"close_Rotation")
	}

	func removeCloseAnimation() {
		self.layer.removeAnimationForKey("Close")
		self.viewsByName["trashlid"]?.layer.removeAnimationForKey("close_Rotation")
	}

	// - MARK: open

	func addOpenAnimation() {
		addOpenAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addOpenAnimation(completion: ((Bool) -> Void)?) {
		addOpenAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	func addOpenAnimation(removedOnCompletion removedOnCompletion: Bool) {
		addOpenAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addOpenAnimation(removedOnCompletion removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addOpenAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	func addOpenAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 1.000
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "Open")
			self.animationCompletions[layer.animationForKey("Open")!] = complete
		}

		let trashlidRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		trashlidRotationAnimation.duration = 1.000
		trashlidRotationAnimation.values = [0.000 as Float, -2.094 as Float]
		trashlidRotationAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		trashlidRotationAnimation.timingFunctions = [linearTiming]
		trashlidRotationAnimation.beginTime = beginTime
		trashlidRotationAnimation.fillMode = fillMode
		trashlidRotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["trashlid"]?.layer.addAnimation(trashlidRotationAnimation, forKey:"open_Rotation")
	}

	func removeOpenAnimation() {
		self.layer.removeAnimationForKey("Open")
		self.viewsByName["trashlid"]?.layer.removeAnimationForKey("open_Rotation")
	}

	override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValueForKey(anim)
			completion(flag)
		}
	}

	func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimationForKey("Close")
		self.layer.removeAnimationForKey("Open")
	}
}