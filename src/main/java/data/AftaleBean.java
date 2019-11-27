package data;

public class AftaleBean {
    private String dato;
    private String type;
    private String sygehus;
    private String kommentar;
    private String cpr;
    private int varighed;
    private int id;

    public String getCpr() {
        return cpr;
    }
    public void setCpr(String newCpr) {
        this.cpr = newCpr;
    }

    public String getDato() {
        return dato;
    }
    public void setDato(String newDato) {
        this.dato = newDato;
    }

    public String getKommentar() {
        return kommentar;
    }
    public void setKommentar(String newKommentar) {
        this.kommentar = newKommentar;
    }

    public String getSygehus() {
        return sygehus;
    }
    public void setSygehus(String newSygehus) {
        this.sygehus = newSygehus;
    }

    public String getType() {
        return type;
    }
    public void setType(String newType) {
        this.type = newType;
    }

    public int getVarighed() { return varighed; }
    public void setVarighed(int newVarighed) {
        this.varighed = newVarighed;
    }

    public int getId() { return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}