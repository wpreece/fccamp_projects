import numpy as np

def calculate(list):
    if len(list) < 9:
        raise ValueError('List must contain nine numbers.')

    calculations = {
        'mean': [],
        'variance': [],
        'standard deviation': [],
        'max': [],
        'min': [],
        'sum': []
    }

    dataset = np.reshape(list, (3, 3))
    
    mean1 = dataset.mean(axis=0).tolist()
    mean2 = dataset.mean(axis=1).tolist()
    mean3 = dataset.mean()

    var1 = np.var(dataset, axis=0).tolist()
    var2 = np.var(dataset, axis=1).tolist()
    var3 = np.var(dataset)

    std1 = np.std(dataset, axis=0).tolist()
    std2 = np.std(dataset, axis=1).tolist()
    std3 = np.std(dataset)

    max1 = np.max(dataset, axis=0).tolist()
    max2 = np.max(dataset, axis=1).tolist()
    max3 = np.max(dataset)

    min1 = np.min(dataset, axis=0).tolist()
    min2 = np.min(dataset, axis=1).tolist()
    min3 = np.min(dataset)

    sum1 = np.sum(dataset, axis=0).tolist()
    sum2 = np.sum(dataset, axis=1).tolist()
    sum3 = np.sum(dataset)

    calculations['mean'] = [mean1, mean2, mean3]
    calculations['variance'] = [var1, var2, var3]
    calculations['standard deviation'] = [std1, std2, std3]
    calculations['max'] = [max1, max2, max3]
    calculations['min'] = [min1, min2, min3]
    calculations['sum'] = [sum1, sum2, sum3]
    
    return calculations