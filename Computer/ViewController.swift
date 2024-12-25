import UIKit

class ViewController: UIViewController {
    var inputNum = ""
    var inputArray:[String] = []
    var nowMath = ""
    @IBOutlet weak var show: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        show.text = "0"
    }
    
    
    @IBAction func clearAll(_ sender: Any) {
        print("按下AC")
        inputNum = ""
        inputArray = []
        show.text = "0"
        nowMath = ""
    }
    @IBAction func clear(_ sender: Any) {
        if !inputNum.isEmpty {
            inputNum.removeLast()
        } else if !inputArray.isEmpty {
            inputArray.removeLast()
        }
        updateDisplay()
    }
    @IBAction func zero(_ sender: Any) {
        print("按下0")
        pressNumber("0")
        updateDisplay()
    }
    @IBAction func one(_ sender: Any) {
        print("按下1")
        pressNumber("1")
        updateDisplay()
    }
    @IBAction func two(_ sender: Any) {
        print("按下2")
        pressNumber("2")
        updateDisplay()
    }
    @IBAction func three(_ sender: Any) {
        print("按下3")
        pressNumber("3")
        updateDisplay()
    }
    @IBAction func four(_ sender: Any) {
        print("按下4")
        pressNumber("4")
        updateDisplay()
    }
    @IBAction func five(_ sender: Any) {
        print("按下5")
        pressNumber("5")
        updateDisplay()
    }
    @IBAction func six(_ sender: Any) {
        print("按下6")
        pressNumber("6")
        updateDisplay()
    }
    @IBAction func seven(_ sender: Any) {
        print("按下7")
        pressNumber("7")
        updateDisplay()
    }
    @IBAction func eight(_ sender: Any) {
        print("按下8")
        pressNumber("8")
        updateDisplay()
    }
    @IBAction func nine(_ sender: Any) {
        print("按下9")
        pressNumber("9")
        updateDisplay()
    }
    @IBAction func point(_ sender: Any) {
        print("按下.")
        pressNumber(".")
        updateDisplay()
    }
    @IBAction func plus(_ sender: Any) {
        print("按下+")
        pressOperator("+")
        updateDisplay()
    }
    @IBAction func minus(_ sender: Any) {
        print("按下-")
        pressOperator("-")
        updateDisplay()
    }
    @IBAction func multiply(_ sender: Any) {
        print("按下x")
        pressOperator("*")
        updateDisplay()
    }
    @IBAction func dividedBy(_ sender: Any) {
        print("按下÷")
        pressOperator("/")
        updateDisplay()
    }
    @IBAction func equal(_ sender: Any) {
        print("按下=")
        if !inputNum.isEmpty {
            inputArray.append(inputNum)
        }
        finalEqual()
    }
    
    func pressNumber (_ num:String) {
        inputNum += num
        print("目前計算式：\(inputArray)\n")
        show.text = inputNum
    }
    
    func pressOperator(_ op: String) {
        if !inputNum.isEmpty {
            inputArray.append(inputNum)
            inputArray.append(op)
            inputNum = ""
        }
    }
    
    func updateDisplay() {
        nowMath = inputArray.joined() + inputNum
        show.text = nowMath.isEmpty ? "0" : nowMath
    }
    
    func finalEqual() {
        print("目前陣列內容：\(inputArray)")
        
        // 如果陣列為空或內容不足以計算，則不執行計算
        guard inputArray.count >= 3 else {
            show.text = "錯誤：輸入不足"
            inputArray = []
            inputNum = ""
            return
        }
        
        // 初始化計算變數
        var result = 0.0
        var currentOperator = "+"
        
        for item in inputArray {
            if let number = Double(item) {
                // 根據運算符計算
                switch currentOperator {
                case "+":
                    result += number
                case "-":
                    result -= number
                case "*":
                    result *= number
                case "/":
                    if number != 0 {
                        result /= number
                    } else {
                        show.text = "錯誤：不能除以0"
                        inputArray = []
                        inputNum = ""
                        return
                    }
                default:
                    break
                }
            } else {
                // 如果不是數字，則更新運算符
                currentOperator = item
            }
        }
        
        // 顯示結果並清空輸入
        show.text = "\(result)"
        inputArray = []
        inputNum = "\(result)"
    }
}

