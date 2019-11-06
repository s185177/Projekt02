package aft;

public class AftaleBean {

    private String dato;
    private String type;
    private String sygehus;
    private String kommentar;
    private String cpr;
    private int varighed;


    public String getCpr() {
        return cpr;
    }

    public String getDato() {
        return dato;
    }

    public String getKommentar() {
        return kommentar;
    }

    public String getSygehus() {
        return sygehus;
    }

    public String getType() {
        return type;
    }

    public int getVarighed() { return varighed; }

    public void setCpr(String cpr) {
        this.cpr = cpr;
    }

    public void setDato(String dato) {
        this.dato = dato;
    }

    public void setKommentar(String kommentar) {
        this.kommentar = kommentar;
    }

    public void setSygehus(String sygehus) {
        this.sygehus = sygehus;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setVarighed(int varighed) {
        this.varighed = varighed;
    }
}
