import SpriteKit
class HorussPathExtraLDMysticMazeViewControllerScene: SKScene {
    
    weak var horussPathExtraLDMysticMazeViewControllerScene: HorussPathExtraLDMysticMazeViewController?
    
    var backgroundHorussPathExtraLDMysticMazeView = SKSpriteNode()
    var platformaForHorussPathExtraLDMysticMazeView = SKSpriteNode()
    
    let horusPositionTypeOnX = TypesOfCoordinates.horusPositionTypeOnX.horusValueGame
    let horusPositionTypeOnY = TypesOfCoordinates.horusPositionTypeOnY.horusValueGame
    var allElementsArray = [HorussPathExtraLDMysticMazeElementNode]()
    
    var animationEnded = false
    var pathInProcessTappedElement = false
    var isFirstTouchContent = true
    var textLabel1 = SKLabelNode(fontNamed: "Helvetica-Bold")
    var textLabel2 = SKLabelNode(fontNamed: "Helvetica-Bold")
    var scoreHorusGame = 0
    var lvlHorusGame = 0
    var currentElement: HorussPathExtraLDMysticMazeElementNode?
    var startHorusMysticStatusType: GameElementType?
    var gradeGameArray = [HorussPathExtraLDMysticMazeElementNode]()
    func addImageWithTextOverlay() {
        let imageNode = SKSpriteNode(imageNamed: "horusRightCornerInfoView")
        imageNode.size = CGSize(width: 150, height: 38)
        imageNode.position = CGPoint(x: size.width - imageNode.size.width / 2 - 30,
                                     y: size.height - imageNode.size.height / 2 - 40)
        imageNode.zPosition = 10
        
        addChild(imageNode)
        
        textLabel1.fontColor = .white
        textLabel1.fontSize = 16
        textLabel1.position = CGPoint(x: 43, y: -6)
        textLabel1.zPosition = 11
        
        
        textLabel2.fontColor = .white
        textLabel2.fontSize = 16
        textLabel2.position = CGPoint(x: -45, y: -7)
        textLabel2.zPosition = 11
        
        imageNode.addChild(textLabel1)
        imageNode.addChild(textLabel2)
        updateText()

    }


     func updateText() {
         textLabel1.text = "\(scoreHorusGame)"
         textLabel2.text = "\(lvlHorusGame)"
     }
    override func sceneDidLoad() {
        super.sceneDidLoad()
        broadcastHorussPathExtraLDMysticMazeScene()
        addImageWithTextOverlay()
    }

   

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isFirstTouchContent {
            startNewHorussPathExtraLDMysticMazeLevel()
            isFirstTouchContent.toggle()
        }

