#returns a list of factors for a given number (excluding 1)
def factors(numberL, modValue):
    factors = []
    while modValue <= numberL:
        if numberL % modValue == 0:
            factors.append(modValue)
        modValue += 1

    return factors

#returns a single score for a given customer and product
def SuitabilityScore(customer, product):
    ss = 0
    numberVC = 0
    numberCC = 0
    modValue = 2
    factorsC = []
    factorsP = []

    #get number of letters in customer/product name
    numberLC = sum(j.isalpha() for j in customer)
    numberLP = sum(j.isalpha() for j in product)

    #get number of consonants and vowels for customer name
    for i in customer:
        if i.isalpha() and not isVowel(i):
            numberCC += 1
        if isVowel(i):
            numberVC += 1

    #case, if number of letters in product is even or odd
    if numberLP % 2 == 0:
        ss = numberVC * 1.5
    else:
        ss = numberCC

    #get factors of customer/product name
    factorsC = factors(numberLC, modValue)
    factorsP = factors(numberLP, modValue)

    #using intersection to see if the customer/product share any factors
    intersectionF = set(factorsC).intersection(factorsP)
    if len(intersectionF) > 0:
        ss *= 1.5
    
    return ss

#takes in a character, returns true if vowel, false otherwise
def isVowel(char):
    vowels = ['A','a','E','e','I','i','O','o','U','u','Y','y']
    if char in vowels:
        return True
    else:
        return False

class main:

    #code for CodeEval
    """import sys
    test_cases = open(sys.argv[1], 'r')
    for test in test_cases:
        # ignore test if it is an empty line
        # 'test' represents the test case, do something with it
        # ...
        # ...

    test_cases.close()
    """

    #test string
    string = "Jack Abraham,John Evans,Ted Dziuba;iPad 2 - 4-pack,Girl Scouts Thin Mints,Nerf Crossbow"
    test = string.split(";")
    customers = test[0].split(",")
    products = test[1].split(",")

    #get list in format of [(customer, product, score)]
    SScores = []
    for i in customers:
        for j in products:
            ss = SuitabilityScore(i,j)
            SScores.append((i,j,ss))

    #sort keys in descending order, by score (eg. [('Ted Dziuba', 'Nerf Crossbow', 9.0), ('Jack Abraham', 'Girl Scouts Thin Mints', 7), ('John Evans', 'Nerf Crossbow', 6.75), etc.])
    SScores.sort(key = lambda x: x[2])
    SScores.reverse()
    #print SScores

    #greedy aproach, taking the highest score available
    answer = 0
    for i in SScores:
        if i[0] in customers and i[1] in products:
            answer += i[2]
            customers.remove(i[0])
            products.remove(i[1])

    #two decimal places        
    answer = "%.2f" % answer  
    print answer            
