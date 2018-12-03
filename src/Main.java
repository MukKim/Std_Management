import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class Main {

	public static void main(String[] args) throws IOException {

		int rownumber = 0;
		int init = 0;
		int vertexnum = 0;
		int[][] connect = new int[0][0];

		FileWriter bw = null;

		BufferedReader br = new BufferedReader(new FileReader("C:/graph.txt"));

		while (true) {
			String line = br.readLine();
			if (line == null)
				break;

			if (rownumber == 0) {
				vertexnum = Integer.valueOf(line);
			}

			if (init == 0) {
				connect = new int[vertexnum][vertexnum];
				init = 1;
			}

			if (rownumber != 0) {
				String[] line1 = line.split(" ");

				for (int i = 0; i < vertexnum; i++) {
					connect[rownumber - 1][i] = Integer.valueOf(line1[i]);
				}
			}
			rownumber++;

		}

		Graph example = new Graph(vertexnum);
		GraphD example2 = new GraphD(vertexnum);

		for (int i = 0; i < vertexnum; i++) {
			for (int j = 0; j < vertexnum; j++) {
				if (connect[i][j] == 1) {
					example.addEdge(i, j);
					example2.addEdge(i, j);
				}
			}
		}

		try {
			BufferedWriter fw = new BufferedWriter(new FileWriter(new File("BFSout.txt")));
			BufferedWriter fw2 = new BufferedWriter(new FileWriter(new File("DFSOut1.txt")));

			example.BFS(0);
			System.out.println("=========== BFS ===========");
			String bfs = example.print();

			System.out.println();

			example2.DFS();
			System.out.println("=========== DFS ===========");
			String dfs = example2.print();

			
			String[] printbfs = bfs.split("\n");
			String[] printdfs = dfs.split("\n");
			
			for(int i = 0 ; i < printbfs.length ; i++) {
				fw.write(printbfs[i]);
				fw.newLine();
			}
			
			for(int i = 0 ; i < printdfs.length ; i++) {
				fw2.write(printdfs[i]);
				fw2.newLine();
			}
			

			fw.flush();
			fw.close();

			fw2.flush();
			fw2.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
