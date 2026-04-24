class TSP{
	int n = 4;
	int dist[][] = {{0,1,2,3},{2,0,3,4},{4,5,0,5},{3,4,5,0}};
	int dp[][] = new int[16][4];
	int tsp(int mask, int pos) {
		if(mask == (1<<n)-1) {
			return dist[pos][0];
		}
		if(dp[mask][pos] != -1) {
			return dp[mask][pos];
		}
		int ans = Integer.MAX_VALUE;
		
		
		for(int city = 0; city < n; city++){
			
			if((mask & (1 << city)) == 0) {
				int newAns = dist[pos][city] + tsp(mask | (1 << city), city);
				ans = Math.min(ans,  newAns);
			}
		}
		return dp[mask][pos] = ans;
		
	}
	public static void main(String [] args) {
		TSP t = new TSP();
		
		for(int i = 0; i < 16; i++) {
			for(int j = 0; j < 4; j++) {
				t.dp[i][j] = -1;
			}
				
		}
		int res = t.tsp(1, 0);
		System.out.println("the min dist is :"+res);
	}
}


