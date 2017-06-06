player="h" #enter into the loop and add $100 to the players pool
p_pool = 100

catch( :game ) do #use catch to allow the game to exit when player enters 'q'
until player == "n"
  system("cls")
  player="h"#initialize player, dealer and arrays
  dealer = "h"
  player_array=[]
  dealer_array=[[],[]]
  dealer_flat=[]
#initializing the dealers arrays with random numbers, and adding their cards together
  dealer_array[0] << (1 + Random.rand(10))
  dealer_array[1] << (1 + Random.rand(10))
  dealer_flat=dealer_array.flatten
  dsum = dealer_flat.inject(0){|sum,x| sum + x }
#The algorithm behind the "dealer", this is where to edit for machine learning
  while dsum < 21 && dealer == "h"
    if dsum <= 18
      dealer_array[1] << (1 + Random.rand(10))
    else
      dealer = "s"
    end
    dealer_flat=dealer_array.flatten
    dsum = dealer_flat.inject(0){|sum,x| sum + x }
  end
#Begin interaction with the user, and deal cards
  puts("\nThis is the game of Blackjack!\n(Enter 'q' at anytime to quit the game)")
  puts("\nDealers face up cards: ")
    dealer_array[1].each do |x|
      print("#{x} ")
    end
  puts("\n\nHere are your first two cards:")
  player_array << (1 + Random.rand(10))
  player_array << (1 + Random.rand(10))
  print("#{player_array[0]} and #{player_array[1]}\t\t pool: $#{p_pool}")
#initialize the players bet, total, and sum
  p_bet = 0
  t_bet = 0
  psum = 0
#error handling
  while (psum < 21 && player == "h" && p_pool > 0)
    print("\n\n\nPlace your bet:$")
    p_bet = gets.chomp()
    if p_bet == 'q' then throw :game
    elsif p_bet.match(/^[[:alpha:]]$/)
      print("Please enter a positive integer!")
      next
    end
    p_bet = p_bet.to_i
    if p_bet < 0
      print ("Please enter positive number!")
      next
    elsif (p_pool - p_bet) < 0
      print("Can't bet more than your pool")
      next
    else
      t_bet = t_bet + p_bet#If everything looks good, continue game
      p_pool = p_pool - p_bet
      loop do
        print("Enter 'h' if you would like to hit, or 's' if you would like to stay: ")
        player = gets().chomp.to_s
        if player == 'q' then throw :game end
        break if player == 'h' || player == 's'
      end
        if player == "h"
        player_array << (1 + Random.rand(10))
        print("Your cards: ")
          player_array.each do |x|
            print("#{x} ")
          end
        print("\t\t pool: $#{p_pool}")
        psum = player_array.inject(0){|sum,x| sum + x }
        end
    end
  end
#once the person stays, check the outcome and output win or loss
  if dsum < psum && dsum < 21 && psum <= 21 || psum <= 21 && dsum > 21
    puts ("\nCongratulations, you win!")
    p_pool = p_pool + (2*t_bet)
  elsif psum < dsum && dsum <= 21 && psum < 21 || psum > 21 && dsum <= 21
    puts("\nI'm sorry, you lose")
  elsif psum > 21 && dsum > 21
    puts("\nNo Winner")
  else psum == dsum
    puts("\nIt's a tie!")
    p_pool = p_pool + t_bet
  end

  loop do
    print("Would you like to play again? ('y' = yes, 'n' = no)")
    player = gets.chomp()
    break if player =='y' || player == 'n'
  end
#Error handling if player doesn't have enough money
  if p_pool <= 0
    puts("\nYou have no more money left\nGame Over")
    player = "n"
  end
end
end
print ("Thanks for playing!")
