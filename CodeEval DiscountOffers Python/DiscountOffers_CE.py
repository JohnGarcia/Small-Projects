def factors(numberL, modValue):
    factors = []
    while modValue <= numberL:
        if numberL % modValue == 0:
            factors.append(modValue)
        modValue += 1

    return factors

def SuitabilityScore(customer, product):
    ss = 0
    numberVC = 0
    numberCC = 0
    modValue = 2
    factorsC = []
    factorsP = []

    numberLC = sum(j.isalpha() for j in customer)
    numberLP = sum(j.isalpha() for j in product)
    
    for i in customer:
        if i.isalpha() and not isVowel(i):
            numberCC += 1
        if isVowel(i):
            numberVC += 1

    if numberLP % 2 == 0:
        ss = numberVC * 1.5
    else:
        ss = numberCC

    factorsC = factors(numberLC, modValue)
    factorsP = factors(numberLP, modValue)

    intersectionF = set(factorsC).intersection(factorsP)
    if len(intersectionF) > 0:
        ss *= 1.5
    
    return ss

def isVowel(char):
    vowels = ['A','a','E','e','I','i','O','o','U','u','Y','y']
    if char in vowels:
        return True
    else:
        return False

class main:

    
    import sys
    test_cases = open(sys.argv[1], 'r')
    for test in test_cases:
        string = test.split(";")
        customers = string[0].split(",")
        products = string[1].split(",")
    
        SScores = []
        for i in customers:
            for j in products:
                ss = SuitabilityScore(i,j)
                SScores.append((i,j,ss))

        SScores.sort(key = lambda x: x[2])
        SScores.reverse()
        print SScores

        answer = 0
        for i in SScores:
            if i[0] in customers and i[1] in products:
                answer += i[2]
                customers.remove(i[0])
                products.remove(i[1])

        #two decimal places        
        answer = "%.2f" % answer  
        print answer 

    test_cases.close()           