        if let touch = touches.first {
            if let touchedThisElement = nodes(at: touch.location(in: self)).first(where: { $0.name == HorussPathExtraLDMysticMazeElementNames.horusPathMazeViewAtrract }) as? HorussPathExtraLDMysticMazeElementNode {
                guard animationEnded else { return }
                if touchedThisElement.type == .horussPathExtraLDMysticMazeStartPointElement {
                    currentElement = touchedThisElement
                    startHorusMysticStatusType = .horussPathExtraLDMysticMazeStartPointElement
                    pathInProcessTappedElement = true
                }
                if touchedThisElement.type == .horussPathExtraLDMysticMazeFinishPointElement {
                    currentElement = touchedThisElement
                    startHorusMysticStatusType = .horussPathExtraLDMysticMazeFinishPointElement
                    pathInProcessTappedElement = true
                }
            }
        }
    }


    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if pathInProcessTappedElement {
                if let nextSelectedElement = nodes(at: touch.location(in: self)).first(where: { $0.name == HorussPathExtraLDMysticMazeElementNames.horusPathMazeViewAtrract }) as? HorussPathExtraLDMysticMazeElementNode {
                    if nextSelectedElement.type == .horussPathExtraLDMysticMazeLockContentElement,
                       nextSelectedElement.elementPositionX == currentElement?.elementPositionX || nextSelectedElement.elementPositionY == currentElement?.elementPositionY {
                        nextSelectedElement.setupHorussPathExtraLDMysticMazeSelectedElements()
                        gradeGameArray.append(nextSelectedElement)
                        currentElement = nextSelectedElement
                    }
                    if nextSelectedElement.elementPositionX != currentElement?.elementPositionX, nextSelectedElement.elementPositionY != currentElement?.elementPositionY {
                        cancelHorussPathExtraLDMysticMazeSelection()
                    }
                    if nextSelectedElement.type == .horussPathExtraLDMysticMazeUnlockContentElement, nextSelectedElement != currentElement {
                        cancelHorussPathExtraLDMysticMazeSelection()
                    }
                    if nextSelectedElement.type == .horussPathExtraLDMysticMazeDangerousElement {
                        finishHorussPathExtraLDMysticMazeGame()
                    }
                }
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if let endedElement = nodes(at: touch.location(in: self)).first(where: { $0.name == HorussPathExtraLDMysticMazeElementNames.horusPathMazeViewAtrract }) as? HorussPathExtraLDMysticMazeElementNode {
                if startHorusMysticStatusType == .horussPathExtraLDMysticMazeStartPointElement, endedElement.type == .horussPathExtraLDMysticMazeFinishPointElement, pathInProcessTappedElement {
                    excellentHorussPathExtraLDMysticMazeMatchTrip()
                }
                if startHorusMysticStatusType == .horussPathExtraLDMysticMazeFinishPointElement, endedElement.type == .horussPathExtraLDMysticMazeStartPointElement, pathInProcessTappedElement {
                    excellentHorussPathExtraLDMysticMazeMatchTrip()
                }
            }
        }
        cancelHorussPathExtraLDMysticMazeSelection()
    }
}

enum TypesOfCoordinates {
    case horusPositionTypeOnX
    case horusPositionTypeOnY

    var horusValueGame: [Int] {
        switch self {
        case .horusPositionTypeOnX:  return [0, 1, 2, 3]
        case .horusPositionTypeOnY:    return [0, 1, 2, 3]
        }
    }
}

extension HorussPathExtraLDMysticMazeViewControllerScene {

    func broadcastHorussPathExtraLDMysticMazeScene() {
        arrangeHorussPathExtraLDMysticMazeBackground()
        arrangePlatformaForHorussPathExtraLDMysticMazeView()
        developElementsMatrix()
    }

    func excellentHorussPathExtraLDMysticMazeMatchTrip() {
        horussPathExtraLDMysticMazeLevelExcellence()
        pathInProcessTappedElement = false
    }

    private func editGradeGameLabel() {
        performHorussPath_Actions(withSoundFileName: "horusSoundClickTrack01")
        scoreHorusGame+=10
        lvlHorusGame+=1
        updateText()
    }



    func cancelHorussPathExtraLDMysticMazeSelection() {
        gradeGameArray.removeAll()
        pathInProcessTappedElement = false
        currentElement = nil
        allElementsArray.forEach { element in
            if element.type == .horussPathExtraLDMysticMazeUnlockContentElement {
                element.cancelHorussPathExtraLDMysticMazeSelection()
            }
        }
    }

    private func horussPathExtraLDMysticMazeLevelExcellence() {
        editGradeGameLabel()
        
        run(SKAction.run {
            self.arrangeHorussPathExtraLDMysticMazePlatform()
        }) {
            self.run(SKAction.wait(forDuration: 0.4)) {
                self.startNewHorussPathExtraLDMysticMazeLevel()
            }
        }
    }

    func rechargeHorussPathExtraLDMysticMazeAdventure() {
        arrangeHorussPathExtraLDMysticMazePlatform()
        isFirstTouchContent = true
        allElementsArray.forEach { element in
            if element.type == .horussPathExtraLDMysticMazeLockContentElement {
                cancelHorussPathExtraLDMysticMazeSelection()
            }
        }
    }

