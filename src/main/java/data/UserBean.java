package data;

public class UserBean {
    private String  fornavn;
    private String  efternavn;
    private String  cpr;
    private String  kode;
    private boolean godkend;

    public String getFornavn() {
        return this.fornavn;
    }
    public void setFornavn(String newFornavn) {
        this.fornavn = newFornavn;
    }

    public String getEfternavn() {
        return this.efternavn;
    }
    public void setEfternavn(String newEfternavn) {
        this.efternavn = newEfternavn;
    }

    public String getCpr() {
        return this.cpr;
    }
    public void setCpr(String newCpr) {
        this.cpr = newCpr;
    }

    public String getKode() {
        return this.kode;
    }
    public void setKode(String newKode) {
        this.kode = newKode;
    }

    public boolean isGodkend() {
        return this.godkend;
    }
    public void setGodkend(boolean newGodkend) {
        this.godkend = newGodkend;
    }
}