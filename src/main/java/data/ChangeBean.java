package data;

public class ChangeBean {
    private String dato;
    private int varighed;
    private int tid;

    public void setDato(String dato) {
        this.dato = dato;
    }
    public void setVarighed(int varighed) {
        this.varighed = varighed;
    }
    public void setTid ( int tid ) {this.tid = tid; }

    public int getVarighed() {
        return varighed;
    }
    public String getDato() {
        return dato;
    }
    public int getTid() { return tid; }


}
