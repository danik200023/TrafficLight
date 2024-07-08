//
//  ViewController.swift
//  TrafficLight
//
//  Created by Данила Умнов on 08.07.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var trafficLightViews: [UIView]!
    
    private enum ButtonState: String {
        case start = "START"
        case next = "NEXT"
    }
    
    private let inactiveAlpha: CGFloat = 0.5
    private let activeAlpha: CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trafficLightViews.forEach { view in
            view.layer.cornerRadius = view.frame.size.width / 2
            view.alpha = 0.5
        }
    }
    
    @IBAction func trafficLightButtonDidTapped(_ sender: UIButton) {
        guard let currentTitle = sender.titleLabel?.text else { return }
        if let buttonState = ButtonState(rawValue: currentTitle) {
            switch buttonState {
            case .start:
                sender.setTitle("NEXT", for: .normal)
                trafficLightViews.first?.alpha = activeAlpha
            case .next:
                let currentLightIndex = trafficLightViews.firstIndex { $0.alpha == 1 }
                if let currentLightIndex {
                    let nextLightIndex = (currentLightIndex + 1) % trafficLightViews.count
                    trafficLightViews[currentLightIndex].alpha = inactiveAlpha
                    trafficLightViews[nextLightIndex].alpha = activeAlpha
                }
            }
        }
    }
}
