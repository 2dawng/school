import os

# Read the input file and create the graph


def read_graph(file_path):
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"No such file or directory: '{file_path}'")

    with open(file_path, 'r') as file:
        lines = file.readlines()

    start_node = None
    end_node = None
    edges = []

    for line in lines:
        line = line.strip()
        if not line:
            continue
        parts = line.split()
        if len(parts) == 2 and parts[0].lower() == "start":
            start_node = parts[1]
        elif len(parts) == 2 and parts[0].lower() == "end":
            end_node = parts[1]
        elif '->' in line:
            edges.append(line.split(' -> '))

    if start_node is None or end_node is None:
        raise ValueError("Start or End node not specified in the input file")

    graph = {}
    for edge in edges:
        if len(edge) == 2:
            if edge[0] not in graph:
                graph[edge[0]] = []
            graph[edge[0]].append(edge[1])
        else:
            print(f"Skipping invalid line: {' -> '.join(edge)}")

    return graph, start_node, end_node

# DFS implementation with visualization


def dfs(graph, start, end, path=None, visited=None, output_file=None):
    if path is None:
        path = []
    if visited is None:
        visited = set()

    path.append(start)
    visited.add(start)

    # Visualization print
    if output_file:
        output_file.write(f"| Visiting      | {start:<4} | {
                          ' -> '.join(path):<20} |\n")
    else:
        print(f"Visiting: {start}, Path: {' -> '.join(path)}")

    if start == end:
        return path

    for neighbor in graph.get(start, []):
        if neighbor not in visited:
            result = dfs(graph, neighbor, end, path, visited, output_file)
            if result:
                return result

    path.pop()
    # Visualization print
    if output_file:
        output_file.write(f"| Backtracking  | {start:<4} | {
                          ' -> '.join(path):<20} |\n")
    else:
        print(f"Backtracking from: {start}, Path: {' -> '.join(path)}")
    return None


def main():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    input_file_path = os.path.join(script_dir, 'input.txt')
    output_file_path = os.path.join(script_dir, 'output.txt')

    try:
        graph, start_node, end_node = read_graph(input_file_path)
        with open(output_file_path, 'w') as output_file:
            output_file.write(
                "+---------------+------+----------------------+\n")
            output_file.write(
                "| Action        | Node | Path                 |\n")
            output_file.write(
                "+---------------+------+----------------------+\n")

            path = dfs(graph, start_node, end_node, output_file=output_file)

            output_file.write(
                "+---------------+------+----------------------+\n")

            if path:
                output_file.write(f"Path found: {' -> '.join(path)}\n")
            else:
                output_file.write("No path found\n")
    except (FileNotFoundError, ValueError) as e:
        print(e)


if __name__ == "__main__":
    main()
