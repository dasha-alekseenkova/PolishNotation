class Calculator

  def initialize
    @stack=[]
  end

  def operate(a, b, operand)
    case operand
    when '+'
      b + a
    when '-'
      b - a
    when '*'
      b * a
    when '/'
      b / a
    end
  end

  def operand(input)
    if @stack.count >= 2
      @stack.push(operate(@stack.pop, @stack.pop, input))
      puts @stack.last
    else
      puts "Please enter another operand before entering another operator (+, -, /, *)."
    end
  end

  def calculate
    loop do
      input = gets.chomp
      case input
      when /\d/
        @stack << input.to_i
      when /\*|\-|\+|\//
        operand(input)
      when 'q'
        main_menu
      else
        puts "Please enter an operand or operator (+, -, /, *)."
      end
    end
  end

  def main_menu
    puts "-----------------Main Menu--------------"
    puts "1. Use calculator"
    puts "2. Instructions how to use calculator"
    puts "----------------------------------------"
    puts "\nType 'exit' to exit."

    response = gets.chomp

    if response == "1"
      puts "\n\nPlease enter an operand or operator (+, -, /, *). Type 'q' to exit."
      calculate

    elsif response == "2"
      puts "-------------How To Use This Calculator-------------"
      puts "This calculator evaluates math problems expressed in Polish Notation."
      puts "Example: '2+5' is expressed as '2 5 +'\n\n"
      puts "When using this calculator, enter a single number or operator per line."
      puts "Valid operators for this calculator include +, -, /, *"
      puts "-----------------------------------------------------\n\n"
      main_menu
    elsif response == "exit"
      quit

    else
      puts "\n\nInvalid option. Please enter an option from the menu below.\n\n"
      main_menu
    end
  end

  def quit
    puts "\n\nGood Bye!"
    exit
  end
end
