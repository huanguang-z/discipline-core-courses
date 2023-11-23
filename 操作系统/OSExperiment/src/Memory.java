public class Memory {
    int address;
    int memory;
    public Memory(int address, int memory) {
        this.address = address;
        this.memory = memory;
    }

    public Memory() {
    }

    public int getAddress() {
        return address;
    }

    public void setAddress(int address) {
        this.address = address;
    }

    public int getMemory() {
        return memory;
    }

    public void setMemory(int memory) {
        this.memory = memory;
    }

}
