def assign_value(destination_list, dest_index, source_list, src_index):
    """
    Assigns the value from source_list[src_index] to destination_list[dest_index].

    Args:
        destination_list (list): The list to which the value is assigned.
        dest_index (int): The index in the destination list where the value is assigned.
        source_list (list): The list from which the value is taken.
        src_index (int): The index in the source list from which the value is taken.
    """
    destination_list[dest_index] = source_list[src_index]


def merge_sort(input_list):
    """
    Sorts a list in ascending order using the merge sort algorithm.

    Args:
        input_list (list): The list to be sorted.

    Returns:
        list: The sorted list.
    """
    if len(input_list) > 1:
        mid = len(input_list) // 2
        left_half = input_list[:mid]
        right_half = input_list[mid:]

        # Recursively sort both halves
        merge_sort(left_half)
        merge_sort(right_half)

        i = j = k = 0

        # Merge the sorted halves
        while i < len(left_half) and j < len(right_half):
            if left_half[i] <= right_half[j]:
                input_list[k] = left_half[i]
                i += 1
            else:
                input_list[k] = right_half[j]
                j += 1
            k += 1

        # Copy remaining elements of left_half, if any
        while i < len(left_half):
            input_list[k] = left_half[i]
            i += 1
            k += 1

        # Copy remaining elements of right_half, if any
        while j < len(right_half):
            input_list[k] = right_half[j]
            j += 1
            k += 1

    return input_list


def visualize_sorting(input_list):
    """
    Visualizes the sorting process using matplotlib.

    Args:
        input_list (list): The list to be sorted and visualized.
    """
    import matplotlib.pyplot as plt

    x = range(len(input_list))
    
    # Plot the unsorted list
    plt.plot(x, input_list, label='Unsorted')
    plt.legend()
    plt.show()

    # Sort the list
    sorted_list = merge_sort(input_list)

    # Plot the sorted list
    plt.plot(x, sorted_list, label='Sorted')
    plt.legend()
    plt.show()


# Example usage
if __name__ == "__main__":
    example_list = [54, 26, 93, 17, 77, 31, 44, 55, 20]
    visualize_sorting(example_list)
