# LLoader
It's a simple but famous loader in a super light way!


![Alt Text](https://github.com/UzumakiAlfredo/Lloader/blob/main/Screen.gif)


How to use it?

Just add the LLoader.swift to your project, then you can use it programmatically or use it with storayboard like so.

class ViewController: UIViewController {

    @IBOutlet weak var smallLoader: LLoader!
    @IBOutlet weak var bigLoader: LLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Start Loader
        smallLoader.isAnimating = true
        bigLoader.isAnimating = true
        
        creaeLoaderProgrammatically()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // Stop Loader
            self.bigLoader.isAnimating = false
        }
    }
    
    func creaeLoaderProgrammatically() {
        let loader = LLoader(frame: smallLoader.frame)
        loader.layer.position.y = bigLoader.center.y + 150
        loader.layer.position.x = bigLoader.center.x - (loader.frame.width / 2)
        view.addSubview(loader)
        loader.isAnimating = true
    }
}

