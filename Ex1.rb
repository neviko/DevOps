
def login
  puts("login")
end


def register

  email_validation = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  password_validation =  /[a-zA-Z0-9_~!@$%^&*()]{6,}/

  puts("register\n\n")



  loop do
    puts("please enter your email")
    email = gets.chomp
        if email_validation.match(email).to_s.chomp.length ==0 then puts ("wrong email input, please try again")
        else break
        end

   end



  loop do
      puts("please enter your password")
      password = gets.chomp
      if password_validation.match(password).to_s.chomp.length==0 then puts ("wrong password input")
      else
        puts("confirm your password")
        password2= gets.chomp
        if password.eql?(password2)
          puts("Your'e In")
          break

        else
        puts("the passwords doesn't match..please try again\n")
        end
      end
  end

end



def recoverPassword
  puts("recoverPassword")
end



def removeMe
  puts("removeMe")
end



def showAll
  puts("showAll")
end



def quit
  puts("quit")
end





choice = ""
loop do
puts ("Please enter your choice\n

  1. Login\n

  2. Register new\n

  3. Recover Password\n

  4. Remove me\n

  5. Show all\n

  6. Quit" )

choice=gets.chomp.to_i
break if choice >=1 and choice <= 6

end

case choice
  when 1 then login
  when 2 then register
  when 3 then recoverPassword
  when 4 then removeMe
  when 5 then showAll
  when 6 then quit
end
