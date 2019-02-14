require "byebug"


def first_anagram(string)
    # hat tah hta tha ath aht
    # debugger
   
    letters = string.chars
    return letters if letters.length <= 1
    first_letter = letters[0]

    new_letters = letters[1..-1].join
    anagrams = first_anagram(new_letters)
    total_anagrams = []
 
    anagrams.each do |anagram|
        (0..anagram.length).each do |i|
            total_anagrams << anagram[0...i] + first_letter + anagram[i..-1]
        end
    end
    total_anagrams
end

def comp_anagrams(string1, string2)
    first_anagram(string1).include?(string2)
end

def second_anagram(string1, string2)
    return false if string1.length != string2.length
    string2_arr = string2.chars
    string1.each_char do |char1|
        if string2_arr.find_index(char1).nil? 
            return false 
        else 
            idx2 = string2_arr.find_index(char1)
            string2_arr.delete_at(idx2)
        end 
    end
    string2_arr.empty?
end

def third_anagram(string1, string2)
    return false if string1.length != string2.length 
    return false if string1.chars.sort != string2.chars.sort 
    return true 
end 

def fourth_anagram(string1, string2)
    char_counter(string1) == char_counter(string2)
end 

def char_counter(string1)
    char_count = Hash.new(0)

    string1.each_char do |char1| 
        char_count[char1] += 1 
    end 
    char_count
end 