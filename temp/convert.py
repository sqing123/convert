def convert(num, base, result):
    if(num == 0):
        print result
        return
    append = num % base
    num = num/base
    result = get_str_val(append) + result
    convert(num, base, result)

def get_str_val(num):
  if num < 10:
    return str(num)
  else:
    values = "ABCDEFGHIJKLMNOPQ"
    return values[num-9]

convert(1480615200, 16, "")