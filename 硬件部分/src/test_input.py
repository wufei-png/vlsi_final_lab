
def process(filepath1):
  f = open(filepath1,'w',encoding='utf-8')
  i=0
  while i<512:
      f.write("0000000110000000"+'\n')
      i=i+1
  f.close()
process("./result.txt")