import java.io.*;
import java.util.*;
public class PCBOperation {
    int totalMemory=1600;
    List<PCB> temp = new ArrayList<>();

    public void readtxt(List<PCB> pcb) throws IOException {
        BufferedReader br = null;
        Reader fr = null;
        try {
            fr = new FileReader("C:\\Java\\OSExperiment\\table.txt");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        br = new BufferedReader(fr);
        String str;
        while ((str = br.readLine()) != null) {
            int at;
            int nt;
            int me;
            String na;
            String[] nowEntry;
            if (str.startsWith("")) {
                str = str.substring(1);
            }//排除异常
            if (str.endsWith(" ")) {
                for (int i = str.length() - 1; i >= 0; i--) {
                    if (str.charAt(i) == ' ') {
                        str = str.substring(0, i);
                    } else {
                        break;
                    }
                }
            }
            String[] parts = str.split(" ");
            na = parts[0];
            at = Integer.valueOf(parts[1]);
            nt = Integer.valueOf(parts[2]);
            me = Integer.valueOf(parts[3]);
            PCB p = new PCB(at,me,nt,na,false,null);
            pcb.add(p);
        }
        Display(pcb);
    }
    public void Display(List<PCB> pcb){
        System.out.println("名称  到达时间  服务时长  所占内存");
        for(PCB p:pcb){
            System.out.println(p.name + "   "+p.arriveTime + "        " + p.needTime + "        " + p.memory);
        }
        System.out.println("目前存在的进程如上所示，请输入您的选择：");
        while (true){
            System.out.println("0.无操作进入下一步");
            System.out.println("1.增加进程");
            System.out.println("2.阻塞进程");
            System.out.println("3.唤醒进程");
            System.out.println("4.终止进程");
            Scanner sc = new Scanner(System.in);
            String s = sc.next();
            switch (s){
                case "0":break;
                case "1":
                    System.out.println("请您按要求添加进程的所有信息");
                    System.out.println("请输入进程名称：");
                    String sname = sc.next();
                    boolean a=false;
                    for(PCB b:pcb){
                        if(b.name.equals(sname)){
                            System.out.println("输入进程名称重复，请重新输入！");
                            break;
                        }
                    }
                    if(a==true){
                        break;
                    }
                    System.out.println("请输入进程到达时间：");
                    int at = sc.nextInt();
                    System.out.println("请输入进程运行时长：");
                    int nt = sc.nextInt();
                    System.out.println("请输入进程所占内存大小：");
                    int me = sc.nextInt();
                    PCB pcb1 = new PCB(at,me,nt,sname,false,null);
                    boolean flag=false;
                    for(int i=0;i<pcb.size();i++){
                        if(pcb1.arriveTime>=pcb.get(i).arriveTime&&pcb1.arriveTime<pcb.get(i+1).arriveTime){
                            pcb.add(i+1,pcb1);
                            flag=true;
                            break;
                        }
                    }
                    if(!flag){
                        if(pcb1.arriveTime<pcb.get(0).arriveTime){
                            pcb.add(0,pcb1);
                        }
                        else{
                            pcb.add(pcb1);
                        }
                    }
                    System.out.println("添加成功，以下是目前进程的情况：");
                    for(PCB p:pcb){
                        System.out.println(p.name + "   "+p.arriveTime + "        " + p.needTime + "        " + p.memory);
                    }
                    break;
                case "2":
                    System.out.println("请输入你要阻塞的进程");
                    String sn = sc.next();
                    PCB t = null;
                    for (int i=0;i<pcb.size();i++){
                        if(pcb.get(i).name.equals(sn)){
                            t=pcb.remove(i);
                            temp.add(t);
                            break;
                        }
                    }
                    if(t==null){
                        System.out.println("输入有误，请重新输入！");
                        break;
                    }
                    totalMemory -= t.memory;
                    System.out.println(t.name + "已阻塞，目前就绪队列中的进程如下:");
                    for(PCB p:pcb){
                        System.out.println(p.name + "   "+p.arriveTime + "        " + p.needTime + "        " + p.memory);
                    }
                    break;
                case "3":
                    if(temp.size()==0){
                        System.out.println("当前不存在就绪进程！");
                        break;
                    }
                    System.out.println("请输入想要唤醒的进程：");
                    String snn = sc.next();
                    PCB t2 = null;
                    for (int i = 0; i < temp.size(); i++) {
                        if(temp.get(i).name.equals(snn)){
                            t2 = temp.remove(i);
                            break;
                        }
                    }
                    if(t2==null){
                        System.out.println("输入有误，请重新输入！");
                        break;
                    }
                    boolean flag1=false;
                    for(int i=0;i<pcb.size()-1;i++){
                        if(t2.arriveTime>=pcb.get(i).arriveTime&&t2.arriveTime<pcb.get(i+1).arriveTime){
                            pcb.add(i+1,t2);
                            flag1=true;
                            break;
                        }
                    }
                    if(!flag1){
                        if(t2.arriveTime<pcb.get(0).arriveTime){
                            pcb.add(0,t2);
                        }
                        else{
                            pcb.add(t2);
                        }
                    }
                    totalMemory += t2.memory;
                    System.out.println("唤醒成功，下面是目前进程情况：");
                    for(PCB p:pcb){
                        System.out.println(p.name + "   "+p.arriveTime + "        " + p.needTime + "        " + p.memory);
                    }
                    break;
                case "4":
                    System.out.println("请输入你要移除的进程：");
                    Scanner scanner4 = new Scanner(System.in);
                    String ss = scanner4.next();
                    boolean f = false;
                    for (PCB c:pcb){
                        if (c.name.equals(ss)){
                            pcb.remove(c);
                            f = true;
                            break;
                        }
                    }
                    if(f==false){
                        System.out.println("输入有误，请重新输入！");
                        break;
                    }
                    System.out.println("移除成功，以下是目前进程的情况：");
                    for(PCB p:pcb){
                        System.out.println(p.name + "   "+p.arriveTime + "        " + p.needTime + "        " + p.memory);
                    }
            }
            if(s.equals("0")){
                break;
            }
        }
        while (true) {
            System.out.println("是否启动文件中的进程（y/n）");
            Scanner sc = new Scanner(System.in);
            String s = sc.next();
            if(s.equals("y")||s.equals("Y")){
                run(pcb);
                break;
            }else if(s.equals("n")||s.equals("N")){
                return;
            }else {
                System.out.println("输入有误！");
            }
        }
    }
    void run(List<PCB> pcb){
        int arriveTime=0;
        int endTime=0;
        Deque<PCB> queue = new ArrayDeque<>();
        for(PCB p:pcb){
            queue.addLast(p);
        }
        PCB p;
        int address=0;
        Memory me = new Memory();
        while (queue.peek()!=null){
            p=queue.pollFirst();
            arriveTime = Math.max(p.arriveTime,endTime);
            endTime = arriveTime+p.needTime;
            if(p.flag == false){
                totalMemory -= p.memory;
                address+=p.memory;
                me.address = address;
                me.memory = p.memory;
                p.me = me;
            }
            p.flag = true;
            for(PCB b:queue){
                if(endTime > b.arriveTime&&b.flag == false){
                    Memory m = new Memory();
                    b.flag = true;
                    totalMemory-=b.memory;
                    address+=b.memory;
                    m.address=address;
                    m.memory=b.memory;
                    b.me=m;
                }
            }
            if(totalMemory<0){
                System.out.println("内存不够");
                return;
            }

            System.out.println(p.name+"到达时间："+p.arriveTime+"  "+p.name+"终止时间："+endTime+"  运行过程中剩余内存"+totalMemory + "  地址："+p.me.address);
            totalMemory+=p.memory;
        }
        while (true) {
            if(temp.size()!=0){
                System.out.println("目前还有进程处在阻塞状态，是否释放(y/n)");
                Scanner scanner = new Scanner(System.in);
                String s = scanner.next();
                if(s.equals("y")||s.equals("Y")){
                    for (PCB c:temp){
                        arriveTime = Math.max(c.arriveTime,endTime);
                        endTime = arriveTime+c.needTime;
                        System.out.println(c.name+"到达时间："+c.arriveTime+"  "+c.name+"终止时间："+endTime+"  运行过程中剩余内存"+totalMemory+ "  地址："+me.address);
                        totalMemory+=c.memory;
                    }
                    return;
                }else if(s.equals("n")||s.equals("N")){
                    System.out.println("程序结束");
                    return;
                }else {
                    System.out.println("输入有误，请重新输入！");
                }
            }
            return;
        }
    }
}
