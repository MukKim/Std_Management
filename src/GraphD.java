import java.io.*; 
import java.util.*; 
  
class GraphD 
{ 

	int time = 0;
	private int V; 
	private LinkedList<Integer> adj[]; 

	int alpha = 97;
	char[] ch;
	int first[];
	int second[];

  

    GraphD(int v) 
    { 
        V = v; 
        adj = new LinkedList[v]; 
        ch = new char[v];
        for (int i=0; i<v; ++i) 
            adj[i] = new LinkedList(); 
    	for (int i = 0 ; i < v ; i++) {
			ch[i] = (char)alpha;
			alpha++;
		}	
    } 
  
 
    void addEdge(int v, int w) 
    { 
        adj[v].add(w);  
    } 

    
    void DFSexe(int v,int color[]) 
    { 
    
    	color[v] = 1;
    	time = time + 1;
    	first[v] = time;
    	
    
  
    
        Iterator<Integer> i = adj[v].listIterator(); 
        while (i.hasNext()) 
        { 
            int n = i.next(); 
            if (color[n] == 0) 
                DFSexe(n,color); 
        }
        color[v] = 2;
        time = time + 1;
        second[v] = time;
       
    } 
  
    void DFS() 
    { 
    	
        boolean visited[] = new boolean[V]; 
        
		int color[] = new int[V];
		// color 0:white, 1:gray, 2:black
		
		first = new int[V];
		second = new int[V];
		
		for (int i = 0; i < V ; i++) {
			color[i] = 0;
			first[i] = Integer.MAX_VALUE;
			second[i] = Integer.MAX_VALUE;
		}

	
        for (int i=0; i<V; ++i) 
            if (color[i] == 0) 
                DFSexe(i, color); 
    }
    
    
	String print() {
		
		String str = "";
		
		for(int i = 0 ; i < V ; i++) {
			System.out.println(ch[i] + " " + first[i] + " " + second[i]);
			str += ch[i] + " " + first[i] + " " + second[i] + "\n";
		}
		
		return str;
		
	}
	
	
  
} 
