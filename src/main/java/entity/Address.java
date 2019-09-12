package entity;
import javax.persistence.*;


@Entity (name="Address")
@Table (name = "address")
public class Address {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //@SequenceGenerator(name = "address_seq", sequenceName = "address_seq")
    @OneToOne (mappedBy="st_id", cascade=CascadeType.ALL)
    private int st_id;

    @Column(name="ad_street")
    private String street;

    @Column(name="ad_number")
    private short number;

    @Column(name="ad_postal")
    private String postal;

    @ManyToOne(cascade = {CascadeType.ALL})
    @JoinColumn (name="ad_province")
    private Province province;

    public Address(String street, short number, String postal, Province province) {
        this.street = street;
        this.number = number;
        this.postal = postal;
        this.province = province;
    }

    public int getSt_id() {
        return st_id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public short getNumber() {
        return number;
    }

    public void setNumber(short number) {
        this.number = number;
    }

    public String getPostal() {
        return postal;
    }

    public void setPostal(String postal) {
        this.postal = postal;
    }

    public Province getProvince() {
        return province;
    }

    public void setProvince(Province province) {
        this.province = province;
    }


}