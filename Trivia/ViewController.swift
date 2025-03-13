
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var QuestionNumber: UILabel!
    @IBOutlet weak var Subject: UILabel!
    @IBOutlet weak var QuestionText: UILabel!

    @IBOutlet weak var answerChoice1: UIButton!
    @IBOutlet weak var answerChoice2: UIButton!
    @IBOutlet weak var answerChoice3: UIButton!
    @IBOutlet weak var answerChoice4: UIButton!

    struct Question {
        let questionNumber: String
        let subject: String
        let questionText: String
        let answers: [String]
        let correctAnswerIndex: Int
    }

    let questions: [Question] = [
        Question(questionNumber: "Question 1/3",
                 subject: "Geography",
                 questionText: "Which country have the largest surface area?",
                 answers: ["China", "Russia", "The United States", "India"],
                 correctAnswerIndex: 1),

        Question(questionNumber: "Question 2/3",
                 subject: "Science",
                 questionText: "Who was the first person in space?",
                 answers: ["Neil deGrasee Tyson", "Neil Armstrong", "Yuri Gagarin", "Elon Musk"],
                 correctAnswerIndex: 2),

        Question(questionNumber: "Question 3/3",
                 subject: "History",
                 questionText: "What year did World War 2 started?",
                 answers: ["1942", "1945", "1938", "1939"],
                 correctAnswerIndex: 3)
    ]

    var currentQuestionIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        styleButton(answerChoice1)
        styleButton(answerChoice2)
        styleButton(answerChoice3)
        styleButton(answerChoice4)
        displayCurrentQuestion()
    }

    func setupLabels() {
        QuestionNumber.adjustsFontSizeToFitWidth = true
        Subject.adjustsFontSizeToFitWidth = true
        QuestionText.adjustsFontSizeToFitWidth = true

        QuestionNumber.minimumScaleFactor = 0.5
        Subject.minimumScaleFactor = 0.5
        QuestionText.minimumScaleFactor = 0.5

        QuestionNumber.numberOfLines = 0
        Subject.numberOfLines = 0
        QuestionText.numberOfLines = 0
    }

    func styleButton(_ button: UIButton) {
        button.backgroundColor = UIColor.systemBlue
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 8
        button.setTitleColor(UIColor.white, for: .normal)
    }

    func displayCurrentQuestion() {
        if currentQuestionIndex < 0 || currentQuestionIndex >= questions.count {
            print("Invalid currentQuestionIndex. Resetting to 0.")
            currentQuestionIndex = 0
        }

        let currentQuestion = questions[currentQuestionIndex]
        QuestionNumber.text = currentQuestion.questionNumber
        Subject.text = currentQuestion.subject
        QuestionText.text = currentQuestion.questionText
        answerChoice1.setTitle(currentQuestion.answers[0], for: .normal)
        answerChoice2.setTitle(currentQuestion.answers[1], for: .normal)
        answerChoice3.setTitle(currentQuestion.answers[2], for: .normal)
        answerChoice4.setTitle(currentQuestion.answers[3], for: .normal)
    }

    @IBAction func answerSelected(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex >= questions.count {
            currentQuestionIndex = 0
        }
        displayCurrentQuestion()
    }
}
