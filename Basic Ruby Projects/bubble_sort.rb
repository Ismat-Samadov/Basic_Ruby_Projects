def bubble_sort(array)
  # SET A FLAG TO TRACK IF ANY SWAPS WERE MADE IN THE CURRENT PASS
  swapped = true

  # LOOP UNTIL NO SWAPS ARE MADE IN A PASS
  while swapped do
    # RESET THE SWAPPED FLAG FOR EACH PASS
    swapped = false

    # ITERATE OVER THE ARRAY, COMPARING ADJACENT ELEMENTS
    (0...array.length - 1).each do |i|
      # IF THE CURRENT ELEMENT IS GREATER THAN THE NEXT ELEMENT, SWAP THEM
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i] # SWAP ELEMENTS
        swapped = true # SET SWAPPED FLAG TO TRUE
      end
    end
  end

  # RETURN THE SORTED ARRAY
  return array
end

# EXAMPLE USAGE:
result = bubble_sort([4,3,78,2,0,2])
puts result.inspect  # OUTPUT: [0,2,2,3,4,78]
