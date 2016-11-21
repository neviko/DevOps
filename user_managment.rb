class UserManagment

  attr_accessor :name, :email,:password,:hint, :hintAnswer

  @name
  @email
  @password
  @hint
  @hintAnswer
  #client



  def initialize(name, email, password, hint,hintAnswer)

    @name = name
    @email = email
    @password = password
    @hint = hint
    @hintAnswer = hintAnswer

  end

  def initialize

  end




  def setUserName

    loop do
      puts("Please enter your name")
      userName=gets.chomp()
      if userName.eql?("")
        puts("Please enter a valid name")

      else
        return userName
      end
    end

  end


  def setPassword

    password_validation =  /[a-zA-Z0-9_~!@$%^&*()]{6,}/ # password format

    loop do
      puts("please enter your password")
      password = gets.chomp

      if password_validation.match(password).to_s.chomp.length==0 then puts ("weak password, try again \n")

      else
      puts("confirm your password")
      password2= gets.chomp
      if password.eql?(password2)
        puts("password O.K")
        return password
      else
        puts ("Passwords doesn't match, please try again\n")
      end
    end
  end


end




  def setUserEmail
    email_validation = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    loop do
      puts("please enter your email")
      email = gets.chomp
      if email_validation.match(email).to_s.chomp.length ==0 then puts ("wrong email input, please try again")
      else
        return email
      end

    end
  end



  def setHintQuestion
    hint

    userChoiceNumber =0

    #connect to Mysql and to table Students
    client = Mysql2::Client.new(:host => "localhost", :username => "root",:password => "437440",:database => "students")
    #get table info, the query set into result
    results = client.query("SELECT * FROM hints")

    puts("Please choose one of the five hints below")
    results.each do |row| #list of hints
      puts row
    end



    loop do
      userChoiceNumber=gets.chomp.to_i
      if userChoiceNumber<0 || userChoiceNumber>5 then puts("Wrong input please try again")
      else break

      end
    end

    case userChoiceNumber
      when 1 then return("please write Your mother's maiden name")
      when 2 then return("please write the Name of your first pet")
      when 3 then return("please write the City in which you were born")
      when 4 then return("please write the Name of street where you shop for foode")
      when 5 then return("please write Your First boyfriend/girlfriend")
    end



  end



  def setHintAnswer

    puts("Please insert your hint answer")
    hintAnswer = gets.chomp
    return hintAnswer

  end


end






