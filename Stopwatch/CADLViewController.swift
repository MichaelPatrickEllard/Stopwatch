
import UIKit

class CADLViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var startTime: Date?
    var updateTimer: CADisplayLink?
    let formatter = DateFormatter()
    
    @IBAction func startPressed() {
        if updateTimer == nil {
            startTime = Date()
            updateDisplay(timeInterval: 0)
            updateTimer = CADisplayLink(target: self, selector: #selector(computeAndUpdate))
            updateTimer?.add(to: .main, forMode: .commonModes)
        }
    }
    
    @IBAction func stopPressed() {
        startTime = nil
        updateTimer?.invalidate()
        updateTimer = nil
    }

    
    func computeAndUpdate() {
        if let start = self.startTime {
            let elapsedSeconds = Date().timeIntervalSince(start)
            self.updateDisplay(timeInterval: elapsedSeconds)
        }
    }
    
    
    
    func updateDisplay(timeInterval: TimeInterval) {
        let elapsedTime = Date(timeIntervalSinceReferenceDate: timeInterval)
        let formattedTime = formatter.string(from: elapsedTime)
        self.displayLabel.text = formattedTime
    }
    
    override func viewDidLoad() {
        formatter.dateFormat = "mm:ss.SSS"
        updateDisplay(timeInterval: 0)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        print("Suspending CADisplayLink Updates")
        
        self.updateTimer?.isPaused = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let timer = self.updateTimer {
            
            print("Resuming CADisplayLink Updates")
            
            computeAndUpdate()
            
            timer.isPaused = false
        }
    }
}




