//
//  GameScene.swift
//  dungeon2
//
//  Created by richard on 02/03/2017.
//  Copyright (c) 2017 richard. All rights reserved.
//

import SpriteKit

enum TypeTuile:String {
    case WR // Mur Simple Droite
    case WA //PAs de mur
    case WL // Mur simple gauche
   
    case WB  // Musr simple back
    case WTN //Wall top troue nord
    case W2LT // wall gauche et top
    case W2RTN // Wall 2m ur droite top et troue au nord
    case W2RTE // Est
    case FOS //Fosse
    case WBS
    case WRE
 
    case W2LBS
    case WLO

    case W2RBS
    case W2RB
    case WRLE
    case WT
    case W2LR
    case W2LB

    case W2TB
    case W2RT

    case W2TBN
    case W2LRE
    case W2LRO
    case W2LTN
    case W2LBO
    case W2TBS
    
    
    func convertRight()->TypeTuile{
        var res = "WA"
        if (self == .WA ){
            return .WA
        }
        else if self == .FOS {
            return .FOS
        }
        else {
            res = "W"
            if self.rawValue.containsString("2") { res = res + "2"}
            if self.rawValue.containsString("B") { res = res + "L"}
            if self.rawValue.containsString("T") { res = res + "R"}
            if self.rawValue.containsString("L") { res = res + "T"}
            if self.rawValue.containsString("R") { res = res + "B"}
         
            
            
            
            
            
            if self.rawValue.containsString("N") { res = res + "E"}
            if self.rawValue.containsString("O") { res = res + "N"}
            if self.rawValue.containsString("S") { res = res + "O"}
            if self.rawValue.containsString("E") { res = res + "S"}
            
        }
        
        return TypeTuile.init(rawValue: res)!
        
        
    }
    func convertLeft()->TypeTuile{
        
        var res = "WA"
        if (self == .WA ){
            return .WA
        }
        else if self == .FOS {
            return .FOS
        }
        else {
            res = "W"
            if self.rawValue.containsString("2") { res = res + "2"}
            if self.rawValue.containsString("T") { res = res + "L"}
            if self.rawValue.containsString("B") { res = res + "R"}
            if self.rawValue.containsString("R") { res = res + "T"}
            if self.rawValue.containsString("L") { res = res + "B"}

    

          
            
            if self.rawValue.containsString("N") { res = res + "O"}
            if self.rawValue.containsString("O") { res = res + "S"}
            if self.rawValue.containsString("S") { res = res + "E"}
            if self.rawValue.containsString("E") { res = res + "N"}
            
        }
        
        return TypeTuile.init(rawValue: res)!
    }
  
    
    func hasWOnTop()->Bool{
        if self.rawValue.containsString("T") {return true}
        return false
        
    }
    func hasWOnBottom()->Bool{
        if self.rawValue.containsString("B") {return true}
        return false
        
    }
    func hasWOnRigth()->Bool{
        if self.rawValue.containsString("R") {return true}
        return false
        
    }
    func hasWOnLeft()->Bool{
        if self.rawValue.containsString("L") {return true}
        return false
        
    }
    func hasLinkOnRight(tuile:TypeTuile)->Bool{
        if self.rawValue.containsString("R") || tuile.rawValue.containsString("L") {
            return false
        }
        return true
    }
    func hasLinkOnTop(tuile:TypeTuile)->Bool{
        if self.rawValue.containsString("T") || tuile.rawValue.containsString("B") {
            return false
        }
        return true
    }

