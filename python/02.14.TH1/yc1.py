# Number of people and rounds
num_people = 4
num_rounds = 6

# Initialize scores with the provided input
scores = [
    [7, 5, 1, 1, 20, 20],
    [2, 3, 2, 3, 7, 20],
    [2, 7, 6, 5, 5, 20],
    [2, 2, 1, 2, 6, 20]
]

# Print the scores for each person
for person in range(num_people):
    print(f"Scores for person {person + 1}: {scores[person]}")

# Calculate and print the total scores for each person
for person in range(num_people):
    total_score = sum(scores[person])
    print(f"Total score for person {person + 1}: {total_score}")
