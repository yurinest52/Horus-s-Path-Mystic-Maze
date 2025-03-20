import UIKit
import SnapKit

final class HorussPathFirstLDMysticMazeViewController: UIViewController {
    
    
    private var backgroundImageView: UIImageView!
    private var centralImageView: UIImageView!
    private var blinkingImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHorussPathMysticMazeOrientation()
        setupView()
        startAnimations()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.stopAnimations()
            let secondVC = HorussPathThirdMainLDMysticMazeViewController()
            secondVC.modalPresentationStyle = .fullScreen
            self?.present(secondVC, animated: true, completion: nil)
        }
    }
    private func configureHorussPathMysticMazeOrientation() {
        (UIApplication.shared.delegate as? AppDelegate)?.horussPathMysticMazeOr = .all
    }
    private func setupView() {
        backgroundImageView = UIImageView(image: UIImage(named: "HorussPathFirstLDMysticMazeBackground"))
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        centralImageView = UIImageView(image: UIImage(named: "HorussPathFirstLDMysticMazeCentral"))
        centralImageView.contentMode = .scaleAspectFit
        view.addSubview(centralImageView)
        centralImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        blinkingImageView = UIImageView(image: UIImage(named: "HorussPathFirstLDMysticMazeBlinking"))
        blinkingImageView.contentMode = .scaleAspectFit
        view.addSubview(blinkingImageView)
        blinkingImageView.snp.makeConstraints { make in
            make.top.equalTo(centralImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(300)
        }
    }
    
    private func startAnimations() {
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.fromValue = 0.9
        pulseAnimation.toValue = 1.1
        pulseAnimation.duration = 0.8
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .infinity
        centralImageView.layer.add(pulseAnimation, forKey: "pulse")
        
        UIView.animate(withDuration: 0.8,
                       delay: 0,
                       options: [.autoreverse, .repeat, .allowUserInteraction],
                       animations: {
            self.blinkingImageView.alpha = 0.0
        }, completion: nil)
    }
    
    private func stopAnimations() {
        centralImageView.layer.removeAnimation(forKey: "pulse")
        blinkingImageView.layer.removeAllAnimations()
    }
}



