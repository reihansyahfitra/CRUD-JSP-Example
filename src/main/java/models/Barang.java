package models;
public class Barang {
    private String id, nama, jumlah;

    public Barang(String id, String nama, String jumlah) {
        this.id = id;
        this.nama = nama;
        this.jumlah = jumlah;
    }

    public String getId() {
        return id;
    }

    public String getNama() {
        return nama;
    }

    public String getJumlah() {
        return jumlah;
    }
}
