import UIKit
import SnapKit

final class HorussPathFinalControlLDMysticMazeViewController: UIViewController {
    
    private var backgroundImageView: UIImageView!
    private var centralImageView: UIImageView!
    private var toggleImageView: UIImageView!
    private var firstValueLabel: UILabel!
    private var secondValueLabel: UILabel!
    private var firstButtonImageView: UIImageView!
    private var secondButtonImageView: UIImageView!
    
    private let toggleKey = "HorussPathFinalToggleLDMysticMaze"
    private let firstValueKey = "HorussPathFinalValueOneLDMysticMaze"
    private let secondValueKey = "HorussPathFinalValueTwoLDMysticMaze"
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "HorussPathFinalToggleLDMysticMaze"){
            performHorussPath_Actions(withSoundFileName: "horusBadFinalSound")
        }else {
            performHorussPath_Actions(withSoundFileName: "horusHappyFinalSound")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        backgroundImageView = UIImageView(image: UIImage(named: "HorussPathFinalControlLDMysticMazeBackground"))
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        centralImageView = UIImageView(image: UIImage(named: "HorussPathFinalControlLDMysticMazeCentral"))
        centralImageView.contentMode = .scaleAspectFit
        view.addSubview(centralImageView)
        centralImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(300)
        }
        
        toggleImageView = UIImageView()
        toggleImageView.contentMode = .scaleAspectFit
        toggleImageView.image = getToggleImage()
        view.addSubview(toggleImageView)
        toggleImageView.snp.makeConstraints { make in
            make.bottom.equalTo(centralImageView.snp.top).inset(120)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(250)
        }
        
        firstValueLabel = UILabel()
        firstValueLabel.text = "\(UserDefaults.standard.integer(forKey: firstValueKey))"
        firstValueLabel.textColor = .white
        firstValueLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(firstValueLabel)
        firstValueLabel.snp.makeConstraints { make in
            make.top.equalTo(centralImageView.snp.top).inset(105)
            make.left.equalTo(centralImageView.snp.right).inset(120)
        }
        
        secondValueLabel = UILabel()
        secondValueLabel.text = "\(UserDefaults.standard.integer(forKey: secondValueKey))"
        secondValueLabel.textColor = .white
        secondValueLabel.font = UIFont.boldSystemFont(ofSize: 24)
        view.addSubview(secondValueLabel)
        secondValueLabel.snp.makeConstraints { make in
            make.top.equalTo(firstValueLabel.snp.bottom).offset(35)
            make.left.equalTo(centralImageView.snp.right).inset(120)
        }
        
        firstButtonImageView = UIImageView(image: UIImage(named: "HorussPathFinalButtonOneLDMysticMaze"))
        firstButtonImageView.contentMode = .scaleAspectFit
        firstButtonImageView.isUserInteractionEnabled = true
        let firstTapGesture = UITapGestureRecognizer(target: self, action: #selector(openFirstController))
        firstButtonImageView.addGestureRecognizer(firstTapGesture)
        
        view.addSubview(firstButtonImageView)
        firstButtonImageView.snp.makeConstraints { make in
            make.top.equalTo(centralImageView.snp.bottom).inset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalTo(140)
        }
        
        secondButtonImageView = UIImageView(image: UIImage(named: "HorussPathFinalButtonTwoLDMysticMaze"))
        secondButtonImageView.contentMode = .scaleAspectFit
        secondButtonImageView.isUserInteractionEnabled = true
        let secondTapGesture = UITapGestureRecognizer(target: self, action: #selector(openSecondController))
        secondButtonImageView.addGestureRecognizer(secondTapGesture)
        
        view.addSubview(secondButtonImageView)
        secondButtonImageView.snp.makeConstraints { make in
            make.top.equalTo(firstButtonImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalTo(140)
        }
    }
    
    private func getToggleImage() -> UIImage? {
        let state = UserDefaults.standard.bool(forKey: toggleKey)
        return UIImage(named: state ? "HorussPathFinalToggleOnLDMysticMaze" : "HorussPathFinalToggleOffLDMysticMaze")
    }
    
    @objc private func openFirstController() {
        performHorussPath_Actions(withSoundFileName: "horusSoundClickTrack01")
        let secondVC = HorussPathThirdMainLDMysticMazeViewController()
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
    @objc private func openSecondController() {
        performHorussPath_Actions(withSoundFileName: "horusSoundClickTrack01")
        let secondVC = HorussPathExtraLDMysticMazeViewController()
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true, completion: nil)
    }
}