   /* func hasLink(tuile:TypeTuile)->Bool{
        if self.rawValue.containsString("L") && tuile.rawValue.containsString("R") {
            return false
        }
        if self.rawValue.containsString("R") && tuile.rawValue.containsString("L") {
            return false
        }
        if self.rawValue.containsString("B") && tuile.rawValue.containsString("T") {
            return false
        }
        if self.rawValue.containsString("T") && tuile.rawValue.containsString("B") {
            return false
        }
        
        return  true
    }*/
    static func rotateMatriceLeft(inout matrice:[[TypeTuile]]){
        var c = 0
        var l = 0
        var res :  [[TypeTuile]] = [[.WA,.WA,.WA,.WA,.WA],
                                    [.WA,.WA,.WA,.WA,.WA],
                                    [.WA,.WA,.WA,.WA,.WA],
                                    [.WA,.WA,.WA,.WA,.WA],
                                    [.WA,.WA,.WA,.WA,.WA]]
        
        
        
        for colonne in (0...4) {
            c = 0
            for ligne in (0...4).reverse() {
                let t = matrice[ligne][colonne]
                res[l][c] = t
                c = c + 1
            }
            l = l  + 1
            
        }
        c = 0
        l = 0
        debugPrint("-->convert ")
        //Convert data after rotation
        for ligne in res{
            c = 0
            for col in ligne{
                
                matrice[l][c]  = col.convertLeft()
                //matrice[l][c]  = col
                c = c + 1
            }
            l = l  + 1
        }
        
    }
    static func rotateMatriceRight(inout matrice:[[TypeTuile]]){
        var c = 0
        var l = 0
        var res :  [[TypeTuile]] = [[.WA,.WA,.WA,.WA,.WA],
                              [.WA,.WA,.WA,.WA,.WA],
                              [.WA,.WA,.WA,.WA,.WA],
                              [.WA,.WA,.WA,.WA,.WA],
                              [.WA,.WA,.WA,.WA,.WA]]
        
        
      
        for colonne in (0...4).reverse() {
            c = 0
            for ligne in (0...4) {
                let t = matrice[ligne][colonne]
                res[l][c] = t
                c = c + 1
            }
            l = l  + 1
            
        }
        c = 0
        l = 0
        debugPrint("-->convert ")
        //Convert data after rotation
        for ligne in res{
            c = 0
            for col in ligne{
                
                matrice[l][c]  = col.convertRight()
                //matrice[l][c]  = col
                c = c + 1
            }
            l = l  + 1
        }
        
       
        
    }

    
}

class tuile{
    /*class func factory(type:Int){
        var type:TypeTuile
        switch (type){
            case
        }
        
    }*/
    
    var type : TypeTuile = .WA
    
}

class  TuileMurBas{
    
    
    func draw(x:CGFloat,y:CGFloat){
        /*let barra = SKShapeNode(rectOfSize: CGSize(width: cote, height: cote))
        barra.name = "bar"
        barra.strokeColor = SKColor.whiteColor()
        barra.lineWidth = 3
        let x = ((carte.position.x)  + CGFloat ( ligne * cote ) )
        let y = (carte.position.y) + CGFloat ( colonne * cote )
        barra.position = CGPoint(x:x,y:y )
        barra.zPosition =  10*/
    }
}
enum typeLien{
    case normal
    case fosse
    case herse
}
struct arc{
    var c1 : Int
    var l1 : Int
    var c2 : Int
    var l2 : Int
    var type : typeLien
}

class GameScene: SKScene {
    
    
    var listeImageToReinit = [SKNode]()
    
    var carteRotation =  0
    let desCarte1 : [[Int]] = [[1,0,0,1,0],
                                [0,0,0,0,0],
                                [0,0,0,0,0],
                                [1,27,23,23,23],
                                [1,25,0,30,31]]
   var  descCarte1 : [[TypeTuile]] = [
                                    [.WL,.W2TB,.W2TBN,.WB,.WR],
                                    [.W2LR,.W2LB,.W2RBS,.W2LRE,.WLO],
                                    [.WR,.W2LT,.WT,.WT,.FOS],
                                    [.FOS,.WBS,.WB,.WB,.WB],
                                    [.WA,.WTN,.WR,.W2LT,.W2RTE]]
    var  listeArc : [arc] = [arc]()
    //Test TypeTuile(rawValue:"WT")
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        /*let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)*/
        
