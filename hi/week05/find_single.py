# find_single.py
def find_single_element(arr):
    if not arr:
        raise ValueError("Input array is empty")
    if any(not isinstance(i, int) for i in arr):
        raise TypeError("Input array must contain only integers")
    
    result = 0
    for number in arr:
        result ^= number
    return result
