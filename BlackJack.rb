player="h"
p_pool = 100

catch( :game ) do
until player == "q"
  system("cls")
  player="h"
  dealer = "h"
  player_array=[]
  dealer_array=[[],[]]
  dealer_flat=[]

  dealer_array[0] << (1 + Random.rand(10))
  dealer_array[1] << (1 + Random.rand(10))
  dealer_flat=dealer_array.flatten
  dsum = dealer_flat.inject(0){|sum,x| sum + x }

  while dsum < 21 && dealer == "h"
    if dsum <= 16
      dealer_array[1] << (1 + Random.rand(10))
    else
      dealer = "s"
    end
    dealer_flat=dealer_array.flatten
    dsum = dealer_flat.inject(0){|sum,x| sum + x }
  end

  puts("\nThis is the game of Blackjack!")
  puts("\nDealers face up cards: ")
    dealer_array[1].each do |x|
      print("#{x} ")
    end
  puts("\n\nHere are your first two cards:")
  player_array << (1 + Random.rand(10))
  player_array << (1 + Random.rand(10))
  print("#{player_array[0]} and #{player_array[1]}\t\t pool: $#{p_pool}")

  p_bet = 0
  t_bet = 0
  psum = 0

  while (psum < 21 && player == "h" && p_pool > 0)
    print("\n\n\nPlace your bet:$")
    p_bet = gets.chomp()
    if p_bet == 'q' then throw :game end
    p_bet = p_bet.to_i
    if p_bet < 0
      print ("Please enter positive number!")
      player = "h"
    else
      t_bet = t_bet + p_bet
      p_pool = p_pool - p_bet
      print("Enter 'h' if you would like to hit, or 's' if you would like to stay: ")
      player = gets().chomp.to_s
      if player == 'q' then throw :game end
        if player != "h" && player != "s"
        print("Incorrect letter!")
        player = "h"
        elsif player == "h"
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

  print("Would you like to play again? ('y' = yes, 'q' = no)")
  player = gets.chomp()

  if p_pool <= 0
    puts("\nYou have no more money left\nGame Over")
    player = "q"
  end
end
end
print ("Thanks for playing!")
