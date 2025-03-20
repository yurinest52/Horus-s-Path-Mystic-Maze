import UIKit
import SnapKit
import SpriteKit
final class HorussPathExtraLDMysticMazeViewController: UIViewController {
    weak var horussPathExtraLDMysticMazeViewController: HorussPathExtraLDMysticMazeViewControllerScene?
    private var openControllerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view = SKView(frame: view.bounds)
        if let horussPathExtraLDMystic = self.view as? SKView {
            let LDMysticMazeView = HorussPathExtraLDMysticMazeViewControllerScene(size: horussPathExtraLDMystic.bounds.size)
            self.horussPathExtraLDMysticMazeViewController = LDMysticMazeView
            LDMysticMazeView.horussPathExtraLDMysticMazeViewControllerScene = self
            LDMysticMazeView.scaleMode = .aspectFill
            horussPathExtraLDMystic.presentScene(LDMysticMazeView)
            horussPathExtraLDMystic.ignoresSiblingOrder = true
        }
        
        openControllerButton = UIButton(type: .custom)
        openControllerButton.setImage(UIImage(named: "HorussPathExtraLDMysticMazeButtonImage"), for: .normal)
        openControllerButton.addTarget(self, action: #selector(openAnotherController), for: .touchUpInside)
        
        view.addSubview(openControllerButton)
        
        openControllerButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(40)
            make.left.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
        }
    }
    
    @objc private func openAnotherController() {
        performHorussPath_Actions(withSoundFileName: "horusSoundClickTrack01")
        let nextVC = HorussPathFourthLDMysticMazeViewController()
        nextVC.modalPresentationStyle = .overFullScreen
        present(nextVC, animated: true, completion: nil)
    }
    func openAnotherWinPathMysticController() {
        let nextVC = HorussPathFinalControlLDMysticMazeViewController()
        nextVC.modalPresentationStyle = .overFullScreen
        present(nextVC, animated: true, completion: nil)
    }
}