    func finishHorussPathExtraLDMysticMazeGame() {
        UserDefaults.standard.setValue(false, forKey: "HorussPathFinalToggleLDMysticMaze")
        UserDefaults.standard.setValue(scoreHorusGame, forKey: "HorussPathFinalValueOneLDMysticMaze")
        if UserDefaults.standard.integer(forKey: "HorussPathFinalValueOneLDMysticMaze") > UserDefaults.standard.integer(forKey: "HorussPathFinalValueTwoLDMysticMaze") {
            UserDefaults.standard.setValue(scoreHorusGame, forKey: "HorussPathFinalValueTwoLDMysticMaze")
            UserDefaults.standard.setValue(true, forKey: "HorussPathFinalToggleLDMysticMaze")
        }
        horussPathExtraLDMysticMazeViewControllerScene?.openAnotherWinPathMysticController()
    }

    func startNewHorussPathExtraLDMysticMazeLevel() {
        self.animationEnded = false
        run(SKAction.run {
            self.calculateHorussPathExtraLDMysticMazeElementPoints()
        }) {
            self.run(SKAction.wait(forDuration: 0.5)) {
                self.allElementsArray.forEach { element in
                    if element.type == .horussPathExtraLDMysticMazeDangerousElement {
                        element.horussPathExtraLDMysticMazeBombClose {
                            self.animationEnded = true
                        }
                    }
                }
            }
        }
    }

    private func arrangeHorussPathExtraLDMysticMazePlatform() {
        allElementsArray.forEach { element in
            element.horussPathExtraLDMysticMazeClearElement()
        }
    }

    private func calculateHorussPathExtraLDMysticMazeElementPoints() {
        let leftColumn = allElementsArray.filter( { $0.elementPositionX == 0 } )
        let rightColumn = allElementsArray.filter( { $0.elementPositionX == 3 } )
        leftColumn.randomElement()?.arrangeHorussPathExtraLDMysticMazeStartPointElement()
        rightColumn.randomElement()?.arrangeHorussPathExtraLDMysticMazeFinishPointElement()
        arrangeHorussPathExtraLDMysticMazeDangerousElement()
    }

    func arrangeHorussPathExtraLDMysticMazeDangerousElement() {
        let firstColumn = allElementsArray.filter( { $0.elementPositionX == 0 } )
        let secondColumn = allElementsArray.filter( { $0.elementPositionX == 1 } )
        let thirdColumn = allElementsArray.filter( { $0.elementPositionX == 2 } )
        let fourthColumn = allElementsArray.filter( { $0.elementPositionX == 3 } )

        guard let leftPoint = firstColumn.first(where: { $0.type == .horussPathExtraLDMysticMazeStartPointElement }),
              let rightPoint = fourthColumn.first(where: { $0.type == .horussPathExtraLDMysticMazeFinishPointElement }) else {
            return
        }
        let firstBomb = firstColumn.shuffled().first(where: { $0.type != .horussPathExtraLDMysticMazeStartPointElement && abs($0.elementPositionY - leftPoint.elementPositionY) > 1 })
        let firstSpace = firstColumn.first(where: { $0.type == .horussPathExtraLDMysticMazeLockContentElement && abs($0.elementPositionY - leftPoint.elementPositionY) == 1})
        let secondBomb = secondColumn.shuffled().first(where: { $0.elementPositionY != firstSpace?.elementPositionY } )
        let thirdBomb = secondColumn.shuffled().first(where: { $0.elementPositionY != firstSpace?.elementPositionY && $0.elementPositionY != secondBomb?.elementPositionY } )
        let fourthBomb = thirdColumn.shuffled().first(where: { $0.elementPositionY == thirdBomb?.elementPositionY })

        firstBomb?.arrangeHorussPathExtraLDMysticMazeDangerousElement()
        secondBomb?.arrangeHorussPathExtraLDMysticMazeDangerousElement()
        thirdBomb?.arrangeHorussPathExtraLDMysticMazeDangerousElement()
        fourthBomb?.arrangeHorussPathExtraLDMysticMazeDangerousElement()

        if rightPoint.elementPositionY == 1 || rightPoint.elementPositionY == 2 {
            let fifthBomb = fourthColumn.shuffled().first(where: { $0.type != .horussPathExtraLDMysticMazeFinishPointElement && abs($0.elementPositionY - rightPoint.elementPositionY) > 1 })
            fifthBomb?.arrangeHorussPathExtraLDMysticMazeDangerousElement()
        }
    }

