def read_input(file_name):
	with open(file_name, 'r') as f:
		lines = f.readlines()
	
	start, end = lines[0].strip().split()
	
	h_values = {}
	graph = {}
	for line in lines[1:]:
		parts = line.strip().split()
		if len(parts) != 3:
			continue
		u_full, v_full, w = parts
		w = int(w)
		
		u, h_u = u_full.split('-')
		v, h_v = v_full.split('-')
		h_u, h_v = int(h_u), int(h_v)
		
		if u not in h_values:
			h_values[u] = h_u
		if v not in h_values:
			h_values[v] = h_v
		
		if u not in graph:
			graph[u] = []
		graph[u].append((v, w))
	
	return start, end, graph, h_values

class State:
	def __init__(self, vertex, g, f, path):
		self.vertex = vertex
		self.g = g
		self.f = f
		self.path = path

def branch_and_bound(start, end, graph, h_values):
	cost = float('inf')
	best_path = None
	L = []
	table = []
	
	initial_state = State(start, 0, h_values[start], [start])
	L.append(initial_state)
	
	while True:
		if not L:
			break
		
		u = L.pop(0)
		
		if u.vertex == end:
			if u.g <= cost:
				cost = u.g
				best_path = u.path
				table.append({
					'TT': u.vertex,
					'TTK': f'TTK,tìm được đường đi tạm thời, độ dài {cost}',
					'k(u,v)': '', 'h(v)': '', 'g(v)': '', 'f(v)': '',
					'DS L1': '',
					'Danh sách L': ','.join([f"{s.vertex}{s.f}" for s in L if s.f <= cost])
				})
				L = [s for s in L if s.f <= cost]
				if not L:
					break
			continue
		
		if u.f > cost:
			continue

		L1 = []
		adjacent_states = []
		if u.vertex in graph:
			for v, k in graph[u.vertex]:
				g_v = u.g + k
				f_v = g_v + h_values[v]
				
				new_path = u.path + [v]
				new_state = State(v, g_v, f_v, new_path)
				L1.append(new_state)
				
				adjacent_states.append({
					'vertex': v,
					'k': k,
					'h': h_values[v],
					'g': g_v,
					'f': f_v
				})
		
		L1.sort(key=lambda x: x.f)
		
		if adjacent_states:
			for i, state in enumerate(adjacent_states):
				row = {}
				if i == 0:
					row['TT'] = u.vertex
					row['DS L1'] = ','.join([f"{s.vertex}{s.f}" for s in L1])
					L = [s for s in L if s.f <= cost]
					L = L1 + L
					row['Danh sách L'] = ','.join([f"{s.vertex}{s.f}" for s in L if s.f <= cost])
				else:
					row['TT'] = ''
					row['DS L1'] = ''
					row['Danh sách L'] = ''
				
				row.update({
					'TTK': state['vertex'],
					'k(u,v)': state['k'],
					'h(v)': state['h'],
					'g(v)': state['g'],
					'f(v)': state['f']
				})
				table.append(row)
		else:
			table.append({
				'TT': u.vertex,
				'TTK': '',
				'k(u,v)': '',
				'h(v)': '',
				'g(v)': '',
				'f(v)': '',
				'DS L1': '',
				'Danh sách L': ','.join([f"{s.vertex}{s.f}" for s in L if s.f <= cost])
			})
	
	return table, best_path, cost

def write_output(table, path, cost):
    with open('output.txt', 'w', encoding='utf-8') as f:
        f.write("Bảng các bước thực hiện thuật toán:\n")
        f.write(
            f"{'TT'.ljust(8)}{'TTK'.ljust(60)}{'k(u,v)'.ljust(8)}{'h(v)'.ljust(8)}"
            f"{'g(v)'.ljust(8)}{'f(v)'.ljust(8)}{'DS L1'.ljust(40)}{'Danh sách L'.ljust(40)}\n"
        )
        
        for row in table:
            f.write(
                f"{str(row['TT']).ljust(8)}{str(row.get('TTK', '')).ljust(60)}"
                f"{str(row.get('k(u,v)', '')).ljust(8)}{str(row.get('h(v)', '')).ljust(8)}"
                f"{str(row.get('g(v)', '')).ljust(8)}{str(row.get('f(v)', '')).ljust(8)}"
                f"{str(row.get('DS L1', '')).ljust(40)}{str(row.get('Danh sách L', '')).ljust(40)}\n"
            )
        
        f.write("\nĐường đi từ trạng thái đầu => trạng thái kết thúc: " + " -> ".join(path) + "\n")
        f.write(f"Chi phí: {cost}\n")

def main():
	start, end, graph, h_values = read_input('./input.txt')
	
	table, path, cost = branch_and_bound(start, end, graph, h_values)
	
	write_output(table, path, cost)

if __name__ == "__main__":
	main()