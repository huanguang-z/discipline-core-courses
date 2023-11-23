import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException{
        List<PCB> pcb = new ArrayList<>();
        PCBOperation pcbOperation = new PCBOperation();
        pcbOperation.readtxt(pcb);
    }
}
