//: Playground - noun: a place where people can play

class UserAccount{
    //Specify the appropriate type.
    var username: String!
    var password: String!
    var details: UserDetails!
    var recoveryDetails: AccountRecovery?
    //Set to true if user wants to recover the account.
    var willRecover = false
    
    init(uname:String, pass:String, details:UserDetails) {
        username = uname
        password = pass
        self.details = details
    }
    
    func recover() {
        if willRecover {
            if let securityQuestion = recoveryDetails?.question {
                print("Your security question: \(securityQuestion)")
                
                if let securityHint = recoveryDetails?.hint? {
                    print("You are now fully setup for account recovery")
                } else {
                    print("It might be helpful to set a hint in case you forgot the answer to your security question.")
                }
            } else {
                print("Sorry but you haven't set your recovery question.")
            }
        }

    }
}

class UserDetails{
    var name: String!
    var age: Int?
    
    init(yourName: String) {
        name = yourName
    }
    
    init(yourName: String, yourAge: Int) {
        name = yourName
        age = yourAge
    }
}

class AccountRecovery{
    var question: String!
    var answer: String!
    var hint: String?
    
    init(q:String, a:String, h:String?) {
        question = q
        answer = a
        hint = h
    }
}

var userDetails = UserDetails(yourName: "Joy")
var recoveryDetails = AccountRecovery(q: "What is your password?", a: "idontknow", h: "Do you know?")
var userAccount = UserAccount(uname: "joypi", pass: "mypassword", details: userDetails)
userAccount.recoveryDetails = recoveryDetails
userAccount.willRecover = true

//1 - Print your new account's username.
print(userAccount.username)
//2 - If user try to recover their account and question is existing, print "Your security question: {question}".
//    If not print "Sorry but you haven't set your recovery question."
//3 - If security question hint is available, print "You are now fully setup for account recovery" .
//    If not print "It might be helpful to set a hint in case you forgot the answer to your security question."
userAccount.recover()