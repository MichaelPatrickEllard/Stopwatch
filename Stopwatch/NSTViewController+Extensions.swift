
import Foundation

extension NSTViewController {
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        if let timer = self.updateTimer {
        
            print("Suspending Display Updates")
            
            timer.invalidate()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let start = self.startTime {
            
            print("Resuming Display Updates")
            
            let elapsedSeconds = Date().timeIntervalSince(start)
            
            updateDisplay(timeInterval: elapsedSeconds)
            
            updateTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {[weak self] _ in
                if let start = self?.startTime {
                    let elapsedSeconds = Date().timeIntervalSince(start)
                    self?.updateDisplay(timeInterval: elapsedSeconds)
                }
            }
        }
    }
}