    private func arrangeHorussPathExtraLDMysticMazeBackground() {
        let backgroundGame = SKSpriteNode(imageNamed: "HorussPathExtraLDMysticMazeBackground")
        let scale = max(frame.width / backgroundGame.frame.width, frame.height / backgroundGame.frame.height)
        backgroundGame.setScale(scale)
        backgroundGame.position = CGPoint(x: frame.midX, y: frame.midY)
        backgroundGame.zPosition = -2
        self.backgroundHorussPathExtraLDMysticMazeView = backgroundGame
        addChild(backgroundGame)
    }

    private func arrangePlatformaForHorussPathExtraLDMysticMazeView() {
        platformaForHorussPathExtraLDMysticMazeView = SKSpriteNode(imageNamed: "HorussPathExtraLDMysticMazePlatform")
        platformaForHorussPathExtraLDMysticMazeView.setScale(UIScreen.main.bounds.size.height > 801 ? 0.33 : 0.35)
        platformaForHorussPathExtraLDMysticMazeView.zPosition = -1
        platformaForHorussPathExtraLDMysticMazeView.position = CGPoint(x: frame.midX, y: frame.midY-90)
        addChild(platformaForHorussPathExtraLDMysticMazeView)
    }

    private func developElementsMatrix() {
        let elementNode = HorussPathExtraLDMysticMazeElementNode(type: .horussPathExtraLDMysticMazeLockContentElement, x: 10, y: 10)
        let elementWidth = elementNode.horussPathExtraLDMysticMazeReceiveElementWidth()
        let startXPosition = frame.minX + elementWidth * 1.05
        let inset = ((frame.width - elementWidth * 2) / Double(horusPositionTypeOnX.count - 1)) * 0.96

        let startYPosition = frame.midY + inset * 1.26 - 80
        horusPositionTypeOnY.forEach { posY in
            developHorisontalElements(inset: inset,
                                  yPos: posY,
                                  startX: startXPosition,
                                  startY: startYPosition - inset * CGFloat(posY))
        }
    }

    private func developHorisontalElements(inset: CGFloat, yPos: Int, startX: CGFloat, startY: CGFloat) {
        horusPositionTypeOnX.forEach { xPos in
            let element = HorussPathExtraLDMysticMazeElementNode(type: .horussPathExtraLDMysticMazeLockContentElement, x: xPos, y: yPos)
            element.position = CGPoint(x: startX + inset * CGFloat(xPos), y: startY)
            addChild(element)
            allElementsArray.append(element)
        }
    }
}

final class HorussPathExtraLDMysticMazeElementNode: SKNode {
    var type: GameElementType
    var elementPositionX: Int
    var elementPositionY: Int

    private var elementTexture: SKTexture
    private var elementNode = SKSpriteNode()
    private var filledElement = SKSpriteNode()

    init(type: GameElementType, x: Int, y: Int) {
        self.type = type
        self.elementPositionX = x
        self.elementPositionY = y
        elementTexture = SKTexture(imageNamed: "HorussPathExtraLDMysticMazeLockContent")
        elementNode = SKSpriteNode(texture: elementTexture)
        elementNode.zPosition = 3
        super.init()
        horussPathExtraLDMysticMazeElementConfiguration()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func horussPathExtraLDMysticMazePointAppearing() {
        let fadeInAction = SKAction.fadeIn(withDuration: 0.3)
        filledElement.run(fadeInAction)
    }

    private func horussPathExtraLDMysticMazePointFadeOut() {
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.3)
        filledElement.run(fadeOutAction)
    }

