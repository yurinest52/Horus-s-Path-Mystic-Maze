import UIKit
import SnapKit
final class HorussPathSecondNetworkLDMysticMazeViewController: UIViewController {
    
    private var backgroundImageView: UIImageView!
    private var centralImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHorussPathMysticMazeOrientation()
        setupView()
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
        
        centralImageView = UIImageView(image: UIImage(named: "HorussPathSecondNetworkLDMysticMazeCentral"))
        centralImageView.contentMode = .scaleAspectFit
        view.addSubview(centralImageView)
        centralImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(300)
        }
    }
}
