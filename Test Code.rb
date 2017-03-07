dealer_array= [[],[]]
dealer_flat = []

dealer_array[0] << 5 #(1 + Random.rand(10))
dealer_array[1] << 6 #(1 + Random.rand(10))
dealer_array[1] << 7
dealer_array[1] << 8

dealer_flat = dealer_array.flatten

print (dealer_flat)
