import UIKit
import SnapKit

final class HorussPathFourthLDMysticMazeViewController: UIViewController {
    
    private var backgroundImageView: UIImageView!
    private var centralImageView: UIImageView!
    private var toggleImageViewOne: UIImageView!
    private var toggleImageViewTwo: UIImageView!
    private var dismissImageView: UIImageView!
    
    private let toggleKeyOne = "ToggleKey1HorussPathMysticMaze"
    private let toggleKeyTwo = "ToggleKey2HorussPathMysticMaze"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        backgroundImageView = UIImageView(image: UIImage(named: "HorussPathFirstLDMysticMazeBackground"))
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        centralImageView = UIImageView(image: UIImage(named: "HorussPathFourthLDMysticMazeCentral"))
        centralImageView.contentMode = .scaleAspectFit
        view.addSubview(centralImageView)
        centralImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(400)
        }
        
        toggleImageViewOne = UIImageView()
        toggleImageViewOne.contentMode = .scaleAspectFit
        toggleImageViewOne.isUserInteractionEnabled = true
        toggleImageViewOne.image = getToggleImage(forKey: toggleKeyOne, trueImage: "HorussPathToggleOnLDMysticMaze", falseImage: "HorussPathToggleOffLDMysticMaze")
        let tapGestureOne = UITapGestureRecognizer(target: self, action: #selector(toggleImageOneTapped))
        toggleImageViewOne.addGestureRecognizer(tapGestureOne)
        
        view.addSubview(toggleImageViewOne)
        toggleImageViewOne.snp.makeConstraints { make in
            make.top.equalTo(centralImageView.snp.top).inset(270)
            make.right.equalTo(centralImageView.snp.right).inset(100)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        toggleImageViewTwo = UIImageView()
        toggleImageViewTwo.contentMode = .scaleAspectFit
        toggleImageViewTwo.isUserInteractionEnabled = true
        toggleImageViewTwo.image = getToggleImage(forKey: toggleKeyTwo, trueImage: "HorussPathToggleOnLDMysticMaze", falseImage: "HorussPathToggleOffLDMysticMaze")
        let tapGestureTwo = UITapGestureRecognizer(target: self, action: #selector(toggleImageTwoTapped))
        toggleImageViewTwo.addGestureRecognizer(tapGestureTwo)
        
        view.addSubview(toggleImageViewTwo)
        toggleImageViewTwo.snp.makeConstraints { make in
            make.top.equalTo(centralImageView.snp.top).inset(310)
            make.right.equalTo(centralImageView.snp.right).inset(100)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        dismissImageView = UIImageView(image: UIImage(named: "HorussPathDismissLDMysticMaze"))
        dismissImageView.contentMode = .scaleAspectFit
        dismissImageView.isUserInteractionEnabled = true
        let dismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissController))
        dismissImageView.addGestureRecognizer(dismissTapGesture)
        
        view.addSubview(dismissImageView)
        dismissImageView.snp.makeConstraints { make in
            make.top.equalTo(centralImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalTo(140)
        }
    }
    
    @objc private func toggleImageOneTapped() {
        let currentState = UserDefaults.standard.bool(forKey: toggleKeyOne)
        let newState = !currentState
        UserDefaults.standard.setValue(newState, forKey: toggleKeyOne)
        toggleImageViewOne.image = getToggleImage(forKey: toggleKeyOne, trueImage: "HorussPathToggleOnLDMysticMaze", falseImage: "HorussPathToggleOffLDMysticMaze")
    }
    
    @objc private func toggleImageTwoTapped() {
        let currentState = UserDefaults.standard.bool(forKey: toggleKeyTwo)
        let newState = !currentState
        UserDefaults.standard.setValue(newState, forKey: toggleKeyTwo)
        toggleImageViewTwo.image = getToggleImage(forKey: toggleKeyTwo, trueImage: "HorussPathToggleOnLDMysticMaze", falseImage: "HorussPathToggleOffLDMysticMaze")
    }
    
    @objc private func dismissController() {
        performHorussPath_Actions(withSoundFileName: "horusSoundClickTrack01")
        dismiss(animated: true, completion: nil)
    }
    
    private func getToggleImage(forKey key: String, trueImage: String, falseImage: String) -> UIImage? {
        performHorussPath_Actions(withSoundFileName: "horusSoundClickTrack01")
        let state = UserDefaults.standard.bool(forKey: key)
        return UIImage(named: state ? trueImage : falseImage)
    }
}
