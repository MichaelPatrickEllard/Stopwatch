
import UIKit

class NSTViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var startTime: Date?
    weak var updateTimer: Timer?
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        formatter.dateFormat = "mm:ss"
        updateDisplay(timeInterval: 0)
    }
    
    func updateDisplay(timeInterval: TimeInterval) {
        let elapsedTime = Date(timeIntervalSinceReferenceDate: timeInterval)
        let formattedTime = formatter.string(from: elapsedTime)
        self.displayLabel.text = formattedTime
    }

    @IBAction func startPressed() {
        if updateTimer == nil {
            startTime = Date()
            updateDisplay(timeInterval: 0)
            updateTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] _ in
                if let start = self?.startTime {
                    let elapsedSeconds = Date().timeIntervalSince(start)
                    self?.updateDisplay(timeInterval: elapsedSeconds)
                }
            }
        }
    }
    
    @IBAction func stopPressed() {
        startTime = nil
        updateTimer?.invalidate()
    }
}




