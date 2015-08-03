def LCSLength(string, matrix1, matrix2):
    x = 1
    y = 1

    for i in string[0]:
        for j in string[1]:
            if i == j:
                matrix1[x][y] = matrix1[x - 1][y - 1] + 1
                matrix2[x][y] = '/'
            elif matrix1[x - 1][y] >= matrix1[x][y - 1]:
                matrix1[x][y] = matrix1[x - 1][y]
                matrix2[x][y] = '^'
            else:
                matrix1[x][y] = matrix1[x][y - 1]
                matrix2[x][y] = '<'
            y += 1
        x += 1
        y = 1

def PrintLCS(matrix2, string, x, y, result):
    if x == 0 or y == 0:
        return
    if matrix2[x][y] == '/':
        PrintLCS(matrix2, string, x - 1, y - 1, result)
        result.append(string[x - 1])
    elif matrix2[x][y] == '^':
        PrintLCS(matrix2, string, x - 1, y, result)
    else:
        PrintLCS(matrix2, string, x, y - 1, result)
    
class main:
    #test case
    test = "XMJYAUZHGFRTA;MZJAWXUKOLIJUA"
    string = test.split(";")
    result = []
    answer = ""

    #create two 2D arrays
    matrix1 = [[0 for x in xrange(len(string[1]) + 1)] for x in xrange(len(string[0]) + 1)]
    matrix2 = [[0 for x in xrange(len(string[1]) + 1)] for x in xrange(len(string[0]) + 1)]

    #call functions
    LCSLength(string, matrix1, matrix2)
    PrintLCS(matrix2, string[0], len(string[0]), len(string[1]), result)
    #print matrix1, matrix2

    #concatenate items in list into one string
    for i in result:
        answer += i

    print answer
