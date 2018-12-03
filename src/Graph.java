import java.io.*;
import java.util.*;

public class Graph {

	private char start;
	private int V; // No. of vertices
	private LinkedList<Integer> adj[]; 
	int alpha = 97;
	char[] ch;
	int rank[];
		// Constructor
	Graph(int v) {
		V = v;
		adj = new LinkedList[v];
		ch = new char[v];
		for (int i = 0; i < v; ++i)
			adj[i] = new LinkedList();
		for (int i = 0 ; i < v ; i++) {

			ch[i] = (char)alpha;
			alpha++;
		}
	}


	void addEdge(int v, int w) {
		adj[v].add(w);
	}


	void BFS(int s) {
		start = ch[s];
		
		int color[] = new int[V];
		// color 0:white, 1:gray, 2:black
		
		rank = new int[V];

		for (int i = 0; i < rank.length; i++) {
			color[i] = 0;
			rank[i] = Integer.MAX_VALUE;
		}
		
		
		LinkedList<Integer> queue = new LinkedList<Integer>();

		color[s] = 1;
		rank[s] = 0;
		queue.add(s);
		

		
		while (queue.size() != 0) {
	
			s = queue.poll();


			Iterator<Integer> i = adj[s].listIterator();

			while (i.hasNext()) {
				int n = i.next();
				if (color[n] == 0) {
					color[n] = 1;
					rank[n] = rank[s]+1;
					queue.add(n);
				}
			}
			
			// black
			color[s] = 2;
		}
	}
	
	String print() {
		
		String str = "";
		
		System.out.println("start : " + start);
		str += "start : " + start  + "\n";
		for(int i = 0 ; i < V ; i++) {
			System.out.println(ch[i] + " " + rank[i]);
			str += ch[i] + " " + rank[i]  +"\n";
		}
		return str;
		
	}

}
