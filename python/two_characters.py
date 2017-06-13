# String t always consists of two distinct alternating characters. For example, if string t's two distinct characters are x and y, then t could be 'xyxyx' or 'yxyxy' but not 'xxyy' or 'xyyx'.

# You can convert some string s to string t by deleting characters from s. When you delete a character from s, you must delete all occurrences of it in s. For example, if s = 'abaacdabd' and you delete the character 'a', then the string becomes 'bcdbd'.

# Given s, convert it to the longest possible string t. Then print the length of string t on a new line; if no string t can be formed from s, print 0 instead.

def two_characters(s):
    
    length = 0
    explored1 = []
    for letter1 in s:
        if letter1 not in explored1:
            explored1.append(letter1)
            explored2 = []
            for letter2 in s:
                if letter2 not in explored2 and letter2 not in explored1:
                    explored2.append(letter2)
                    t = two_char_str(s, letter1, letter2)
                    t_length = valid_t(t)
                    if t_length > 0 and t_length > length:
                        length = t_length
    return length

def two_char_str(s, x, y):
    if len(s) <= 1:
        return s
    else:
        count = {}
        new_str = ""
        for l in s:
            count[l] = count.setdefault(1, 0) +  1
            if count.length > 2:
                return ""
            if l == x or l == y:
                new_str += l
    return new_str

def valid_t(t):
    for i in range(1, len(t)):
        if t[i] == t[i - 1]:
            return 0
    return len(t)

s1 = 'cobmjdczpffbxputsaqrwnfcweuothoygvlzugazulgjdbdbarnlffzpogdprjxvtvbmxjujeubiofecvmjmxvofejdvovtjulhhfyadr'
print(two_characters(s1) == 8)

s2 = ''
print(two_characters(s2) == 0)

s3 = 'a'
print(two_characters(s3) == 0)

s4 = 'fd'
print(two_characters(s4) == 1)