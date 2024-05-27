import matplotlib.pyplot as plt

def assignment(new_list, i, old_list, j):
    """Assigns the value from old_list[j] to new_list[i]."""
    new_list[i] = old_list[j]


def merge_sort(list_to_sort):
    """
    Sorts the list using the merge sort algorithm.

    Args:
        list_to_sort: The list to be sorted.
    """
    if len(list_to_sort) > 1:
        mid = len(list_to_sort) // 2
        left = list_to_sort[:mid]
        right = list_to_sort[mid:]

        merge_sort(left)
        merge_sort(right)

        l = 0
        r = 0
        i = 0

        while l < len(left) and r < len(right):
            if left[l] <= right[r]:
                assignment(new_list=list_to_sort, i=i, old_list=left, j=l)
                l += 1
            else:
                assignment(new_list=list_to_sort, i=i, old_list=right, j=r)
                r += 1
            i += 1

        while l < len(left):
            list_to_sort[i] = left[l]
            l += 1
            i += 1

        while r < len(right):
            list_to_sort[i] = right[r]
            r += 1
            i += 1


# Visualize the list before and after sorting
my_list = [54, 26, 93, 17, 77, 31, 44, 55, 20]

# Plot the original list
plt.plot(range(len(my_list)), my_list)
plt.title("Original List")
plt.show()

# Sort the list using merge sort
merge_sort(my_list)

# Plot the sorted list
plt.plot(range(len(my_list)), my_list)
plt.title("Sorted List")
plt.show()