    func horussPathExtraLDMysticMazeBombOpen() {
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.3)
        elementNode.run(fadeOutAction)
    }

    func horussPathExtraLDMysticMazeBombClose(animationCompletion: (() -> ())? = nil) {
        let fadeInAction = SKAction.fadeIn(withDuration: 0.3)
        elementNode.run(fadeInAction) {
            animationCompletion?()
        }
    }

    private func horussPathExtraLDMysticMazeElementConfiguration() {
        self.name = HorussPathExtraLDMysticMazeElementNames.horusPathMazeViewAtrract
        self.zPosition = 2
        self.addChild(elementNode)
        self.setScale(0.36)
    }

    func horussPathExtraLDMysticMazeReceiveElementWidth() -> CGFloat {
        return elementNode.frame.width * 0.42
    }

    func horussPathExtraLDMysticMazeClearElement() {
        horussPathExtraLDMysticMazePointFadeOut()
        horussPathExtraLDMysticMazeBombClose {
            self.filledElement.removeFromParent()
            self.type = .horussPathExtraLDMysticMazeLockContentElement
            self.enumerateChildNodes(withName: HorussPathExtraLDMysticMazeElementNames.horusPathMazeViewPower) { additionalElement, _ in
                additionalElement.removeFromParent()
            }
        }
    }

    func arrangeHorussPathExtraLDMysticMazeDangerousElement() {
        self.type = .horussPathExtraLDMysticMazeDangerousElement
        filledElement = SKSpriteNode(texture: SKTexture(imageNamed: "HorussPathExtraLDMysticMazeBomb"))
        filledElement.name = HorussPathExtraLDMysticMazeElementNames.horusPathMazeViewPower
        filledElement.zPosition = 2
        self.addChild(filledElement)
        horussPathExtraLDMysticMazeBombOpen()
    }

    func setupHorussPathExtraLDMysticMazeSelectedElements() {
        type = .horussPathExtraLDMysticMazeUnlockContentElement
        elementNode.texture = SKTexture(imageNamed: "HorussPathExtraLDMysticMazeUnlockContent")
    }

    func cancelHorussPathExtraLDMysticMazeSelection() {
        elementNode.texture = SKTexture(imageNamed: "HorussPathExtraLDMysticMazeLockContent")
        self.type = .horussPathExtraLDMysticMazeLockContentElement
    }

    func arrangeHorussPathExtraLDMysticMazeStartPointElement() {
        self.type = .horussPathExtraLDMysticMazeStartPointElement
        filledElement = SKSpriteNode(texture: SKTexture(imageNamed: "HorussPathExtraLDMysticMazeSymbol"))
        filledElement.name = HorussPathExtraLDMysticMazeElementNames.horusPathMazeViewPower
        filledElement.zPosition = 5
        filledElement.alpha = 0
        self.addChild(filledElement)
        horussPathExtraLDMysticMazePointAppearing()
    }

    func arrangeHorussPathExtraLDMysticMazeFinishPointElement() {
        self.type = .horussPathExtraLDMysticMazeFinishPointElement
        filledElement = SKSpriteNode(texture: SKTexture(imageNamed: "HorussPathExtraLDMysticMazeSymbol"))
        filledElement.name = HorussPathExtraLDMysticMazeElementNames.horusPathMazeViewPower
        filledElement.zPosition = 5
        filledElement.alpha = 0
        self.addChild(filledElement)
        horussPathExtraLDMysticMazePointAppearing()
    }
}

enum GameElementType {
    case horussPathExtraLDMysticMazeLockContentElement
    case horussPathExtraLDMysticMazeUnlockContentElement
    case horussPathExtraLDMysticMazeStartPointElement
    case horussPathExtraLDMysticMazeFinishPointElement
    case horussPathExtraLDMysticMazeDangerousElement
}

struct HorussPathExtraLDMysticMazeElementNames {
    static let horusPathMazeViewAtrract = "HorussPathExtraLDMysticMazeBomb"
    static let horusPathMazeViewPower = "horussPathExtraLDMysticMazeAdditionalElement"
}
