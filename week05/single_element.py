def find_single_element(arr):
    """Funktion, um das einzelne Element in einem Array zu finden, bei dem alle anderen Elemente zweimal vorkommen."""
    if len(arr) % 2 == 0:
        raise ValueError("Das Array muss eine ungerade Länge haben.")

    element_count = {}
    for num in arr:
        if num in element_count:
            element_count[num] += 1
        else:
            element_count[num] = 1

    single_elements = [num for num, count in element_count.items() if count == 1]
    if len(single_elements) != 1:
        raise ValueError("Das Array muss genau ein einzelnes Element enthalten, das nur einmal vorkommt.")

    return single_elements[0]