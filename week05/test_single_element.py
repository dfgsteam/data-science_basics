import pytest
from single_element import find_single_element

def test_single_element():
    # Testfall 1: Beispiel aus der Aufgabe
    assert find_single_element([1, 2, 3, 4, 3, 1, 2]) == 4

    # Testfall 2: Einzelnes Element am Anfang
    assert find_single_element([7, 5, 6, 5, 6]) == 7

    # Testfall 3: Einzelnes Element am Ende
    assert find_single_element([9, 10, 9, 11, 10]) == 11

    # Testfall 4: Einzelnes Element in der Mitte
    assert find_single_element([12, 13, 14, 13, 12]) == 14

    # Testfall 5: Größere Zahlen und verschiedene Reihenfolge
    assert find_single_element([101, 102, 103, 101, 102, 105, 105]) == 103

    # Randfall: Minimale Eingabegröße (nur ein Element)
    assert find_single_element([42]) == 42

    # Randfall: Ein einzelnes negatives Element
    assert find_single_element([-10, -20, -10, -30, -20]) == -30

    # Randfall: Ein einzelnes Element bei großen Zahlen
    assert find_single_element([100000, 200000, 100000, 300000, 200000]) == 300000

def test_invalid_input():
    # Randfall: Alle Elemente sind gleich (ungültige Eingabe, aber sollte geprüft werden)
    with pytest.raises(ValueError):
        find_single_element([1, 1, 1, 1, 1])

    # Randfall: Kein einzelnes Element, nur Paare (ungültige Eingabe, aber sollte geprüft werden)
    with pytest.raises(ValueError):
        find_single_element([2, 2, 3, 3, 4, 4])