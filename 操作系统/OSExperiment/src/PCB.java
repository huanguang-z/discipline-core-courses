public class PCB {
    public int arriveTime;
    public int memory;
    public int needTime;
    public String name;
    public boolean flag;
    public Memory me = new Memory();

    public PCB(int arriveTime, int memory, int needTime, String name, boolean flag, Memory me) {
        this.arriveTime = arriveTime;
        this.memory = memory;
        this.needTime = needTime;
        this.name = name;
        this.flag = flag;
        this.me = me;
    }

    public PCB() {
    }

    public int getArriveTime() {
        return arriveTime;
    }

    public void setArriveTime(int arriveTime) {
        this.arriveTime = arriveTime;
    }

    public int getMemory() {
        return memory;
    }

    public void setMemory(int memory) {
        this.memory = memory;
    }

    public int getNeedTime() {
        return needTime;
    }

    public void setNeedTime(int needTime) {
        this.needTime = needTime;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
