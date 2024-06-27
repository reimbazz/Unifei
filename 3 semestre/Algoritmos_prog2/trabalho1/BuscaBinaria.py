import random
import time


def merge(left_list, right_list):
    result = []
    i = 0
    j = 0

    while i < len(left_list) and j < len(right_list):
        if left_list[i] <= right_list[j]:
            result.append(left_list[i])
            i += 1
        else:
            result.append(right_list[j])
            j += 1

    # Append remaining elements from either list
    while i < len(left_list):
        result.append(left_list[i])
        i += 1
    while j < len(right_list):
        result.append(right_list[j])
        j += 1

    return result


def merge_sort(data):
    if len(data) <= 1:
        return data

    mid = len(data) // 2
    left_half = merge_sort(data[:mid])
    right_half = merge_sort(data[mid:])

    return merge(left_half, right_half)


def remove_larger_than_target(data, target):
    index = 0
    while index < len(data):
        if data[index] > target:
            data.remove(data[index])
        else:
            index += 1

    return data


def find_pairs(data, target):
    count = 0

    # Remove elements larger than the target from the list
    data = remove_larger_than_target(data, target)

    # Sort the list in ascending order
    data = merge_sort(data)

    # Iterate through the sorted list and find complements
    for i in range(len(data)):
        complement = target - data[i]

        # Check if the complement exists in the remaining part of the sorted list
        if complement in data[i + 1:]:
            count += 1

    return count


size = int(input())
random.seed(size)
data = []

# Create the list with unique random numbers
while len(data) < size:
    num = random.randint(0, 2**17)
    if num not in data:
        data.append(num)

target = random.randint(0, 2**17)

# Ensure target is even (optional, only needed if logic relies on even target)
while target % 2 != 0:
    target = random.randint(0, 2**17)

start_time = time.time()

# Find pairs of numbers that sum up to the target
pair_count = find_pairs(data, target)

end_time = time.time()

print(f"Number of pairs: {pair_count}")
print(f"Execution time: {end_time - start_time:.4f} seconds")
