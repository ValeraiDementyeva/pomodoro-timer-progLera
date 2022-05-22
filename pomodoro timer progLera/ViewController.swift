//
//  ViewController.swift
//  pomodoro timer progLera
//
//  Created by Валерия Дементьева on 22.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLableWork: UILabel!

    @IBOutlet weak var startButtonWork: UIButton!

    @IBOutlet weak var timeLableRelax: UILabel!

    @IBOutlet weak var startButtonRelax: UIButton!

    @IBOutlet weak var cancelButton: UIButton!

  var timerWork = Timer()
   var isTimerStartedWork = false
    var timeWork = 1500
     var timerRelax = Timer()
   var isTimerStartedRelax = false
     var timeRelax = 300

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startButtonTapped(_ sender: Any) {
        if !isTimerStartedWork {
                    startTimer()
                    isTimerStartedWork = true
                    startButtonWork.setTitle("Pause", for: .normal)
                } else {
                    timerWork.invalidate()
                    isTimerStartedWork = false
                    startButtonWork.setTitle("Start", for: .normal)
                }
            }

            func startTimer() {
                timerWork = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)

            }

            @objc func updateTimer() {
                timeWork -= 1
                timeLableWork.text = formatTime()
                if timeWork == 0 {
                    cancelTimerWork()
                    if !isTimerStartedRelax {
                    startTimerRelax()
                        isTimerStartedRelax = true
                        startButtonRelax.setTitle("Pause", for: .normal)

                    } else {
                        timerRelax.invalidate()
                        isTimerStartedRelax = false
                        startButtonRelax.setTitle("Start", for: .normal)
                    }
                }
            }

            func formatTime() -> String {
                let minutes = Int(timeWork) / 60 % 60
                let seconds = Int(timeWork) % 60
                return String(format: "%02i:%02i", minutes, seconds)

            }

            func cancelTimerWork() {
                timerWork.invalidate()
                timeWork = 1500
                isTimerStartedWork = false
                timeLableWork.text = "25:00"
            }

    @IBAction func startButtomRelax(_ sender: Any) {
    if !isTimerStartedRelax {
                startTimerRelax()
                isTimerStartedRelax = true
                startButtonRelax.setTitle("Pause", for: .normal)

            } else {
                timerRelax.invalidate()
                isTimerStartedRelax = false
                startButtonRelax.setTitle("Start", for: .normal)
            }
        }
        func startTimerRelax() {
            timerRelax = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimerRelax)), userInfo: nil, repeats: true)
        }

        @objc func updateTimerRelax() {
            timeRelax -= 1
            timeLableRelax.text = formatTimeRelax()
            if timeRelax == 0 {
                cancelTimerRelax()
                if !isTimerStartedWork {
                    startTimer()
                    isTimerStartedWork = true
                    startButtonWork.setTitle("Pause", for: .normal)

                } else {
                    timerWork.invalidate()
                    isTimerStartedWork = false
                    startButtonWork.setTitle("Start", for: .normal)
                }
            }

        }

        func formatTimeRelax() -> String {
            let minutes = Int(timeRelax) / 60 % 60
            let seconds = Int(timeRelax) % 60
            return String(format: "%02i:%02i", minutes, seconds)

        }

        func cancelTimerRelax() {
            timerRelax.invalidate()
            timeRelax = 300
            isTimerStartedWork = false
            timeLableRelax.text = "05:00"
        }

    @IBAction func cancelTimetButton(_ sender: Any) {
    cancelTimerWork()
            cancelTimerRelax()
    }
}
    


