package data;

public class UserBean {

    private String fornavn;
    private String efternavn;
    private String cpr;
    private String kode;
    private boolean godkend;

    public String getFornavn() {
        return this.fornavn;
    }

    public void setFornavn(String newFornavn) {
        fornavn = newFornavn;
    }

    public String getEfternavn() {
        return this.efternavn;
    }

    public void setEfternavn(String newEfternavn) {
        efternavn = newEfternavn;
    }

    public String getCpr() {
        return this.cpr;
    }

    public void setCpr(String newCpr) {
        cpr = newCpr;
    }

    public String getKode() {
        return this.kode;
    }

    public void setKode(String newKode) {
        kode = newKode;
    }

    public boolean isGodkend() {
        return this.godkend;
    }

    public void setGodkend(boolean newGodkend) {
        godkend = newGodkend;
    }
}
