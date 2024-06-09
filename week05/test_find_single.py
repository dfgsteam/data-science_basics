# test_find_single.py
import pytest
from find_single import find_single_element

def test_single_element():
    assert find_single_element([1, 2, 3, 4, 3, 1, 2]) == 4
    assert find_single_element([5, 5, 7, 7, 9]) == 9
    assert find_single_element([10, 10, 20]) == 20
    assert find_single_element([99, 98, 98, 99, 100]) == 100
    assert find_single_element([11, 22, 33, 44, 55, 33, 22, 11, 44]) == 55

def test_single_element_empty():
    with pytest.raises(ValueError):
        find_single_element([])

def test_single_element_invalid_input():
    with pytest.raises(TypeError):
        find_single_element(["a", 2, 3, 2, 3])

if __name__ == "__main__":
    pytest.main()
