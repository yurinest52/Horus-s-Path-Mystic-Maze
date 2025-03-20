import UIKit
import SnapKit
import AVFoundation
import AudioToolbox

func configureHorussPath_AudioSession() {
    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)
    } catch {
        print("Failed to set up HorussPath audio session: \(error)")
    }
}

func playHorussPath_Sound(named audioFileName: String) {
    guard let url = Bundle.main.url(forResource: audioFileName, withExtension: "mp3") else { return }
    do {
        horussPathPlayer = try AVAudioPlayer(contentsOf: url)
        horussPathPlayer?.play()
    } catch {
        print("Error playing HorussPath sound: \(error)")
    }
}

func triggerHorussPath_Vibration() {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
}

var horussPathPlayer: AVAudioPlayer?

func performHorussPath_Actions(withSoundFileName audioFileName: String) {
    let isSoundEnabled = UserDefaults.standard.bool(forKey: "ToggleKey1HorussPathMysticMaze")
    let isVibrationEnabled = UserDefaults.standard.bool(forKey: "ToggleKey2HorussPathMysticMaze")
    
    if isSoundEnabled {
        playHorussPath_Sound(named: audioFileName)
    }
    if isVibrationEnabled {
        triggerHorussPath_Vibration()
    }
}

final class HorussPathThirdMainLDMysticMazeViewController: UIViewController {
    
    private var backgroundImageView: UIImageView!
    private var centralImageView: UIImageView!
    private var safariImageView: UIImageView!
    private var extraControllerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHorussPathMysticMazeOrientation()
        setupView()
    }
    private func configureHorussPathMysticMazeOrientation() {
        (UIApplication.shared.delegate as? AppDelegate)?.horussPathMysticMazeOr = .portrait
    }
    private func setupView() {
        backgroundImageView = UIImageView(image: UIImage(named: "HorussPathFirstLDMysticMazeBackground"))
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        centralImageView = UIImageView(image: UIImage(named: "HorussPathThirdMainLDMysticMazeCentral"))
        centralImageView.contentMode = .scaleAspectFit
        view.addSubview(centralImageView)
        centralImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(300)
        }
        
        safariImageView = UIImageView(image: UIImage(named: "HorussPathThirdMainLDMysticMazeSafari"))
        safariImageView.contentMode = .scaleAspectFit
        safariImageView.isUserInteractionEnabled = true
        view.addSubview(safariImageView)
        safariImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(50)
            make.left.equalToSuperview().offset(20)
            make.width.height.equalTo(60)
        }
        let safariTap = UITapGestureRecognizer(target: self, action: #selector(openSafari))
        safariImageView.addGestureRecognizer(safariTap)
        
        extraControllerImageView = UIImageView(image: UIImage(named: "HorussPathThirdMainLDMysticMazeExtra"))
        extraControllerImageView.contentMode = .scaleAspectFit
        extraControllerImageView.isUserInteractionEnabled = true
        view.addSubview(extraControllerImageView)
        extraControllerImageView.snp.makeConstraints { make in
            make.top.equalTo(centralImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalTo(140)
        }
        let extraTap = UITapGestureRecognizer(target: self, action: #selector(openExtraController))
        extraControllerImageView.addGestureRecognizer(extraTap)
    }
    
    @objc private func openSafari() {
        if let url = URL(string: "https://www.example.com") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc private func openExtraController() {
        performHorussPath_Actions(withSoundFileName: "horusSoundClickTrack01")
        let extraVC = HorussPathExtraLDMysticMazeViewController()
        extraVC.modalPresentationStyle = .fullScreen
        present(extraVC, animated: true, completion: nil)
    }
}

