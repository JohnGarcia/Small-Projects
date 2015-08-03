// John Garcia
// Csci 176 Program Assignment 2
// 3/04/14

// This program briefly implements the readers/writers 
// problem using Java Threads.
// Each writer must have exclusive access to the file (file is a shared resource)
// Any number of readers may read the file as long as no writer is using it.
// A reader is denied access to the file only if a writer is using it.

public class rw {	// main class
	static rwfile rwf = new rwfile();	// create shared resource read-write-file
	
	public static void main(String args[]){
		for(int i = 1; i <= 6; i++){	// make 6 reader threads and 6 writer threads
			rprocess r = new rprocess(i, rwf);	// make reading threads
			wprocess w = new wprocess(i, rwf);	// make writing threads
			r.start();	// run the reading threads
			w.start();	// run the writing threads
		}
	}
}

class rwfile{	// monitor for the shared resource read-write-file
	private static int NR = 0;	// reader counter
	private static int NW = 0;	// writer counter
	
	public synchronized void start_read(int id){	// process to start a threads reading
		while(NW > 0){	// must wait to read if a writer has access before hand
			try{wait();}
			catch(InterruptedException e){
				System.out.println("Exception " + e.getMessage());
			}
		}
		
		NR = NR +1;	// update the number of readers currently reading
		System.out.println("Rprocess #" +id+ " start-read");
		System.out.println("Rprocess #" +id+ " is reading");		
	}
	
	public synchronized void end_read(int id){	// process to end a threads reading
		NR = NR - 1;	// update the number of readers currently reading
		
		System.out.println("Rprocess #" +id+ " end_read");
		
		notify();
	}
	
	public synchronized void write(int id){
		if(NR > 0){	// display "waiting" if there is a reader with access before hand
			System.out.println("Wprocess #" +id+ " is waiting");
		}
		
		while(NR > 0){	// wait if there is a reader with access before hand
			try{wait();}
			catch(InterruptedException e){
				System.out.println("Exception " + e.getMessage());
			}
		}
		
		System.out.println("Wprocess #" +id+ " is writing");
		System.out.println("Wprocess #" +id+ " finished writing");
		
		notify();
	}
}

class rprocess extends Thread{	// for reader process (making a reader thread)
	static rwfile rwf;	// an object of rwfile
	private int id;		// acts as the id number for the threads (index)
	
	public rprocess(int i, rwfile rwf){	// constructor
		this.rwf = rwf;
		id = i;
		System.out.println("Thread for rprocess #" +id+ " created");
	}
	
	public void run(){	// running the reader thread
		try{sleep((int)(Math.random()*2000));	// yield turn
		rwf.start_read(id);
		}
		catch(InterruptedException e){
			System.out.println("Exception " + e.getMessage());
		}
		
		try{sleep((int)(Math.random()*2000));	// yield turn
		rwf.end_read(id);
		}
		catch(InterruptedException e){
			System.out.println("Exception " + e.getMessage());
		}
		
		System.out.println("Rprocess #" +id+ " terminates");	// terminate reader thread
	}
}

class wprocess extends Thread{	// for writer process (making a writer thread)
	static rwfile rwf;	// an object of rwfile
	private int id;		// acts as the id number for the threads (index)
	
	public wprocess(int i, rwfile rwf){	// constructor
		this.rwf = rwf;
		id = i;
		
		System.out.println("Thread for wprocess #" +id+ " created");
	}
	
	public void run(){	// running the writer thread
		try{sleep((int)(Math.random()*2000));	// yield turn
		rwf.write(id);
		}
		catch(InterruptedException e){
			System.out.println("Exception " + e.getMessage());
		}
		
		System.out.println("Wprocess #" +id+ " terminates");	// terminate writer thread
	}
}