        self.userInteractionEnabled = true
        drawCadre()
        calcArc()
        drawArc()
    }
    func draWLine(x1:CGFloat,y1:CGFloat,x2:CGFloat,y2:CGFloat){
        let ref = CGPathCreateMutable()
        CGPathMoveToPoint(ref, nil, x1,y1)
        
        CGPathAddLineToPoint(ref, nil, x2,y2)
        let shape = SKShapeNode()
        shape.path = ref
        shape.strokeColor = NSColor.cyanColor()
        shape.alpha = 0.8
        shape.zPosition = 10
        shape.lineWidth = 4
        addChild(shape)
        listeImageToReinit.append(shape)
        
    }
    
    func drawArc(){
        let carte = (self.childNodeWithName("carte1"))!
        let largeur  = carte.frame.width
        let hauteur  = carte.frame.height
        let cote = Int(largeur / 5)
        for var arc  in listeArc{
            let y1 = ((carte.position.x)  + CGFloat ( ((arc.l1-2) * cote ) ))
            
            let x1 = ((carte.position.y) + CGFloat ( ((arc.c1-2) * cote) ))
            let y2 = ((carte.position.x)  + CGFloat ( ((arc.l2-2) * cote ) ))
            
            let x2 = ((carte.position.y) + CGFloat ( ((arc.c2-2) * cote) ))
            
           draWLine(x1,y1: y1, x2: x2, y2: y2)
           
            
        }
    }
    func calcArc(){
        listeArc.removeAll()
        for ligne in 0...4 {
            for colonne in 0...4{
                let tuile = descCarte1[ligne][colonne]
                    
                if (descCarte1[ligne].indices.contains(colonne+1)){
                    if tuile.hasLinkOnRight(descCarte1[ligne][colonne+1]){
                        listeArc.append(arc(c1:colonne,l1:ligne,c2:colonne+1,l2:ligne,type:.normal))
                        
                    }
                }
                if (descCarte1.indices.contains(ligne+1)){
                    if tuile.hasLinkOnTop(descCarte1[ligne+1][colonne]){
                        listeArc.append(arc(c1:colonne,l1:ligne,c2:colonne,l2:ligne+1,type:.normal))
                        
                    }
                }

                
                
                
                
                
            }
        }
    }
    
    
    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
        
        /*let location = theEvent.locationInNode(self)
        
        let sprite = SKSpriteNode(imageNamed:"Spaceship")
        sprite.position = location;
        sprite.setScale(0.5)
        
        let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
        sprite.runAction(SKAction.repeatActionForever(action))
        
        self.addChild(sprite)*/
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func drawTuile(ligne:Int,colonne : Int,carte:SKNode,cote:Int){
        let barra = SKShapeNode(rectOfSize: CGSize(width: cote, height: cote))
        barra.name = "bar"
        barra.strokeColor = SKColor.whiteColor()
        barra.lineWidth = 3
        listeImageToReinit.append(barra)
        
        let delta = (cote/2) - 5
        
        let x = ((carte.position.x)  + CGFloat ( (ligne * cote ) ))
        
        let y = ((carte.position.y) + CGFloat ( (colonne * cote) ))
        
        barra.position = CGPoint(x:x,y:y)
        barra.zPosition =  10
        let typeTuile = descCarte1[colonne+2][ligne+2]
        if (typeTuile == .FOS){
            drawCircle(x, y: y,color:SKColor.yellowColor())
        }
        else {
            drawCircle(x, y: y,color:SKColor.lightGrayColor())
        }
            
        if (typeTuile.hasWOnTop()){
            let mur = SKShapeNode(rectOfSize: CGSize(width: cote, height: 12))
            let y = y.advancedBy(CGFloat((cote/2)-6 ) )
            mur.position = CGPoint(x:x,y:y)
            mur.alpha = 0.5
            mur.zPosition  = 20
            mur.fillColor = SKColor.redColor()
            //mur.strokeColor = nil
            self.addChild(mur)
            listeImageToReinit.append(mur)

            
        }
        if (typeTuile.hasWOnBottom()){
            let mur = SKShapeNode(rectOfSize: CGSize(width: cote, height: 12))
            let y = y.advancedBy(CGFloat(-(cote/2)+6 ) )
            mur.position = CGPoint(x:x,y:y)
            mur.alpha = 0.5
            mur.zPosition  = 20
            mur.fillColor = SKColor.redColor()
            //mur.strokeColor = nil
            self.addChild(mur)
            listeImageToReinit.append(mur)

        }
        if (typeTuile.hasWOnRigth()){
            let mur = SKShapeNode(rectOfSize: CGSize(width: 12, height: cote))
            let x = x.advancedBy(CGFloat((cote/2)-6 ) )
            mur.position = CGPoint(x:x,y:y)
            mur.alpha = 0.5
            mur.zPosition  = 20
            mur.fillColor = SKColor.redColor()
            //mur.strokeColor = nil
            self.addChild(mur)
            listeImageToReinit.append(mur)

        }
        if (typeTuile.hasWOnLeft()){
            let mur = SKShapeNode(rectOfSize: CGSize(width: 12, height: cote))
            let x = x.advancedBy(CGFloat(-(cote/2)+6 ) )
            mur.position = CGPoint(x:x,y:y)
            mur.alpha = 0.5
            mur.zPosition  = 20
            mur.fillColor = SKColor.redColor()
            //mur.strokeColor = nil
            self.addChild(mur)
            listeImageToReinit.append(mur)

        }
        
        
        let myLabel = SKLabelNode(fontNamed:"Courrier")
        myLabel.text = "\(colonne+2) \(ligne+2) \(typeTuile.rawValue)"
        myLabel.fontSize = 24
      
        myLabel.position = CGPoint(x:x.advancedBy(-30) ,y: y.advancedBy(-50)  )
        myLabel.zPosition = 20

       
        
        self.addChild(barra)
        self.addChild(myLabel)
        listeImageToReinit.append(myLabel)
        
        
        
    }
    func drawCircle(x:CGFloat,y:CGFloat,color:SKColor){
        let Circle = SKShapeNode(circleOfRadius: 10)
        Circle.position = CGPointMake(x,y)
        Circle.name = "--"
        Circle.strokeColor = SKColor.blackColor()
        //Circle.glowWidth = 10.0
        Circle.fillColor = color//SKColor.yellowColor()
        //Circle.physicsBody = SKPhysicsBody(circleOfRadius: 40)
        //Circle.physicsBody?.dynamic = true //.physicsBody?.dynamic = true
        Circle.zPosition = 15
        self.addChild(Circle)
        
        
    }
    
    
    func drawCadre(){
        let carte = (self.childNodeWithName("carte1"))!
        let largeur  = carte.frame.width
        let hauteur  = carte.frame.height
        let cote = Int(largeur / 5)
         let carteX = (carte.position.x) - (hauteur/2)

        for ligne in -2...2 {
            for colonne in -2...2{
                
                //DrawTuile(ligne,colonne:colonne,carte:carte,cote:cote)
                
                self.drawTuile(ligne, colonne: colonne, carte: carte, cote: cote)


                
            }
            
        }
        
    }
    
    
    //Gestion touche
   /* override init(){
        super.init()
        let nodeRotation = (self.childNodeWithName("nodeRotation"))!
        nodeRotation.userInteractionEnabled = false;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    func rotateLeft(){
         if self.carteRotation == 0  {self.carteRotation = 1 }
         rotateCarte(1)
         TypeTuile.rotateMatriceLeft(&self.descCarte1)
    }
    func rotateRight(){
        if self.carteRotation == 0  {self.carteRotation = -1 }
        rotateCarte(-1)
        TypeTuile.rotateMatriceRight(&self.descCarte1)
    }
    func rotateCarte(val:Int){
        let carte = (self.childNodeWithName("carte1"))!
        let startAction = SKAction.runBlock {
            //Right
            
            debugPrint((" DEB "))
        }
        let finishedAction = SKAction.runBlock {
            debugPrint((" END "))
            self.carteRotation = self.carteRotation + val
            
            self.drawCadre()
            self.calcArc()
            self.drawArc()
        }
        let rotate = SKAction.rotateToAngle(CGFloat(Double(carteRotation)*(M_PI/2)), duration: 4.0)
       
        
        carte.runAction(SKAction.sequence([startAction,rotate,finishedAction]))
        //carte.paused = true
        for node in listeImageToReinit {
            node.removeFromParent()
        }
        
     
       
        
    
    }
    
    override func mouseUp(theEvent: NSEvent) {
        debugPrint("Touch attention changer méthode sur IOS" )
    //}
  //override func touchesBeganWithEvent(event: NSEvent!) {
       
      //  let location = event.locationInNode(self)
          let location = theEvent.locationInNode(self)
        let node = self.nodeAtPoint(location)
       //  debugPrint("--> \(node ) \(location)")
        if (node.name == "nodeRotation") {
            debugPrint("you hit me with your best shot!")
            //self.rotateRight()
            self.rotateLeft()

        }
    }
}
