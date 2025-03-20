import UIKit
import SnapKit

final class HorussPathMysticMazeMainViewController: UIViewController {

    // MARK: - UI Elements
    private var horussPathMysticMazeTitleLabel: UIImageView!
    private var horussPathMysticMazeSubtitleLabel: UIImageView!
    private var horussPathMysticMazeAcceptImageView: UIImageView!
    private var horussPathMysticMazeDeclineImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHorussPathMysticMazeOrientation()
        setupHorussPathMysticMazeView()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { _ in
            self.updateHorussPathMysticMazeLayout()
        })
    }
    
    // MARK: - Helper Methods
    private var isHorussPathMysticMazePortrait: Bool {
        return UIScreen.main.bounds.height > UIScreen.main.bounds.width
    }
    
    // MARK: - Setup Methods
    private func setupHorussPathMysticMazeView() {
        applyHorussPathMysticMazeBackground()
        configureHorussPathMysticMazeUIElements()
        addHorussPathMysticMazeConstraints()
        attachHorussPathMysticMazeGestures()
    }
    
    private func configureHorussPathMysticMazeOrientation() {
        (UIApplication.shared.delegate as? AppDelegate)?.horussPathMysticMazeOr = .all
    }
    
    private func applyHorussPathMysticMazeBackground() {
        let bgImageView = UIImageView(image: UIImage(named: "HorussPathMysticMazeBackground"))
        bgImageView.contentMode = .scaleAspectFill
        view.addSubview(bgImageView)
        bgImageView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func configureHorussPathMysticMazeUIElements() {
        horussPathMysticMazeTitleLabel = UIImageView(image: isHorussPathMysticMazePortrait ? UIImage(named: "HorussPathMysticMazeTitlePortrait") : UIImage(named: "HorussPathMysticMazeTitleLandscape"))
        horussPathMysticMazeTitleLabel.contentMode = .scaleAspectFit
        
        horussPathMysticMazeSubtitleLabel = UIImageView(image: isHorussPathMysticMazePortrait ? UIImage(named: "HorussPathMysticMazeSubtitlePortrait") : UIImage(named: "HorussPathMysticMazeSubtitleLandscape"))
        horussPathMysticMazeSubtitleLabel.contentMode = .scaleAspectFit
        
        horussPathMysticMazeAcceptImageView = UIImageView(image: isHorussPathMysticMazePortrait ? UIImage(named: "HorussPathMysticMazeAcceptPortrait") : UIImage(named: "HorussPathMysticMazeAcceptLandscape"))
        horussPathMysticMazeAcceptImageView.contentMode = .scaleAspectFit
        horussPathMysticMazeAcceptImageView.isUserInteractionEnabled = true
        
        horussPathMysticMazeDeclineImageView = UIImageView(image: UIImage(named: "HorussPathMysticMazeDecline"))
        horussPathMysticMazeDeclineImageView.contentMode = .scaleAspectFit
        horussPathMysticMazeDeclineImageView.isUserInteractionEnabled = true
        
        [horussPathMysticMazeTitleLabel,
         horussPathMysticMazeSubtitleLabel,
         horussPathMysticMazeAcceptImageView,
         horussPathMysticMazeDeclineImageView].forEach { view.addSubview($0) }
    }
    
    private func addHorussPathMysticMazeConstraints() {
        let insetPrimary = isHorussPathMysticMazePortrait ? 14 : 70
        let insetSecondary = isHorussPathMysticMazePortrait ? 30 : 140
        let insetTertiary = isHorussPathMysticMazePortrait ? 15 : 0
        
        horussPathMysticMazeTitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(insetPrimary)
            make.centerY.equalToSuperview().multipliedBy(isHorussPathMysticMazePortrait ? 1.3 : 1.0)
        }
        
        horussPathMysticMazeSubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(horussPathMysticMazeTitleLabel.snp.bottom).inset(insetTertiary)
            make.leading.trailing.equalToSuperview().inset(insetSecondary)
        }
        
        horussPathMysticMazeAcceptImageView.snp.makeConstraints { make in
            make.top.equalTo(horussPathMysticMazeSubtitleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(isHorussPathMysticMazePortrait ? 280 : 550)
        }
        
        horussPathMysticMazeDeclineImageView.snp.makeConstraints { make in
            make.top.equalTo(horussPathMysticMazeAcceptImageView.snp.bottom).offset(19)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(66)
        }
    }
    
    private func attachHorussPathMysticMazeGestures() {
        let acceptTapGesture = UITapGestureRecognizer(target: self, action: #selector(triggerHorussPathMysticMazeAcceptTap))
        horussPathMysticMazeAcceptImageView.addGestureRecognizer(acceptTapGesture)
        
        let declineTapGesture = UITapGestureRecognizer(target: self, action: #selector(triggerHorussPathMysticMazeDeclineTap))
        horussPathMysticMazeDeclineImageView.addGestureRecognizer(declineTapGesture)
    }
    
    private func updateHorussPathMysticMazeLayout() {
        horussPathMysticMazeAcceptImageView.image = isHorussPathMysticMazePortrait ? UIImage(named: "HorussPathMysticMazeAcceptPortrait") : UIImage(named: "HorussPathMysticMazeAcceptLandscape")
        horussPathMysticMazeTitleLabel.image = isHorussPathMysticMazePortrait ? UIImage(named: "HorussPathMysticMazeTitlePortrait") : UIImage(named: "HorussPathMysticMazeTitleLandscape")
        horussPathMysticMazeSubtitleLabel.image = isHorussPathMysticMazePortrait ? UIImage(named: "HorussPathMysticMazeSubtitlePortrait") : UIImage(named: "HorussPathMysticMazeSubtitleLandscape")
        
        horussPathMysticMazeTitleLabel.snp.removeConstraints()
        horussPathMysticMazeSubtitleLabel.snp.removeConstraints()
        horussPathMysticMazeAcceptImageView.snp.removeConstraints()
        horussPathMysticMazeDeclineImageView.snp.removeConstraints()
        
        addHorussPathMysticMazeConstraints()
    }
    
    // MARK: - Actions
    @objc private func triggerHorussPathMysticMazeAcceptTap() {
        print("HorussPathMysticMaze notifications enabled.")
    }
    
    @objc private func triggerHorussPathMysticMazeDeclineTap() {
        print("HorussPathMysticMaze notifications declined.")
    }
}
