

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
        new_str = ""
        for l in s:
            if l == x or l == y:
                new_str += l
    return new_str

def valid_t(t):
    count= {}
    for i in range(1, len(t)):
        if t[i] in count:
            count[t[i]] += 1
        else:
            count[t[i]] = 1
        if t[i] == t[i - 1] or len(count) > 2:
            return 0
    return len(t)

s = 'cobmjdczpffbxputsaqrwnfcweuothoygvlzugazulgjdbdbarnlffzpogdprjxvtvbmxjujeubiofecvmjmxvofejdvovtjulhhfyadr'
print(two_characters(s) == 8)
