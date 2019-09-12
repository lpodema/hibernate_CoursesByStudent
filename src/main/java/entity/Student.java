package entity;
import javax.persistence.*;
import java.util.Date;


@Entity (name="Student")
@Table (name = "student")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "student_seq")
    @SequenceGenerator(name = "student_seq", sequenceName = "student_seq")
    @Column(name = "st_id")
    private Long personId;

    @Column(name = "st_name")
    private String firstName;

    @Column(name = "st_lastName")
    private String lastName;

    @Column(name = "st_dni")
    private int dni;

    @Column(name = "st_birthDate")
    private Date birthDate = new Date();

    @Column(name = "st_email")
    private String email;

    @Column(name = "st_phone")
    private String phone;

    @OneToOne(cascade = {CascadeType.ALL})
    @JoinTable(name = "address",
            joinColumns = {@JoinColumn(name = "st_id")},
            inverseJoinColumns = {@JoinColumn(name = "st_id")})
    private Address address;


    public Student(String firstName, String lastName, int dni, int a, int b, int c, String email, String phone, Address address) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.dni = dni;
        this.birthDate.setYear(a);
        this.birthDate.setMonth(b);
        this.birthDate.setDate(c);
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public Student(String firstName, String lastName, int dni) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.dni = dni;
    }

    public Long getPersonId() {
        return personId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(int a, int b, int c) {
        this.birthDate.setYear(a);
        this.birthDate.setMonth(b);
        this.birthDate.setDate(c);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }


}