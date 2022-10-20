
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = UIColor.green
            quizBrain.score += 1
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI()
    {
        if (!quizBrain.end){
        
            questionLabel.text = quizBrain.getQuestionText()
            scoreLabel.text = "Score \(quizBrain.getScore())"
            
            firstButton.setTitle(quizBrain.gettext(select: 0), for: .normal)
            secondButton.setTitle(quizBrain.gettext(select: 1), for: .normal)
            thirdButton.setTitle(quizBrain.gettext(select: 2), for: .normal)
            
            firstButton.backgroundColor = UIColor.clear
            secondButton.backgroundColor = UIColor.clear
            thirdButton.backgroundColor = UIColor.clear
            
            progressBar.progress =  quizBrain.getProgress()
        
        }
        else{
            firstButton.isHidden = true
            secondButton.isHidden = true
            thirdButton.isHidden = true
            questionLabel.text = "You Finished"
            progressBar.progress = quizBrain.getProgress() + 1
        }
    }
    
}

